package com.company.controller;

import com.company.model.Appointment;
import com.company.model.User;
import com.company.model.WorkHour;
import com.company.service.inter.AppointmentServiceInter;
import com.company.service.inter.UserServiceInter;
import com.company.service.inter.WorkHourServiceInter;
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
public class DoctorController {

    @Autowired
    private UserServiceInter userServiceInter;

    @Autowired
    private WorkHourServiceInter workHourServiceInter;

    @Autowired
    private AppointmentServiceInter appointmentServiceInter;

    @RequestMapping(method = RequestMethod.GET, value = "/indexDoctor")
    public ModelAndView indexDoctor(){
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = userServiceInter.getUser(authentication.getName());
        List<WorkHour> list = workHourServiceInter.getWorkHourList(user.getId());
        ModelAndView mv = new ModelAndView("doctor");
        mv.addObject("user", user);
        mv.addObject("myDate", list);
        return mv;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/addAppointDate")
    public ModelAndView addWorkHour(@RequestParam(value = "action") String action,
                                            @RequestParam(value = "id") Integer doctorId,
                                            @RequestParam(value = "date") String date) {

        if (action.equals("add")) {
            WorkHour w = new WorkHour();
            w.setDoctorId(new User(doctorId));
            w.setWorkDate(date);
            w.setStatus("a");
            workHourServiceInter.addWorkHour(w);
        }
       return indexDoctor();
    }

    @RequestMapping(method = RequestMethod.POST, value = "/deleteWorkHour")
    public ModelAndView deleteWorkHours(@RequestParam(value = "id") Integer id,
                                        @RequestParam(value = "action") String action) {
        if (action.equals("delete")) {
            workHourServiceInter.deleteWorkHour(id);
        }
        return indexDoctor();
    }

    @RequestMapping(method = RequestMethod.GET, value = "/workingHours")
    public ModelAndView showWorkHours(@RequestParam(value = "id") Integer doctorId) {

        List<Appointment> list = appointmentServiceInter.getDoctorList(doctorId);
        ModelAndView mv = new ModelAndView("doctor/workingHours");

        mv.addObject("workHours", list);
        mv.addObject("doctorId", doctorId);
        return mv;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/deleteAppointment")
    public ModelAndView deleteAppointment(@RequestParam(value = "id") Integer doctorId,
                                        @RequestParam(value = "action") String action) {
        if (action.equals("delete")) {
            appointmentServiceInter.deleteAppointment(doctorId);
        }
        return showWorkHours(doctorId);
    }

    @RequestMapping(method = RequestMethod.POST, value = "/updateAppointment")
    public ModelAndView updateWorkHours(@RequestParam(value = "id") Integer doctorId,
                                        @RequestParam(value = "action") String action) {

       return null;
    }
}
