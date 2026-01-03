package com.example.todolistapp.controller;


import com.example.todolistapp.dao.TodoDAO;
import com.example.todolistapp.model.Todo;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/todo")
public class TodoServlet extends HttpServlet {
    private TodoDAO todoDAO;

    @Override
    public void init() {
        todoDAO = new TodoDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if (action == null) {
            action = "list";
        }

        switch (action) {
            case "list":
                listTodos(request, response);
                break;
            case "edit":
                showEditForm(request, response);
                break;
            case "delete":
                deleteTodo(request, response);
                break;
            case "toggle":
                toggleStatut(request, response);
                break;
            default:
                listTodos(request, response);
                break;
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        request.setCharacterEncoding("UTF-8");
        String action = request.getParameter("action");

        if ("add".equals(action)) {
            ajouterTodo(request, response);
        } else if ("update".equals(action)) {
            modifierTodo(request, response);
        }
    }

    // Afficher la liste des tâches
    private void listTodos(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        List<Todo> todos = todoDAO.getAllTodos();
        request.setAttribute("todos", todos);
        request.getRequestDispatcher("/WEB-INF/views/todoList.jsp").forward(request, response);
    }

    // Ajouter une nouvelle tâche
    private void ajouterTodo(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        String titre = request.getParameter("titre");
        String description = request.getParameter("description");
        String statut = request.getParameter("statut");

        Todo todo = new Todo(titre, description, statut);
        boolean success = todoDAO.ajouterTodo(todo);

        if (success) {
            request.getSession().setAttribute("message", "Tâche ajoutée avec succès!");
        } else {
            request.getSession().setAttribute("error", "Erreur lors de l'ajout de la tâche.");
        }

        response.sendRedirect(request.getContextPath() + "/todo");
    }

    // Afficher le formulaire de modification
    private void showEditForm(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        Todo todo = todoDAO.getTodoById(id);

        if (todo != null) {
            request.setAttribute("todo", todo);
            request.getRequestDispatcher("/WEB-INF/views/editTodo.jsp").forward(request, response);
        } else {
            response.sendRedirect(request.getContextPath() + "/todo");
        }
    }

    // Modifier une tâche
    private void modifierTodo(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String titre = request.getParameter("titre");
        String description = request.getParameter("description");
        String statut = request.getParameter("statut");

        Todo todo = new Todo(id, titre, description, statut);
        boolean success = todoDAO.modifierTodo(todo);

        if (success) {
            request.getSession().setAttribute("message", "Tâche modifiée avec succès!");
        } else {
            request.getSession().setAttribute("error", "Erreur lors de la modification.");
        }

        response.sendRedirect(request.getContextPath() + "/todo");
    }

    // Supprimer une tâche
    private void deleteTodo(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        boolean success = todoDAO.supprimerTodo(id);

        if (success) {
            request.getSession().setAttribute("message", "Tâche supprimée avec succès!");
        } else {
            request.getSession().setAttribute("error", "Erreur lors de la suppression.");
        }

        response.sendRedirect(request.getContextPath() + "/todo");
    }

    // Changer le statut (Terminé/Non terminé)
    private void toggleStatut(HttpServletRequest request, HttpServletResponse response)
            throws IOException {
        int id = Integer.parseInt(request.getParameter("id"));
        String statut = request.getParameter("statut");

        String newStatut = "Terminé".equals(statut) ? "Non terminé" : "Terminé";
        todoDAO.changerStatut(id, newStatut);

        response.sendRedirect(request.getContextPath() + "/todo");
    }
}