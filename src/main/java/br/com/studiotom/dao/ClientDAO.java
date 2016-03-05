package br.com.studiotom.dao;

import br.com.studiotom.model.Client;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;

/**
 * Created by Nando on 03/03/16.
 */
@Repository
public class ClientDAO {

    @PersistenceContext
    private EntityManager manager;


    public void save(Client client){
        manager.persist(client);
    }
}
