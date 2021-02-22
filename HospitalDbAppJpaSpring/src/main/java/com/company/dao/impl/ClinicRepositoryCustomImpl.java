package com.company.dao.impl;

import com.company.model.Clinic;
import com.company.model.User;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * @author Eminov
 */

@Repository("clinicDao")
public class ClinicRepositoryCustomImpl implements ClinicRepositoryCustom {

    @PersistenceContext
    EntityManager em;

    @Override
    public List<Clinic> getList() {
        String jpql = "SELECT c FROM Clinic c";
        Query query = em.createQuery(jpql, Clinic.class);

        return  query.getResultList();
    }

    @Override
    public List<User> getClinicDoctorList(int clinic_id) {
          String jpql = "Select w.userId from Worker w where w.clinicId.id=:id";
          Query query = em.createQuery(jpql,User.class);
          query.setParameter("id",clinic_id);

          return query.getResultList();
    }

    public Clinic getClinic(Integer id) {
        String jpql = "SELECT c FROM Clinic c WHERE c.id=:id";
        Query query = em.createQuery(jpql,Clinic.class);
        query.setParameter("id",id);
        List<Clinic> list = query.getResultList();
        if(list.size()==1){
            return list.get(0) ;
        }
        return null;
    }

    @Override
    public boolean addClinic(Clinic clinic) {
         em.persist(clinic);
         return true;
    }

    @Override
    public boolean deleteClinic(Integer id) {
        Clinic clinic = em.find(Clinic.class,id);
        em.remove(clinic);
        return true;
    }

    @Override
    public boolean updateClinic(Clinic clinic) {
        em.merge(clinic);
        return true;
    }
}
