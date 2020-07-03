package com.lemon.train.entity;

import com.fasterxml.jackson.annotation.JsonFormat;

import java.math.BigDecimal;
import java.util.Date;

public class Orderinfo {
    private Integer id;

    private String idcard;

    private String realname;

    private Integer seattype;

    private Integer status;

    private Integer carriage;

    private String seat;

    private Date traindate;

    private Date createtime;

    private String trainname;

    private Integer trainid;

    private BigDecimal price;

    private Integer orderId;

    private String duration;

    private String startcity;

    private Date starttime;

    private String endcity;

    private Date endtime;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getIdcard() {
        return idcard;
    }

    public void setIdcard(String idcard) {
        this.idcard = idcard == null ? null : idcard.trim();
    }

    public String getRealname() {
        return realname;
    }

    public void setRealname(String realname) {
        this.realname = realname == null ? null : realname.trim();
    }

    public Integer getSeattype() {
        return seattype;
    }

    public void setSeattype(Integer seattype) {
        this.seattype = seattype;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
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

    @JsonFormat(pattern = "yyyy-MM-dd", timezone = "GMT+8")
    public Date getTraindate() {
        return traindate;
    }

    public void setTraindate(Date traindate) {
        this.traindate = traindate;
    }

    public Date getCreatetime() {
        return createtime;
    }

    public void setCreatetime(Date createtime) {
        this.createtime = createtime;
    }

    public String getTrainname() {
        return trainname;
    }

    public void setTrainname(String trainname) {
        this.trainname = trainname == null ? null : trainname.trim();
    }

    public Integer getTrainid() {
        return trainid;
    }

    public void setTrainid(Integer trainid) {
        this.trainid = trainid;
    }

    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(BigDecimal price) {
        this.price = price;
    }

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration == null ? null : duration.trim();
    }

    public String getStartcity() {
        return startcity;
    }

    public void setStartcity(String startcity) {
        this.startcity = startcity == null ? null : startcity.trim();
    }

    @JsonFormat(pattern = "HH:mm:ss", timezone = "GMT+8")
    public Date getStarttime() {
        return starttime;
    }

    public void setStarttime(Date starttime) {
        this.starttime = starttime;
    }

    public String getEndcity() {
        return endcity;
    }

    public void setEndcity(String endcity) {
        this.endcity = endcity == null ? null : endcity.trim();
    }

    @JsonFormat(pattern = "HH:mm:ss", timezone = "GMT+8")
    public Date getEndtime() {
        return endtime;
    }

    public void setEndtime(Date endtime) {
        this.endtime = endtime;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", idcard=").append(idcard);
        sb.append(", realname=").append(realname);
        sb.append(", seattype=").append(seattype);
        sb.append(", status=").append(status);
        sb.append(", carriage=").append(carriage);
        sb.append(", seat=").append(seat);
        sb.append(", traindate=").append(traindate);
        sb.append(", createtime=").append(createtime);
        sb.append(", trainname=").append(trainname);
        sb.append(", trainid=").append(trainid);
        sb.append(", price=").append(price);
        sb.append(", orderId=").append(orderId);
        sb.append(", duration=").append(duration);
        sb.append(", startcity=").append(startcity);
        sb.append(", starttime=").append(starttime);
        sb.append(", endcity=").append(endcity);
        sb.append(", endtime=").append(endtime);
        sb.append("]");
        return sb.toString();
    }
}