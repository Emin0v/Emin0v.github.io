package com.company.controller;

import com.company.form.RegisterForm;
import com.company.model.User;
import com.company.service.inter.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;

//@RequestMapping("/register")
@Controller
public class RegisterController {

    @Autowired
    private UserServiceInter userServiceInter;

    @RequestMapping(method = RequestMethod.GET, value = "/register")
    public ModelAndView index() {
        ModelAndView mv = new ModelAndView("register");
        mv.addObject("register", new RegisterForm());
        return mv;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/register")
    public ModelAndView addUser(@Valid @ModelAttribute("register") RegisterForm form, BindingResult bindingResult) {
        ModelAndView mv = new ModelAndView("register");

        if (bindingResult.hasErrors()) {
            return mv;
        }

        if (form.getPassword().equals(form.getConfirmPassword())) {
            User user = new User();
            user.setName(form.getFirstName() + " " + form.getLastName());
            user.setUsername(form.getUsername());
            user.setPassword(form.getPassword());

            boolean control = userServiceInter.addUser(user);
            if(control){
                ModelAndView mv1 = new ModelAndView("login");
                return mv1;
            }else{
                mv.addObject("message","bu username artıq istifadə olunub");
            }

        } else {
            mv.addObject("message" , "password doğrulanması yanlışdır!");

        }

        return mv;
    }
}
