package com.company.dao.impl;

import com.company.model.Appointment;
import com.company.model.User;
import com.company.model.WorkHour;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Eminov
 */
@Repository("appointDao")
public class AppointmentRepositoryCustomImpl implements AppointmentRepositoryCustom {

    @PersistenceContext
    EntityManager em;

    @Autowired
    @Qualifier("workHourDao")
    private WorkHourRepositoryCustom workHourDaoInter;

    @Autowired
    private WorkHourRepository workHourRepository;

    @Override
    public List<Appointment> getPatientList(int patient_id) {
        ArrayList<Appointment> list = new ArrayList<>();
        Appointment obj;

        String sql = " SELECT "
                + "	 ap.* , "
                + "  u1.NAME as doctor_name , "
                + "  u2.NAME as patient_name "
                + "  FROM  "
                + "	 appointment ap  "
                + "	 LEFT JOIN USER u1 ON ap.doctor_id = u1.id "
                + "	 LEFT JOIN USER u2 ON ap.patient_id= u2.id WHERE patient_id=:id";

        Query query = em.createNativeQuery(sql, Appointment.class);
        query.setParameter("id", patient_id);

        return query.getResultList();

    }

    @Override
    public List<Appointment> getDoctorList(int doctor_id) {
        String sql = " SELECT "
                + "	 ap.* , "
                + "  u1.NAME as doctor_name , "
                + "  u2.NAME as patient_name "
                + "  FROM  "
                + "	 appointment ap  "
                + "	 LEFT JOIN USER u1 ON ap.doctor_id = u1.id "
                + "	 LEFT JOIN USER u2 ON ap.patient_id= u2.id WHERE doctor_id=" + doctor_id;

        Query query = em.createNativeQuery(sql, Appointment.class);


        return query.getResultList();
    }

    @Override
    public Appointment getList(int id) {
        String jpql = "select a from Appointment a where a.id=:id ";
        Query query = em.createQuery(jpql, Appointment.class);
        query.setParameter("id", id);

        List<Appointment> list = query.getResultList();
        if (list.size() == 1) {
            return list.get(0);
        }
        return null;
    }

    @Override
    public boolean addAppointment(Appointment appointment) {
        WorkHour workHour = workHourRepository.findByDoctorIdAndWorkDate(new User(appointment.getDoctorId().getId()), appointment.getAppDate());
        em.persist(appointment);
        workHourRepository.updatePassiveWorkHourStatus(workHour);
        return true;
    }

    @Override
    public boolean deleteAppointment(int id) {
        Appointment ap = em.find(Appointment.class, id);
        String jpql = "select w from WorkHour w where w.workDate=:date and w.doctorId=:id";
        Query query = em.createQuery(jpql, WorkHour.class);
        query.setParameter("date", ap.getAppDate());
        query.setParameter("id", ap.getDoctorId());
        List<WorkHour> list = query.getResultList();
        if (list.size() == 1) {
            workHourDaoInter.updateActiveWorkHourStatus(list.get(0));
        }
        em.remove(ap);
        return true;
    }

}
