package com.cropquiz.dao;

import com.cropquiz.model.Question;
import com.cropquiz.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class QuestionDAO {

    public List<Question> getQuestionsByLocation(
            String district,
            String upazila) {

        List<Question> questions = new ArrayList<>();

        String sql =
                "SELECT * FROM questions " +
                        "WHERE LOWER(TRIM(district)) = LOWER(TRIM(?)) " +
                        "AND LOWER(TRIM(upazila)) = LOWER(TRIM(?)) " +
                        "ORDER BY RAND() LIMIT 12";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, district);
            ps.setString(2, upazila);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                Question question = new Question(
                        rs.getInt("id"),
                        rs.getString("district"),
                        rs.getString("upazila"),
                        rs.getString("question"),
                        rs.getString("option_a"),
                        rs.getString("option_b"),
                        rs.getString("option_c"),
                        rs.getString("option_d"),
                        rs.getString("correct_answer"),
                        rs.getString("category")
                );

                questions.add(question);
            }

        } catch (Exception e) {
        System.out.println("QUESTION DAO ERROR:");
        e.printStackTrace();
    }


        return questions;
    }
}