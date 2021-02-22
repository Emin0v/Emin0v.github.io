package com.company.service.impl;

import com.company.dao.impl.UserRepositoryCustom;
import com.company.model.User;
import com.company.model.Worker;
import com.company.service.inter.UserServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

/**
 *
 * @author Eminov
 */
@Service
@Transactional
public class UserServiceImpl implements UserServiceInter {

    @Autowired
    @Qualifier("userDao")
    private UserRepositoryCustom userDaoInter;

    @Override
    public boolean addUser(User user) {
       return userDaoInter.addUser(user);
    }

    @Override
    public boolean deleteUser(Integer id) {
        return userDaoInter.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) {
        return userDaoInter.updateUser(user);
    }

    @Override
    public User getUser(String username) {
        return userDaoInter.getUser(username);
    }

    @Override
    public List<User> getDoctorList() {
        return userDaoInter.getDoctorList();
    }

    @Override
    public List<User> getPatientList() {
        return userDaoInter.getPatientList();
    }

    @Override
    public List<Worker> getUserAndClinic() {
        return userDaoInter.getUserAndClinic();
    }

    @Override
    public List<String> getGroup(int id) {
        return userDaoInter.getGroup(id);
    }

}
