package com.company.service.impl;

import com.company.dao.impl.ClinicRepositoryCustom;
import com.company.model.Clinic;
import com.company.model.User;
import com.company.service.inter.ClinicServiceInter;
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
public class ClinicServiceImpl implements ClinicServiceInter {

   @Autowired
   @Qualifier("clinicDao")
   private ClinicRepositoryCustom clinicDaoInter;

    @Override
    public List<Clinic> getList() {
        return clinicDaoInter.getList();
    }

    @Override
    public List<User> getClinicDoctorList(int clinic_id) {
        return clinicDaoInter.getClinicDoctorList(clinic_id);
    }

    public Clinic getClinic(Integer id) {
        return clinicDaoInter.getClinic(id);
    }

    @Override
    public boolean addClinic(Clinic clinic) {
        return clinicDaoInter.addClinic(clinic);
    }

    @Override
    public boolean deleteClinic(Integer id) {
        return clinicDaoInter.deleteClinic(id);
    }

    @Override
    public boolean updateClinic(Clinic clinic) {
        return clinicDaoInter.updateClinic(clinic);
    }
}
