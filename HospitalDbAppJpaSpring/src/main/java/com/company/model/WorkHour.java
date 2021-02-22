/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.company.model;

import javax.persistence.*;
import java.io.Serializable;

/**
 *
 * @author Eminov
 */
@Entity
@Table(name = "workhour")

public class WorkHour implements Serializable {

    @Column(name = "status")
    private String status;

    private static final long serialVersionUID = 1L;
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Basic(optional = false)
    @Column(name = "id")
    private Integer id;
    @Column(name = "work_date")
    private String workDate;
    @JoinColumn(name = "doctor_id", referencedColumnName = "id")
    @ManyToOne
    private User doctorId;

    public WorkHour() {
    }

    public WorkHour(String workDate, User doctorId) {
        this.workDate = workDate;
        this.doctorId = doctorId;
    }

    public WorkHour(Integer id, String workDate, String status, User doctorId) {
        this.id = id;
        this.workDate = workDate;
        this.status = status;
        this.doctorId = doctorId;
    }

    public WorkHour(Integer id) {
        this.id = id;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getWorkDate() {
        return workDate;
    }

    public void setWorkDate(String workDate) {
        this.workDate = workDate;
    }


    public User getDoctorId() {
        return doctorId;
    }

    public void setDoctorId(User doctorId) {
        this.doctorId = doctorId;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (id != null ? id.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof WorkHour)) {
            return false;
        }
        WorkHour other = (WorkHour) object;
        if ((this.id == null && other.id != null) || (this.id != null && !this.id.equals(other.id))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "Workhour{" +
                "id=" + id +
                ", workDate='" + workDate + '\'' +
                ", status='" + status + '\'' +
                ", doctorId=" + doctorId +
                '}';
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
