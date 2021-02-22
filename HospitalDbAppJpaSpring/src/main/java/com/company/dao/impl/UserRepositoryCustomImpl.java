package com.company.dao.impl;

import at.favre.lib.crypto.bcrypt.BCrypt;
import com.company.model.Group1;
import com.company.model.User;
import com.company.model.Worker;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Eminov
 */
@Repository("userDao")
public class UserRepositoryCustomImpl implements UserRepositoryCustom {

    @PersistenceContext
    EntityManager em;

    public static BCrypt.Hasher crypt = BCrypt.withDefaults();

    @Override
    public boolean addUser(User user) {
        String sql = "Select * from user where username='" + user.getUsername() + "'";
        Query query = em.createNativeQuery(sql, User.class);
        List<User> list = query.getResultList();
        if (list.size() == 0) {
            user.setPassword(crypt.hashToString(4, user.getPassword().toCharArray()));
            em.persist(user);
            return true;
        }
        return false;
    }

    @Override
    public boolean deleteUser(Integer id) {
        User user = em.find(User.class, id);
        em.remove(user);
        return true;
    }

    @Override
    public boolean updateUser(User user) {
        em.merge(user);
        return true;
    }

    @Override
    public User getUser(String username) {
        String jpql = "SELECT u FROM User u where u.username=:us";
        Query query = em.createQuery(jpql, User.class);
        query.setParameter("us", username);
        List<User> list = query.getResultList();
        if (list.size() == 1) {
            return list.get(0);
        }
        return null;

    }

    @Override
    public List<User> getDoctorList() {
        String jpql = "SELECT u FROM User u where u.type='doctor'";
        Query query = em.createQuery(jpql, User.class);
        return query.getResultList();
    }

    @Override
    public List<User> getPatientList() {
        String jpql = "SELECT u FROM User u where u.type='patient'";
        Query query = em.createQuery(jpql, User.class);
        return query.getResultList();
    }

    @Override
    public List<Worker> getUserAndClinic() {
        String jpql = "SELECT w FROM Worker w";
        Query query = em.createQuery(jpql, Worker.class);
        return query.getResultList();
    }

    @Override
    public List<String> getGroup(int id) {
//        Query q = em.createQuery(" select u from GroupUser u where u.userId=:id", GroupUser.class);
        String sql = "SELECT " +
                " m.* " +
                " FROM " +
                " group_user g " +
                " LEFT JOIN `group` m ON g.group_id = m.id " +
                " WHERE " +
                " g.user_id = ? ";

        Query q = em.createNativeQuery(sql, Group1.class);


        q.setParameter(1, id);

        List<Group1> list = q.getResultList();

        List<String> l = new ArrayList<>();

        for(Group1 g : list){
            l.add(g.getName());
        }

        return l;
    }



}
