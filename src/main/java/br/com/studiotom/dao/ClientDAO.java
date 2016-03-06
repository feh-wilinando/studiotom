package br.com.studiotom.dao;

import br.com.studiotom.model.Client;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.List;

/**
 * Created by Nando on 03/03/16.
 */
@Repository
public class ClientDAO {

    @PersistenceContext
    private EntityManager manager;


    public Client findById(Integer id){
        return manager.find(Client.class, id);
    }

    public void save(Client client){
        if (client.getId() != null)
            update(client);
        else
            manager.persist(client);
    }

    private void update(Client client) {
        manager.merge(client);
    }

    public List<Client> list() {
        return manager.createQuery("select c from Client c", Client.class).getResultList();
    }

    public void remove(Integer id) {
        Client client = findById(id);
        manager.remove(client);
    }
}
