package br.com.studiotom.builder;

import br.com.studiotom.model.Client;
import br.com.studiotom.model.Gender;

import java.util.Calendar;

/**
 * Created by Nando on 12/03/16.
 */
public class ClientBuilder {
    private String name;
    private String socialId;
    private String email;
    private Calendar birthDate;
    private Gender gender;
    private String telephone;
    private String cellPhone;
    private String identityDocument;
    private String street;
    private String complement;
    private Integer number;
    private String zipCode;
    private String state;
    private String city;

    public ClientBuilder and(){
        return this;
    }

    public Client build(){
        Client client = new Client();

        client.setName(name);
        client.setEmail(email);
        client.setBirthDate(birthDate);
        client.setGender(gender);
        client.setTelephone(telephone);
        client.setCellPhone(cellPhone);
        client.setIdentityDocument(identityDocument);
        client.setSocialId(socialId);
        client.setStreet(street);
        client.setComplement(complement);
        client.setNumber(number);
        client.setZipCode(zipCode);
        client.setState(state);
        client.setCity(city);

        return client;
    }

    public ClientBuilder withName(String name) {
        this.name = name;
        return this;
    }


    public ClientBuilder withSocialId(String socialId) {
        this.socialId = socialId;
        return this;
    }


    public ClientBuilder withEmail(String email) {
        this.email = email;

        return this;
    }

    public ClientBuilder withBirthDate(Calendar birthDate) {
        this.birthDate = ( (Calendar) birthDate.clone());
        return this;
    }

    public ClientBuilder withGender(Gender gender) {
        this.gender = gender;
        return this;
    }

    public ClientBuilder withTelephone(String telephone) {
        this.telephone = telephone;
        return this;
    }

    public ClientBuilder withCellPhone(String cellPhone) {
        this.cellPhone = cellPhone;
        return this;
    }

    public ClientBuilder withIdentityDocument(String identityDocument) {
        this.identityDocument = identityDocument;
        return this;
    }

    public ClientBuilder withStreet(String street) {
        this.street = street;
        return this;
    }

    public ClientBuilder withComplement(String complement) {
        this.complement = complement;
        return this;
    }

    public ClientBuilder withNumber(Integer number) {
        this.number = number;
        return this;
    }

    public ClientBuilder withZipCode(String zipCode) {
        this.zipCode = zipCode;
        return this;
    }

    public ClientBuilder withState(String state) {
        this.state = state;
        return this;
    }

    public ClientBuilder withCity(String city) {
        this.city = city;
        return this;
    }
}
