package com.company.dao.impl;

import com.company.model.Clinic;
import com.company.model.User;

import java.util.List;

/**
 *
 * @author Eminov
 */
public interface ClinicRepositoryCustom {
    
    public List<Clinic> getList();
    
    public List<User> getClinicDoctorList(int clinic_id);
    
    public Clinic getClinic(Integer id);
    
    public boolean addClinic(Clinic clinic);
    
    public boolean deleteClinic(Integer id);
    
    public boolean updateClinic(Clinic clinic );
}
