package com.company.dao.impl;

import com.company.model.User;
import com.company.model.Worker;

import java.util.List;

public interface UserRepositoryCustom {

    public boolean addUser(User user);

    public boolean deleteUser(Integer id);

    public boolean updateUser(User user);

    public User getUser(String username);

    public List<User> getDoctorList();

    public List<User> getPatientList();

    public List<Worker> getUserAndClinic();

    public List<String> getGroup(int id);

}
