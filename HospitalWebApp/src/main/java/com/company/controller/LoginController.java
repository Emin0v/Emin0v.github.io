package com.company.controller;
import com.company.model.User;
import com.company.service.inter.ClinicServiceInter;
import com.company.service.inter.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
public class LoginController {

    @Autowired
    private UserServiceInter userServiceInter;

    @Autowired
    private ClinicServiceInter clinicServiceInter;

   private  ModelAndView mv = new ModelAndView("index");

    @RequestMapping(method = RequestMethod.GET, value = "/login")
    public String foo() {
        return "login";
    }

    @RequestMapping(method = RequestMethod.GET, value = "/index")
    public ModelAndView index() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = userServiceInter.getUser(authentication.getName());
//        Collections.sort(workerList,new TestSort());

        mv.addObject("user", user);

        return mv;
    }

    @RequestMapping(method = RequestMethod.POST , value = "/index")
    public ModelAndView index(@RequestParam(value = "clinicId", required = false) Integer clinicId) {
        List<User> doctorList = clinicServiceInter.getClinicDoctorList(clinicId);

        mv.addObject("doctorList",doctorList);

        return index();
    }



}
