package com.lemon.train.entity;

public class Pricemanage {
    private Integer id;

    private Double returnprice;

    private Double discount1;

    private Double discount2;

    private Double discount3;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Double getReturnprice() {
        return returnprice;
    }

    public void setReturnprice(Double returnprice) {
        this.returnprice = returnprice;
    }

    public Double getDiscount1() {
        return discount1;
    }

    public void setDiscount1(Double discount1) {
        this.discount1 = discount1;
    }

    public Double getDiscount2() {
        return discount2;
    }

    public void setDiscount2(Double discount2) {
        this.discount2 = discount2;
    }

    public Double getDiscount3() {
        return discount3;
    }

    public void setDiscount3(Double discount3) {
        this.discount3 = discount3;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", returnprice=").append(returnprice);
        sb.append(", discount1=").append(discount1);
        sb.append(", discount2=").append(discount2);
        sb.append(", discount3=").append(discount3);
        sb.append("]");
        return sb.toString();
    }
}