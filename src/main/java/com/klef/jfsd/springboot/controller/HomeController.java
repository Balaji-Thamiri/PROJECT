package com.klef.jfsd.springboot.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.servlet.ModelAndView;



@Controller
public class HomeController {
	
	 

    
    @GetMapping("/")
    public ModelAndView home() {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("index");
        return mv;
    }
    
   
    
    // Handle all other undefined URLs
    @GetMapping("/{path:^(?!student$|company$).*$}")
    public ModelAndView handleNotFound(@PathVariable String path) {
        ModelAndView mv = new ModelAndView();
        mv.setViewName("Pagenotfound");
        return mv;
    }
    
   

}