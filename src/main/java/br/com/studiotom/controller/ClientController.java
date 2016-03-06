package br.com.studiotom.controller;

import br.com.studiotom.dao.ClientDAO;
import br.com.studiotom.model.Client;
import br.com.studiotom.model.Gender;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

/**
 * Created by Nando on 18/02/16.
 */
@Controller
@RequestMapping("/client")
public class ClientController {


    @Autowired
    private ClientDAO clientDAO;

    @RequestMapping(value = "/{id}", method = RequestMethod.GET)
    public ModelAndView edit(@PathVariable Integer id){

        Client client = clientDAO.findById(id);


        return form(client);
    }


    @RequestMapping(value = "/new",method = RequestMethod.GET)
    public ModelAndView form(Client client){
        ModelAndView view = new ModelAndView("client/form");
        view.addObject("genders", Gender.values());
        view.addObject("client", client);
        return view;
    }


    @RequestMapping(method = RequestMethod.GET)
    public ModelAndView list() {

        ModelAndView view = new ModelAndView("client/list");
        view.addObject("clients", clientDAO.list());

        return view;
    }


    @Transactional
    @RequestMapping(method = RequestMethod.POST)
    public ModelAndView save(@Valid Client client, BindingResult bindingResult, RedirectAttributes redirectAttributes){

        if (bindingResult.hasErrors()){
            System.out.println(client);
            return form(client);
        }

        clientDAO.save(client);

        ModelAndView view = new ModelAndView("redirect:/client");
        redirectAttributes.addFlashAttribute("registrationNotification", "Cliente adicionado com sucesso.");

        return view;
    }

    @Transactional
    @RequestMapping(value = "/delete/{id}",method = RequestMethod.GET)
    public ModelAndView delete(@PathVariable("id") Integer id, RedirectAttributes redirectAttributes) {
        ModelAndView view = new ModelAndView("redirect:/client");

        clientDAO.remove(id);

        redirectAttributes.addFlashAttribute("registrationNotification", "Cliente excluido com sucesso.");

        return view;
    }

}
