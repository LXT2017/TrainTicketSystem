package com.lemon.train.entity;

import java.util.Date;

public class Trainticket {
    private Integer id;

    private Integer fnum;

    public Trainticket(Integer fnum, Integer snum, Date ticketdate, Integer trainId) {
        this.fnum = fnum;
        this.snum = snum;
        this.ticketdate = ticketdate;
        this.trainId = trainId;
    }

    private Integer snum;

    private Date ticketdate;

    private Integer trainId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getFnum() {
        return fnum;
    }

    public void setFnum(Integer fnum) {
        this.fnum = fnum;
    }

    public Integer getSnum() {
        return snum;
    }

    public void setSnum(Integer snum) {
        this.snum = snum;
    }

    public Date getTicketdate() {
        return ticketdate;
    }

    public void setTicketdate(Date ticketdate) {
        this.ticketdate = ticketdate;
    }

    public Integer getTrainId() {
        return trainId;
    }

    public void setTrainId(Integer trainId) {
        this.trainId = trainId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", fnum=").append(fnum);
        sb.append(", snum=").append(snum);
        sb.append(", ticketdate=").append(ticketdate);
        sb.append(", trainId=").append(trainId);
        sb.append("]");
        return sb.toString();
    }
}