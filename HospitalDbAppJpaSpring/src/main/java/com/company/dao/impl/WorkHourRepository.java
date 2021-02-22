package com.company.dao.impl;

import com.company.model.User;
import com.company.model.WorkHour;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

@Repository
public interface WorkHourRepository extends JpaRepository<WorkHour, Integer>, WorkHourRepositoryCustom {

     WorkHour findByDoctorIdAndWorkDate(User doctorId , String workDate);
}
