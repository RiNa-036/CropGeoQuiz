package com.cropquiz.servlet;

import com.cropquiz.dao.PlayerDAO;
import com.cropquiz.model.Player;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.net.URLEncoder;
import java.util.List;

@WebServlet("/players")
public class PlayerServlet extends HttpServlet {

    private PlayerDAO playerDAO;

    @Override
    public void init() {
        playerDAO = new PlayerDAO();
    }

    // ================= GET =================

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {

            case "edit":
                showEditForm(request, response);
                break;

            case "delete":
                deletePlayer(request, response);
                break;

            default:
                listPlayers(request, response);
                break;
        }
    }

    // ================= POST =================

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String action = request.getParameter("action");

        if ("update".equals(action)) {

            updatePlayer(request, response);

        } else if ("startQuiz".equals(action)) {

            startQuiz(request, response);

        } else {

            addPlayer(request, response);
        }
    }

    // ================= READ =================

    private void listPlayers(HttpServletRequest request,
                             HttpServletResponse response)
            throws ServletException, IOException {

        List<Player> players = playerDAO.getAllPlayers();

        request.setAttribute("players", players);

        request.getRequestDispatcher("/players.jsp")
                .forward(request, response);
    }

    // ================= CREATE =================

    private void addPlayer(HttpServletRequest request,
                           HttpServletResponse response)
            throws IOException {

        String name = request.getParameter("name");
        String district = request.getParameter("district");
        String upazila = request.getParameter("upazila");

        Player player = new Player(
                name,
                district,
                upazila
        );

        playerDAO.addPlayer(player);

        response.sendRedirect("players");
    }

    // ================= START QUIZ =================

    private void startQuiz(HttpServletRequest request,
                           HttpServletResponse response)
            throws IOException {

        String name = request.getParameter("name");
        String district = request.getParameter("district");
        String upazila = request.getParameter("upazila");

        Player player = new Player(
                name,
                district,
                upazila
        );

        // Save player information
        playerDAO.addPlayer(player);

        // Send player information to QuizServlet
        String encodedName =
                URLEncoder.encode(name, "UTF-8");

        String encodedDistrict =
                URLEncoder.encode(district, "UTF-8");

        String encodedUpazila =
                URLEncoder.encode(upazila, "UTF-8");

        response.sendRedirect(
                "quiz?name=" + encodedName
                        + "&district=" + encodedDistrict
                        + "&upazila=" + encodedUpazila
        );
    }

    // ================= SHOW EDIT FORM =================

    private void showEditForm(HttpServletRequest request,
                              HttpServletResponse response)
            throws ServletException, IOException {

        int id = Integer.parseInt(
                request.getParameter("id")
        );

        Player player =
                playerDAO.getPlayerById(id);

        request.setAttribute(
                "player",
                player
        );

        request.getRequestDispatcher(
                "/editPlayer.jsp"
        ).forward(request, response);
    }

    // ================= UPDATE =================

    private void updatePlayer(HttpServletRequest request,
                              HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(
                request.getParameter("id")
        );

        String name =
                request.getParameter("name");

        String district =
                request.getParameter("district");

        String upazila =
                request.getParameter("upazila");

        Player player =
                playerDAO.getPlayerById(id);

        if (player != null) {

            player.setName(name);
            player.setDistrict(district);
            player.setUpazila(upazila);

            playerDAO.updatePlayer(player);
        }

        response.sendRedirect("players");
    }

    // ================= DELETE =================

    private void deletePlayer(HttpServletRequest request,
                              HttpServletResponse response)
            throws IOException {

        int id = Integer.parseInt(
                request.getParameter("id")
        );

        playerDAO.deletePlayer(id);

        response.sendRedirect("players");
    }
}