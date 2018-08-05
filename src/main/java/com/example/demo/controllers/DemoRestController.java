package com.example.demo.controllers;

import org.apache.log4j.Logger;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import java.net.InetAddress;
import java.net.UnknownHostException;

@RestController
public class DemoRestController {

    static Logger log = Logger.getLogger(DemoRestController.class);

    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String getInformation() {
        String result = "Running on ";
        try {
            result += InetAddress.getLocalHost().getHostName();
        } catch (UnknownHostException e) {
            log.error(e.getMessage(), e);
            result = "Error getting hostname";
        }
        result += "\n";
        String runner = "Started by: " + System.getProperty("application.starter");
        result += runner + "\n";
        return result;
    }
}
