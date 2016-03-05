package br.com.studiotom.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * Created by Nando on 12/02/16.
 */

@Controller
public class RootController {

    @RequestMapping("/")
    public String index(){
        return "index";
    }

}
