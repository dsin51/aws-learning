package com.example.demo;

import java.util.Date;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HelloDockerRestController {
	
	 @RequestMapping("/hello/{name}")
	    public String helloDocker(@PathVariable(value = "name") String name) {
	        String response = "Hello " + name + " Response received on : " + new Date();
	        System.out.println(response);
	        return response;
	 
	    }

}
