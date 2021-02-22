package com.company.dao.impl;

import com.company.model.Appointment;

import java.util.List;

/**
 *
 * @author Eminov
 */
public interface AppointmentRepositoryCustom {

    public List<Appointment> getPatientList(int patient_id);
    
    public List<Appointment> getDoctorList(int doctor_id);

    public boolean addAppointment(Appointment appointment);

    public boolean deleteAppointment(int id);

    public Appointment getList(int id);

}
