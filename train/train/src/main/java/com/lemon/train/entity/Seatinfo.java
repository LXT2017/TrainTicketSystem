package com.lemon.train.entity;

import java.util.Date;

public class Seatinfo {
    private Integer id;

    private String name;

    private Integer traintype;

    private Integer carriage;

    private Integer seattype;

    private String seat;

    public Seatinfo(Integer id, Integer carriage, Integer seattype, String seat, Date orderdate) {
        this.id= id;
        this.carriage = carriage;
        this.seattype = seattype;
        this.seat = seat;
        this.orderdate = orderdate;
    }

    private Integer status;

    private Date orderdate;

    private Integer orderseatid;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name == null ? null : name.trim();
    }

    public Integer getTraintype() {
        return traintype;
    }

    public void setTraintype(Integer traintype) {
        this.traintype = traintype;
    }

    public Integer getCarriage() {
        return carriage;
    }

    public void setCarriage(Integer carriage) {
        this.carriage = carriage;
    }

    public Integer getSeattype() {
        return seattype;
    }

    public void setSeattype(Integer seattype) {
        this.seattype = seattype;
    }

    public String getSeat() {
        return seat;
    }

    public void setSeat(String seat) {
        this.seat = seat == null ? null : seat.trim();
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Date getOrderdate() {
        return orderdate;
    }

    public void setOrderdate(Date orderdate) {
        this.orderdate = orderdate;
    }

    public Integer getOrderseatid() {
        return orderseatid;
    }

    public void setOrderseatid(Integer orderseatid) {
        this.orderseatid = orderseatid;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", name=").append(name);
        sb.append(", traintype=").append(traintype);
        sb.append(", carriage=").append(carriage);
        sb.append(", seattype=").append(seattype);
        sb.append(", seat=").append(seat);
        sb.append(", status=").append(status);
        sb.append(", orderdate=").append(orderdate);
        sb.append(", orderseatid=").append(orderseatid);
        sb.append("]");
        return sb.toString();
    }
}