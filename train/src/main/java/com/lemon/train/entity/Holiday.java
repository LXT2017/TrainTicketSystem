package com.lemon.train.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.util.Date;

public class Holiday {


    private Date vacation;

    private Integer status;
    @JsonFormat(pattern = "yyyy-MM-dd")
    public Date getVacation() {
        return vacation;
    }

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public void setVacation(Date vacation) {
        this.vacation = vacation;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", vacation=").append(vacation);
        sb.append(", status=").append(status);
        sb.append("]");
        return sb.toString();
    }
}