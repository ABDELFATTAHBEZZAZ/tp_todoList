<%--
  Created by IntelliJ IDEA.
  User: Sara
  Date: 12/10/2025
  Time: 14:39
  To change this template use File | Settings | File Templates.
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mes Tâches</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif;
            background: #f5f5f5;
            padding: 20px;
            line-height: 1.5;
        }

        .container {
            max-width: 850px;
            margin: 0 auto;
        }

        .header {
            background: white;
            padding: 25px 30px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .header h1 {
            font-size: 24px;
            color: #1a1a1a;
            font-weight: 600;
        }

        .alert {
            padding: 12px 16px;
            margin-bottom: 20px;
            border-radius: 6px;
            font-size: 14px;
            border-left: 3px solid;
        }

        .alert-success {
            background: #f0fdf4;
            border-color: #22c55e;
            color: #166534;
        }

        .alert-error {
            background: #fef2f2;
            border-color: #ef4444;
            color: #991b1b;
        }

        .form-card {
            background: white;
            padding: 25px 30px;
            margin-bottom: 20px;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .form-card h2 {
            font-size: 16px;
            color: #1a1a1a;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 16px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            color: #4b5563;
            font-size: 14px;
            font-weight: 500;
        }

        .form-group input,
        .form-group textarea,
        .form-group select {
            width: 100%;
            padding: 10px 12px;
            border: 1px solid #d1d5db;
            border-radius: 6px;
            font-size: 14px;
            font-family: inherit;
            transition: border-color 0.2s;
        }

        .form-group input:focus,
        .form-group textarea:focus,
        .form-group select:focus {
            outline: none;
            border-color: #3b82f6;
        }

        .form-group textarea {
            resize: vertical;
            min-height: 80px;
        }

        .btn {
            padding: 9px 16px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            text-decoration: none;
            display: inline-block;
            transition: background 0.2s;
        }

        .btn-primary {
            background: #3b82f6;
            color: white;
        }

        .btn-primary:hover {
            background: #2563eb;
        }

        .btn-success {
            background: #10b981;
            color: white;
        }

        .btn-success:hover {
            background: #059669;
        }

        .btn-warning {
            background: #f59e0b;
            color: white;
        }

        .btn-warning:hover {
            background: #d97706;
        }

        .btn-danger {
            background: #ef4444;
            color: white;
        }

        .btn-danger:hover {
            background: #dc2626;
        }

        .btn-sm {
            padding: 6px 12px;
            font-size: 13px;
        }

        .tasks-card {
            background: white;
            padding: 25px 30px;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .tasks-card h2 {
            font-size: 16px;
            color: #1a1a1a;
            margin-bottom: 20px;
            font-weight: 600;
        }

        .task {
            background: #fafafa;
            padding: 16px;
            margin-bottom: 12px;
            border-radius: 6px;
            border: 1px solid #e5e7eb;
        }

        .task.completed {
            background: #f9fafb;
        }

        .task-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin-bottom: 8px;
            gap: 12px;
        }

        .task-title {
            font-size: 15px;
            font-weight: 500;
            color: #1a1a1a;
            flex: 1;
        }

        .task.completed .task-title {
            text-decoration: line-through;
            color: #6b7280;
        }

        .badge {
            padding: 3px 10px;
            border-radius: 12px;
            font-size: 12px;
            font-weight: 500;
            white-space: nowrap;
        }

        .badge-complete {
            background: #dcfce7;
            color: #166534;
        }

        .badge-incomplete {
            background: #fef3c7;
            color: #92400e;
        }

        .task-desc {
            color: #6b7280;
            font-size: 14px;
            margin-bottom: 12px;
            line-height: 1.5;
        }

        .task-actions {
            display: flex;
            gap: 8px;
            flex-wrap: wrap;
        }

        .empty {
            text-align: center;
            padding: 60px 20px;
            color: #9ca3af;
        }

        .empty-icon {
            font-size: 48px;
            margin-bottom: 12px;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="header">
        <h1>Gestion des tâches</h1>
    </div>

    <c:if test="${not empty sessionScope.message}">
        <div class="alert alert-success">
                ${sessionScope.message}
        </div>
        <c:remove var="message" scope="session"/>
    </c:if>

    <c:if test="${not empty sessionScope.error}">
        <div class="alert alert-error">
                ${sessionScope.error}
        </div>
        <c:remove var="error" scope="session"/>
    </c:if>

    <div class="form-card">
        <h2>Nouvelle tâche</h2>
        <form action="${pageContext.request.contextPath}/todo" method="post">
            <input type="hidden" name="action" value="add">

            <div class="form-group">
                <label for="titre">Titre</label>
                <input type="text" id="titre" name="titre" required>
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description"></textarea>
            </div>

            <div class="form-group">
                <label for="statut">Statut</label>
                <select id="statut" name="statut">
                    <option value="Non terminé">Non terminé</option>
                    <option value="Terminé">Terminé</option>
                </select>
            </div>

            <button type="submit" class="btn btn-primary">Ajouter</button>
        </form>
    </div>

    <div class="tasks-card">
        <h2>Liste des tâches <c:if test="${not empty todos}">(${todos.size()})</c:if></h2>

        <c:choose>
            <c:when test="${empty todos}">
                <div class="empty">
                    <div class="empty-icon">📝</div>
                    <p>Aucune tâche</p>
                </div>
            </c:when>
            <c:otherwise>
                <c:forEach var="todo" items="${todos}">
                    <div class="task ${todo.statut == 'Terminé' ? 'completed' : ''}">
                        <div class="task-top">
                            <span class="task-title">${todo.titre}</span>
                            <span class="badge ${todo.statut == 'Terminé' ? 'badge-complete' : 'badge-incomplete'}">
                                    ${todo.statut}
                            </span>
                        </div>

                        <c:if test="${not empty todo.description}">
                            <div class="task-desc">${todo.description}</div>
                        </c:if>

                        <div class="task-actions">
                            <a href="${pageContext.request.contextPath}/todo?action=toggle&id=${todo.id}&statut=${todo.statut}"
                               class="btn btn-success btn-sm">
                                    ${todo.statut == 'Terminé' ? 'Réactiver' : 'Terminer'}
                            </a>

                            <a href="${pageContext.request.contextPath}/todo?action=edit&id=${todo.id}"
                               class="btn btn-warning btn-sm">
                                Modifier
                            </a>

                            <a href="${pageContext.request.contextPath}/todo?action=delete&id=${todo.id}"
                               class="btn btn-danger btn-sm"
                               onclick="return confirm('Supprimer cette tâche ?')">
                                Supprimer
                            </a>
                        </div>
                    </div>
                </c:forEach>
            </c:otherwise>
        </c:choose>
    </div>
</div>
</body>
</html>