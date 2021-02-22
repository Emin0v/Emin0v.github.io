package com.company.dao.impl;


import com.company.model.Appointment;
import org.springframework.data.jpa.repository.JpaRepository;

public interface AppointmentRepository extends JpaRepository<Appointment, Integer>, AppointmentRepositoryCustom {

}
