/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package az.rentcar.model;

/**
 *
 * @author anarx
 */
public class Order {
   private int orderId;
   private RentCar car;
   private String name,sname,email,phone;

    public int getOrderId() {
        return orderId;
    }

    public void setOrderId(int orderId) {
        this.orderId = orderId;
    }

    public RentCar getCar() {
        return car;
    }

    public void setCar(RentCar car) {
        this.car = car;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    @Override
    public String toString() {
        return "Order{" + "orderId=" + orderId + ", car=" + car + ", name=" + name + ", sname=" + sname + ", email=" + email + ", phone=" + phone + '}';
    }
   
   
   
}
