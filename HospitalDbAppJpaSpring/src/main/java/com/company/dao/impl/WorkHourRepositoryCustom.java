package com.company.dao.impl;

import com.company.model.WorkHour;

import java.util.List;

/**
 *
 * @author Eminov
 */
public interface WorkHourRepositoryCustom {

    public boolean addWorkHour(WorkHour hour);

    public boolean deleteWorkHour(Integer id);

    public List<WorkHour> getWorkHourList(int doctor_id);

    public List<WorkHour> getWorkHourList();

    public boolean updatePassiveWorkHourStatus(WorkHour workhour);

    public boolean updateActiveWorkHourStatus(WorkHour workhour);
}
