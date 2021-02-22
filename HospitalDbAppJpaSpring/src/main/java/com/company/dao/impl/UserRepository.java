package com.company.dao.impl;

import com.company.model.User;
import org.springframework.data.jpa.repository.JpaRepository;

public interface UserRepository extends JpaRepository<User, Integer> , UserRepositoryCustom{
}
