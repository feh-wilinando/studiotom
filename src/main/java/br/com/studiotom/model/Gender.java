package br.com.studiotom.model;

/**
 * Created by Nando on 01/03/16.
 */
public enum Gender {
    MALE("Masculino"),
    FEMALE("Feminino");

    private String value;

    Gender(String gender) {
        this.value = gender;
    }


    public String getValue() {
        return value;
    }
}
