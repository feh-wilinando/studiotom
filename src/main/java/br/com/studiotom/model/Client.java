package br.com.studiotom.model;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;
import org.hibernate.validator.constraints.br.CPF;

import javax.persistence.*;
import javax.validation.Valid;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Past;
import java.text.SimpleDateFormat;
import java.util.Calendar;

/**
 * Created by Nando on 01/03/16.
 */

@Entity
public class Client {

    @Id @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer     id;

    @NotBlank
    private String      name;


    @NotNull @Past
    @Temporal(TemporalType.DATE)
    private Calendar    birthDate;

    @NotNull
    @Enumerated(EnumType.STRING)
    private Gender      gender;

    @NotBlank
    private String      telephone;

    @NotBlank
    private String      cellPhone;

    @NotBlank
    private String      identityDocument;

    @NotBlank @CPF
    private String      socialId;

    @NotBlank
    private String      profileImagePath;

    @NotBlank @Email
    private String      email;

    @Valid
    @OneToOne
    private Address     address;


    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Calendar getBirthDate() {
        return birthDate;
    }

    public void setBirthDate(Calendar birthDate) {
        this.birthDate = birthDate;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public String getTelephone() {
        return telephone;
    }

    public void setTelephone(String telephone) {
        this.telephone = telephone;
    }

    public String getCellPhone() {
        return cellPhone;
    }

    public void setCellPhone(String cellPhone) {
        this.cellPhone = cellPhone;
    }

    public String getIdentityDocument() {
        return identityDocument;
    }

    public void setIdentityDocument(String identityDocument) {
        this.identityDocument = identityDocument;
    }

    public String getSocialId() {
        return socialId;
    }

    public void setSocialId(String socialId) {
        this.socialId = socialId;
    }

    public Address getAddress() {
        return address;
    }

    public void setAddress(Address address) {
        this.address = address;
    }

    public String getProfileImagePath() {
        return profileImagePath;
    }

    public void setProfileImagePath(String profileImagePath) {
        this.profileImagePath = profileImagePath;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    @Override
    public String toString() {
        return "Client{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", birthDate=" + (birthDate != null? new SimpleDateFormat("dd/MM/yyyy").format(birthDate.getTime()) : birthDate) +
                ", gender=" + gender +
                ", telephone='" + telephone + '\'' +
                ", cellPhone='" + cellPhone + '\'' +
                ", identityDocument='" + identityDocument + '\'' +
                ", socialId='" + socialId + '\'' +
                ", profileImagePath='" + profileImagePath + '\'' +
                ", address=" + address +
                '}';
    }

}
