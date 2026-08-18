package com.cropquiz.dao;

import com.cropquiz.model.Player;
import com.cropquiz.util.DBConnection;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class PlayerDAO {

    // CREATE
    public boolean addPlayer(Player player) {

        String sql = "INSERT INTO players " +
                "(name, district, upazila, score, total_questions) " +
                "VALUES (?, ?, ?, ?, ?)";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, player.getName());
            ps.setString(2, player.getDistrict());
            ps.setString(3, player.getUpazila());
            ps.setInt(4, player.getScore());
            ps.setInt(5, player.getTotalQuestions());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // READ - All players
    public List<Player> getAllPlayers() {

        List<Player> players = new ArrayList<>();

        String sql = "SELECT * FROM players ORDER BY score DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {

            while (rs.next()) {

                Player player = new Player(
                        rs.getInt("id"),
                        rs.getString("name"),
                        rs.getString("district"),
                        rs.getString("upazila"),
                        rs.getInt("score"),
                        rs.getInt("total_questions")
                );

                players.add(player);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return players;
    }

    // READ - One player
    public Player getPlayerById(int id) {

        String sql = "SELECT * FROM players WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            try (ResultSet rs = ps.executeQuery()) {

                if (rs.next()) {

                    return new Player(
                            rs.getInt("id"),
                            rs.getString("name"),
                            rs.getString("district"),
                            rs.getString("upazila"),
                            rs.getInt("score"),
                            rs.getInt("total_questions")
                    );
                }
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return null;
    }

    // UPDATE
    public boolean updatePlayer(Player player) {

        String sql = "UPDATE players SET name=?, district=?, " +
                "upazila=?, score=?, total_questions=? WHERE id=?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, player.getName());
            ps.setString(2, player.getDistrict());
            ps.setString(3, player.getUpazila());
            ps.setInt(4, player.getScore());
            ps.setInt(5, player.getTotalQuestions());
            ps.setInt(6, player.getId());

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // DELETE
    public boolean deletePlayer(int id) {

        String sql = "DELETE FROM players WHERE id = ?";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setInt(1, id);

            return ps.executeUpdate() > 0;

        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}