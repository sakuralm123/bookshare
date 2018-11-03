package com.bookshare.controller;

import com.sun.tools.internal.ws.processor.model.Model;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import java.util.HashMap;
import java.util.Map;

@Controller
public class Test {

    @RequestMapping("/hello")
    public String test(org.springframework.ui.Model model){
       /* Map<String,String> map =new HashMap<>();
        map.put("username","hahhah");
        map.put("password","luelue");
        return new ModelAndView("hello",map);*/
      /* ModelAndView modelAndView=new ModelAndView("hello");
       modelAndView.addObject("message","hhaha");
       return modelAndView;*/
       model.addAttribute("message","helloadfs");
       return "hello";
    }
}
