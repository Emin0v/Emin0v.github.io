package com.company.dao.impl;

import org.springframework.stereotype.Repository;

/**
 * @author Eminov
 */
@Repository("patientDao")
public class PatientRepositoryCustomImpl implements PatientRepositoryCustom {

//    @PersistenceContext
//    EntityManager em;
//
//    @Override
//    public boolean register(User user) {
//        String sql = "select * from user where username='" + user.getUsername() + "'";
//        Query query = em.createNativeQuery(sql, User.class);
//        List<User> list = query.getResultList();
//        if (list.size() == 0) {
//            em.persist(user);
//            return true;
//        }
//        Helper.showMsg(" this username already exists ");
//        return false;
//    }

}

