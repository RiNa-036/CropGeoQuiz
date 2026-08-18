package com.cropquiz.model;

public class Player {

    private int id;
    private String name;
    private String district;
    private String upazila;
    private int score;
    private int totalQuestions;

    public Player() {
    }

    public Player(String name, String district, String upazila) {
        this.name = name;
        this.district = district;
        this.upazila = upazila;
    }

    public Player(int id, String name, String district,
                  String upazila, int score, int totalQuestions) {
        this.id = id;
        this.name = name;
        this.district = district;
        this.upazila = upazila;
        this.score = score;
        this.totalQuestions = totalQuestions;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getDistrict() {
        return district;
    }

    public void setDistrict(String district) {
        this.district = district;
    }

    public String getUpazila() {
        return upazila;
    }

    public void setUpazila(String upazila) {
        this.upazila = upazila;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public int getTotalQuestions() {
        return totalQuestions;
    }

    public void setTotalQuestions(int totalQuestions) {
        this.totalQuestions = totalQuestions;
    }
}