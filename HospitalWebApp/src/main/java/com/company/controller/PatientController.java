package com.company.controller;

import com.company.dao.impl.UserRepository;
import com.company.model.*;
import com.company.service.inter.AppointmentServiceInter;
import com.company.service.inter.ClinicServiceInter;
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
import java.util.Optional;


@Controller
public class PatientController {

    @Autowired
    private UserServiceInter userServiceInter;

    @Autowired
    private UserRepository userRepository;

    @Autowired
    private AppointmentServiceInter appointmentServiceInter;

    @Autowired
    private ClinicServiceInter clinicServiceInter;

    @Autowired
    private WorkHourServiceInter workHourServiceInter;

    private ModelAndView mv = new ModelAndView("appointment");

    @RequestMapping(method = RequestMethod.GET, value = "/appointment")
    public ModelAndView index() {
        Authentication authentication = SecurityContextHolder.getContext().getAuthentication();
        User user = userServiceInter.getUser(authentication.getName());
        List<Worker> workerList = userServiceInter.getUserAndClinic();
        List<WorkHour> workHours = workHourServiceInter.getWorkHourList();
        List<Clinic> clinics = clinicServiceInter.getList();

        mv.addObject("user", user);
        mv.addObject("clinics",clinics);
        mv.addObject("workerList", workerList);
        mv.addObject("workHours", workHours);
        return mv;
    }

    @RequestMapping(method = RequestMethod.POST, value = "/appointment")
    public ModelAndView index1(@RequestParam(value = "patientId") Integer patientId,
                               @RequestParam(value = "doctorId", required = false) Integer doctorId,
                               @RequestParam(value = "workDate") String workDate,
                               @RequestParam(value = "confirm") String confirm) {

       ModelAndView successModel = new ModelAndView("success");
       ModelAndView errorModel = new ModelAndView("appointerror");
        if (confirm.equals("Təsdiqlə")) {
            Appointment a = new Appointment();
            a.setPatientId(new User(patientId));
            a.setDoctorId(new User(doctorId));
            a.setAppDate(workDate);

            boolean control = appointmentServiceInter.addAppointment(a);


            if(control){
                String[] arr = workDate.split("T");
                successModel.addObject("date" , arr[0]);
                successModel.addObject("hour",arr[1]);
                Optional<User> doctorName = userRepository.findById(doctorId);
                Optional<User> patientName = userRepository.findById(patientId);
                successModel.addObject("doctorName" , doctorName.get().getName());
                successModel.addObject("patientName" , patientName.get().getName());
                return successModel;
            }

        }
        return errorModel;
    }
//    @RequestMapping(method = RequestMethod.GET, value = "/success")
//    public String successMethod(){
//        return "success";
//    }
//
//    @RequestMapping(method = RequestMethod.GET, value = "/myerror")
//    public String errorMethod(){
//        return "appointerror";
//    }

}
