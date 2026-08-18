package com.cropquiz.servlet;

import com.cropquiz.dao.PlayerDAO;
import com.cropquiz.dao.QuestionDAO;
import com.cropquiz.model.Player;
import com.cropquiz.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/result")
public class ResultServlet extends HttpServlet {

    private QuestionDAO questionDAO;
    private PlayerDAO playerDAO;

    @Override
    public void init() {
        questionDAO = new QuestionDAO();
        playerDAO = new PlayerDAO();
    }

    @Override
    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");

        String name = request.getParameter("name");
        String district = request.getParameter("district");
        String upazila = request.getParameter("upazila");

        // Get questions for selected location
        List<Question> questions =
                questionDAO.getQuestionsByLocation(
                        district,
                        upazila
                );

        int score = 0;

        // Check answers
        for (Question question : questions) {

            String submittedAnswer =
                    request.getParameter(
                            "answer_" + question.getId()
                    );

            if (submittedAnswer != null &&
                    submittedAnswer.equalsIgnoreCase(
                            question.getCorrectAnswer()
                    )) {

                score++;
            }
        }

        int totalQuestions = questions.size();

        // Find player
        List<Player> players =
                playerDAO.getAllPlayers();

        Player currentPlayer = null;

        for (Player player : players) {

            if (player.getName().equals(name)
                    && player.getDistrict().equals(district)
                    && player.getUpazila().equals(upazila)) {

                currentPlayer = player;
                break;
            }
        }

        // Update score
        if (currentPlayer != null) {

            currentPlayer.setScore(score);
            currentPlayer.setTotalQuestions(totalQuestions);

            playerDAO.updatePlayer(currentPlayer);
        }

        // Send result to result.jsp
        request.setAttribute(
                "name",
                name
        );

        request.setAttribute(
                "district",
                district
        );

        request.setAttribute(
                "upazila",
                upazila
        );

        request.setAttribute(
                "score",
                score
        );

        request.setAttribute(
                "totalQuestions",
                totalQuestions
        );

        request.getRequestDispatcher(
                "/result.jsp"
        ).forward(request, response);
    }
}