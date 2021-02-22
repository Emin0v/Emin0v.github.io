package com.company.service.impl;

import com.company.service.inter.PatientServiceInter;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;


/**
 * @author Eminov
 */
@Service
@Transactional
public class PatientServiceImpl implements PatientServiceInter {

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

