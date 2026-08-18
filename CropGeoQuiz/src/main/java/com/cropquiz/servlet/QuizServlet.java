package com.cropquiz.servlet;

import com.cropquiz.dao.QuestionDAO;
import com.cropquiz.model.Question;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.util.List;

@WebServlet("/quiz")
public class QuizServlet extends HttpServlet {

    private QuestionDAO questionDAO;

    @Override
    public void init() {
        questionDAO = new QuestionDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        String name = request.getParameter("name");
        String district = request.getParameter("district");
        String upazila = request.getParameter("upazila");

        // Get questions according to district and upazila
        List<Question> questions =
                questionDAO.getQuestionsByLocation(
                        district,
                        upazila
                );

        // Send information to quiz.jsp
        request.setAttribute("questions", questions);
        request.setAttribute("district", district);
        request.setAttribute("upazila", upazila);

        request.getRequestDispatcher("/quiz.jsp")
                .forward(request, response);
    }
}