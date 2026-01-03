package com.example.todolistapp.model;


public class Todo {
    private int id;
    private String titre;
    private String description;
    private String statut;

    // Constructeurs
    public Todo() {
    }

    public Todo(String titre, String description, String statut) {
        this.titre = titre;
        this.description = description;
        this.statut = statut;
    }

    public Todo(int id, String titre, String description, String statut) {
        this.id = id;
        this.titre = titre;
        this.description = description;
        this.statut = statut;
    }

    // Getters et Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitre() {
        return titre;
    }

    public void setTitre(String titre) {
        this.titre = titre;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatut() {
        return statut;
    }

    public void setStatut(String statut) {
        this.statut = statut;
    }

    @Override
    public String toString() {
        return "Todo{" +
                "id=" + id +
                ", titre='" + titre + '\'' +
                ", description='" + description + '\'' +
                ", statut='" + statut + '\'' +
                '}';
    }
}