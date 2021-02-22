package com.company.dao.impl;

import com.company.model.User;
import com.company.model.Worker;

import java.util.List;

/**
 * @author Eminov
 */
public interface SurgeonRepositoryCustom {

    public List<User> getDoctorList();

    public List<User> getClinicDoctorList(int clinic_id);

    public boolean addWorker(Worker worker);

//    public boolean addDoctor(User user );
//
//    public boolean deleteDoctor(Integer id);
//
//    public boolean updateDoctor(User user);

}
