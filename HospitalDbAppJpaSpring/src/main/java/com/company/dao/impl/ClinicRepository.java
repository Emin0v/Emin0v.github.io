package com.company.dao.impl;

import com.company.model.Clinic;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ClinicRepository extends JpaRepository<Clinic,Integer> , ClinicRepositoryCustom {
}
