package com.company.service.impl;

import com.company.dao.impl.SurgeonRepositoryCustom;
import com.company.model.User;
import com.company.model.Worker;
import com.company.service.inter.SurgeonServiceInter;
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
public class SurgeonServiceImpl implements SurgeonServiceInter {

    @Autowired
    @Qualifier("surgeonDao")
    private SurgeonRepositoryCustom surgeonDaoInter;

    @Override
    public List<User> getDoctorList() {
        return surgeonDaoInter.getDoctorList();
    }

    @Override
    public List<User> getClinicDoctorList(int clinic_id) {
        return surgeonDaoInter.getClinicDoctorList(clinic_id);
    }

    @Override
    public boolean addWorker(Worker worker) {
        return surgeonDaoInter.addWorker(worker);
    }

//    @Override
//    public boolean addDoctor(User user) {
//        String sql = "Select * from user where username=" + user.getUsername();
//        Query query = em.createNativeQuery(sql, User.class);
//        List<User> list = query.getResultList();
//        if (list.size() == 0) {
//            em.persist(user);
//            return true;
//        }
//        return false;
//    }
//
//    @Override
//    public boolean deleteDoctor(Integer id) {
//        User user = em.find(User.class, id);
//        em.remove(user);
//        return true;
//    }
//
//    @Override
//    public boolean updateDoctor(User user) {
//        em.merge(user);
//        return true;
//    }

}
