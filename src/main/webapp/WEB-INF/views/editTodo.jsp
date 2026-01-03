<%--
  Created by IntelliJ IDEA.
  User: SARA
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
    <title>Modifier la tâche</title>
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
            max-width: 600px;
            margin: 40px auto;
        }

        .card {
            background: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 1px 3px rgba(0,0,0,0.1);
        }

        .card h1 {
            font-size: 20px;
            color: #1a1a1a;
            margin-bottom: 24px;
            font-weight: 600;
        }

        .form-group {
            margin-bottom: 20px;
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
            min-height: 100px;
        }

        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 24px;
        }

        .btn {
            flex: 1;
            padding: 10px 18px;
            border: none;
            border-radius: 6px;
            cursor: pointer;
            font-size: 14px;
            font-weight: 500;
            text-decoration: none;
            text-align: center;
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

        .btn-secondary {
            background: #6b7280;
            color: white;
        }

        .btn-secondary:hover {
            background: #4b5563;
        }
    </style>
</head>
<body>
<div class="container">
    <div class="card">
        <h1>Modifier la tâche</h1>

        <form action="${pageContext.request.contextPath}/todo" method="post">
            <input type="hidden" name="action" value="update">
            <input type="hidden" name="id" value="${todo.id}">

            <div class="form-group">
                <label for="titre">Titre</label>
                <input type="text" id="titre" name="titre" value="${todo.titre}" required>
            </div>

            <div class="form-group">
                <label for="description">Description</label>
                <textarea id="description" name="description">${todo.description}</textarea>
            </div>

            <div class="form-group">
                <label for="statut">Statut</label>
                <select id="statut" name="statut">
                    <option value="Non terminé" ${todo.statut == 'Non terminé' ? 'selected' : ''}>Non terminé</option>
                    <option value="Terminé" ${todo.statut == 'Terminé' ? 'selected' : ''}>Terminé</option>
                </select>
            </div>

            <div class="button-group">
                <button type="submit" class="btn btn-primary">Enregistrer</button>
                <a href="${pageContext.request.contextPath}/todo" class="btn btn-secondary">Annuler</a>
            </div>
        </form>
    </div>
</div>
</body>
</html>