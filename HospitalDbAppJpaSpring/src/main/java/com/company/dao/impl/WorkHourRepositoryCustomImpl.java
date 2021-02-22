package com.company.dao.impl;

import com.company.model.WorkHour;
import org.springframework.stereotype.Repository;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import javax.persistence.Query;
import java.util.List;

/**
 * @author Eminov
 */
@Repository("workHourDao")
public class WorkHourRepositoryCustomImpl implements WorkHourRepositoryCustom {

    @PersistenceContext
    EntityManager em;

    @Override
    public List<WorkHour> getWorkHourList(int doctor_id) {
        String sql = "SELECT * FROM `workhour` WHERE status='a' AND doctor_id=" + doctor_id;
        Query query = em.createNativeQuery(sql, WorkHour.class);
        return query.getResultList();
    }

    @Override
    public List<WorkHour> getWorkHourList() {
        String sql = "SELECT * FROM `workhour` WHERE status='a'";
        Query query = em.createNativeQuery(sql, WorkHour.class);
        return query.getResultList();
    }

    @Override
    public boolean addWorkHour(WorkHour hour) {
        String sql = "Select * from workhour where status='a' AND doctor_id=" + hour.getDoctorId().getId() + " AND work_date='" + hour.getWorkDate() + "'";
        Query query = em.createNativeQuery(sql, WorkHour.class);
        List<WorkHour> list = query.getResultList();
        if (list.size() == 0) {
            em.persist(hour);
            return true;
        }
        return true;
    }

    @Override
    public boolean deleteWorkHour(Integer id) {
        WorkHour hour = em.find(WorkHour.class, id);
        em.remove(hour);
        return true;
    }

    @Override
    public boolean updatePassiveWorkHourStatus(WorkHour workhour) {
        workhour.setStatus("p");
        em.merge(workhour);
        return true;
    }

    @Override
    public boolean updateActiveWorkHourStatus(WorkHour workhour) {
        workhour.setStatus("a");
        em.merge(workhour);
        return true;
    }

}
