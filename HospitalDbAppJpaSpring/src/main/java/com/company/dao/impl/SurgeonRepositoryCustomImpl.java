package com.company.dao.impl;

import com.company.model.User;
import com.company.model.Worker;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * @author Eminov
 */
@Repository("surgeonDao")
public class SurgeonRepositoryCustomImpl implements SurgeonRepositoryCustom {

    @PersistenceContext
    EntityManager em;

    @Override
    public List<User> getDoctorList() {
        String sql = "SELECT * FROM `user` WHERE type='doctor';";
        Query query = em.createNativeQuery(sql, User.class);
        return query.getResultList();
    }

    @Override
    public List<User> getClinicDoctorList(int clinic_id) {
        String jpql = "SELECT w from Worker w where w.clinicId=:id";
        Query query = em.createQuery(jpql, Worker.class);
        return query.getResultList();

    }

    @Override
    public boolean addWorker(Worker worker) {
        String sql = "select * from worker where user_id=" + worker.getUserId() + " and clinic_id=" + worker.getClinicId();
        Query query = em.createNativeQuery(sql, Worker.class);
        List<Worker> list = query.getResultList();
        if (list.size() == 0) {
            em.persist(worker);
            return true;
        }
        return false;
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
