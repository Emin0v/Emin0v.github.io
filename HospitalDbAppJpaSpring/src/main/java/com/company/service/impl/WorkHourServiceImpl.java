package com.company.service.impl;

import com.company.dao.impl.WorkHourRepositoryCustom;
import com.company.model.WorkHour;
import com.company.service.inter.WorkHourServiceInter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;

/**
 * @author Eminov
 */
@Service
@Transactional
public class WorkHourServiceImpl implements WorkHourServiceInter {

    @Autowired
    @Qualifier("workHourDao")
    private WorkHourRepositoryCustom workHourDaoInter;

    @Override
    public List<WorkHour> getWorkHourList(int doctor_id) {
        return workHourDaoInter.getWorkHourList(doctor_id);
    }

    @Override
    public List<WorkHour> getWorkHourList() {
        return workHourDaoInter.getWorkHourList();
    }

    @Override
    public boolean addWorkHour(WorkHour hour) {
        return workHourDaoInter.addWorkHour(hour);
    }

    @Override
    public boolean deleteWorkHour(Integer id) {
        return workHourDaoInter.deleteWorkHour(id);
    }

    @Override
    public boolean updatePassiveWorkHourStatus(WorkHour workhour) {
        return workHourDaoInter.updatePassiveWorkHourStatus(workhour);
    }

    @Override
    public boolean updateActiveWorkHourStatus(WorkHour workhour) {
        return workHourDaoInter.updateActiveWorkHourStatus(workhour);
    }
}
