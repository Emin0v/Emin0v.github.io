package com.company.service.impl;

import com.company.dao.impl.AppointmentRepositoryCustom;
import com.company.model.Appointment;
import com.company.service.inter.AppointmentServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 * @author Eminov
 */
@Service
@Transactional
public class AppointmentServiceImpl implements AppointmentServiceInter {

    @Autowired
    @Qualifier("appointDao")
    private AppointmentRepositoryCustom appointmentDaoInter;

    @Override
    public List<Appointment> getPatientList(int patient_id) {
       return appointmentDaoInter.getPatientList(patient_id);
    }

    @Override
    public List<Appointment> getDoctorList(int doctor_id) {
       return appointmentDaoInter.getDoctorList(doctor_id);
    }

    @Override
    public Appointment getList(int id) {
       return appointmentDaoInter.getList(id);
    }

    @Override
    public boolean addAppointment(Appointment appointment) {
       return appointmentDaoInter.addAppointment(appointment);
    }

    @Override
    public boolean deleteAppointment(int id) {
       return  appointmentDaoInter.deleteAppointment(id);
    }

}
