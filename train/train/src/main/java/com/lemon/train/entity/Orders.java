package com.lemon.train.entity;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.math.BigDecimal;
import java.util.Date;

public class Orders {
    private Integer id;

    private Integer status;

    private BigDecimal price;

    private Date traindate;

    private Date createtime;

    private Integer userId;

    private Integer trainId;

    private Integer seattype;

    private Integer carriage;

    private String seat;

    private Integer orderId;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getTraindate() {
        return traindate;
    }

    @DateTimeFormat(pattern = "yyyy-MM-dd")
    public void setTraindate(Date traindate) {
        this.traindate = traindate;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getTrainId() {
        return trainId;
    }

    public void setTrainId(Integer trainId) {
        this.trainId = trainId;
    }

    public Integer getSeattype() {
        return seattype;
    }

    public void setSeattype(Integer seattype) {
        this.seattype = seattype;
    }

    public Integer getCarriage() {
        return carriage;
    }

    public void setCarriage(Integer carriage) {
        this.carriage = carriage;
    }

    public String getSeat() {
        return seat;
    }

    public void setSeat(String seat) {
        this.seat = seat == null ? null : seat.trim();
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", status=").append(status);
        sb.append(", price=").append(price);
        sb.append(", traindate=").append(traindate);
        sb.append(", createtime=").append(createtime);
        sb.append(", userId=").append(userId);
        sb.append(", trainId=").append(trainId);
        sb.append(", seattype=").append(seattype);
        sb.append(", carriage=").append(carriage);
        sb.append(", seat=").append(seat);
        sb.append(", orderId=").append(orderId);
        sb.append("]");
        return sb.toString();
    }
}