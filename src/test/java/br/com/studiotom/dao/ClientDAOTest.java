package br.com.studiotom.dao;

import br.com.studiotom.builder.ClientBuilder;
import br.com.studiotom.configuration.DataSourceTest;
import br.com.studiotom.configuration.JPAConfiguration;
import br.com.studiotom.model.Client;
import br.com.studiotom.model.Gender;
import org.junit.*;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.annotation.Rollback;
import org.springframework.test.context.ActiveProfiles;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.transaction.annotation.Transactional;

import java.util.Calendar;
import java.util.List;

import static org.hamcrest.CoreMatchers.is;
import static org.hamcrest.CoreMatchers.nullValue;
import static org.hamcrest.beans.HasProperty.hasProperty;
import static org.hamcrest.collection.IsCollectionWithSize.hasSize;
import static org.junit.Assert.*;

/**
 * Created by Nando on 12/03/16.
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration(classes = {DataSourceTest.class,ClientDAO.class, JPAConfiguration.class})
@ActiveProfiles("test")
public class ClientDAOTest {

    @Autowired
    private ClientDAO clientDAO;
    private static Client fernando;

    @Before
    public void setup(){
        ClientBuilder builder = new ClientBuilder();

        Calendar birthDate = Calendar.getInstance();
        birthDate.set(1990, Calendar.NOVEMBER, 5);

        fernando = null;
        fernando = builder
                .withName("Fernando Willian de Souza Furtado")
                .and()
                .withEmail("feh.wilinando@gmail.com")
                .and()
                .withBirthDate(birthDate)
                .and()
                .withGender(Gender.MALE)
                .and()
                .withTelephone("1124242424")
                .and()
                .withCellPhone("11998989898")
                .and()
                .withIdentityDocument("356460332")
                .and()
                .withStreet("Rua Octacilio Malheiros")
                .and()
                .withNumber(300)
                .and()
                .withZipCode("07093170")
                .and()
                .withState("SP")
                .and()
                .withCity("Guarulhos")
                .and()
                .withSocialId("38803677879").build();
    }



    @Test
    @Transactional
    @Rollback(true)
    public void shouldInsertTheFernandoClient(){

        assertThat(fernando.getId(), is(nullValue()));


        clientDAO.save(fernando);
        List<Client> clients = clientDAO.list();

        assertThat(clients, hasSize(1));

        Client actual = clients.get(0);
        assertThat(actual, hasProperty("id"));
        assertThat(actual.getSocialId(), is("38803677879"));
        assertThat(fernando.getId(), is(actual.getId()));
    }

    @Test
    @Transactional
    @Rollback(true)
    public void shouldUpdateAddressTheFernandoClient(){

        clientDAO.save(fernando);

        Client client = clientDAO.findById(fernando.getId());
        client.setStreet("Rua Centenário");
        client.setNumber(341);

        clientDAO.save(client);


        List<Client> clients = clientDAO.list();

        assertThat(clients, hasSize(1));

        Client actual = clients.get(0);
        assertThat(actual, hasProperty("id"));
        assertThat(actual.getSocialId(), is("38803677879"));

        assertThat(actual.getStreet(), is("Rua Centenário"));
        assertThat(actual.getNumber(), is(341));

    }


    @Test
    @Transactional
    @Rollback(true)
    public void shouldDeleteTheFernandoClient(){
        clientDAO.save(fernando);

        clientDAO.remove(fernando.getId());

        List<Client> clients = clientDAO.list();

        assertThat(clients, hasSize(0));


    }

}
