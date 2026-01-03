package com.example.todolistapp.dao;


import com.example.todolistapp.model.Todo;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class TodoDAO {

    // Créer une nouvelle tâche
    public boolean ajouterTodo(Todo todo) {
        String sql = "INSERT INTO todo (titre, description, statut) VALUES (?, ?, ?)";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, todo.getTitre());
            stmt.setString(2, todo.getDescription());
            stmt.setString(3, todo.getStatut());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Récupérer toutes les tâches
    public List<Todo> getAllTodos() {
        List<Todo> todos = new ArrayList<>();
        String sql = "SELECT * FROM todo ORDER BY id DESC";

        try (Connection conn = DatabaseConnection.getConnection();
             Statement stmt = conn.createStatement();
             ResultSet rs = stmt.executeQuery(sql)) {

            while (rs.next()) {
                Todo todo = new Todo(
                        rs.getInt("id"),
                        rs.getString("titre"),
                        rs.getString("description"),
                        rs.getString("statut")
                );
                todos.add(todo);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return todos;
    }

    // Récupérer une tâche par ID
    public Todo getTodoById(int id) {
        String sql = "SELECT * FROM todo WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                return new Todo(
                        rs.getInt("id"),
                        rs.getString("titre"),
                        rs.getString("description"),
                        rs.getString("statut")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
    }

    // Mettre à jour une tâche
    public boolean modifierTodo(Todo todo) {
        String sql = "UPDATE todo SET titre = ?, description = ?, statut = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, todo.getTitre());
            stmt.setString(2, todo.getDescription());
            stmt.setString(3, todo.getStatut());
            stmt.setInt(4, todo.getId());

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Supprimer une tâche
    public boolean supprimerTodo(int id) {
        String sql = "DELETE FROM todo WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setInt(1, id);
            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    // Changer le statut d'une tâche
    public boolean changerStatut(int id, String statut) {
        String sql = "UPDATE todo SET statut = ? WHERE id = ?";
        try (Connection conn = DatabaseConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql)) {

            stmt.setString(1, statut);
            stmt.setInt(2, id);

            return stmt.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}