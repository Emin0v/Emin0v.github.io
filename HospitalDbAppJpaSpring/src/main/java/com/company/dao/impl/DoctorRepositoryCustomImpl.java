package com.company.dao.impl;

import org.springframework.stereotype.Repository;

/**
 * @author Eminov
 */
@Repository("doctorDao")
public class DoctorRepositoryCustomImpl implements DoctorRepositoryCustom {

//    @PersistenceContext
//    EntityManager em;
//
//    @Override
//    public boolean addWhour(Workhour hour) {
//        String sql = "Select * from workhour where status='a' AND doctor_id=" + hour.getDoctorId() + " AND work_date='" + hour.getWorkDate() + "'";
//        Query query = em.createNativeQuery(sql, Workhour.class);
//        List<Workhour> list = query.getResultList();
//        if (list.size() == 0) {
//            em.persist(hour);
//            return true;
//        }
//        return true;
//    }
//
//    @Override
//    public boolean deleteWhour(Integer id) {
//        Workhour hour = em.find(Workhour.class, id);
//        em.remove(hour);
//        return true;
//    }
}
