/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package az.rentcar.dao;

import az.rentcar.db.DatabaseConnection;
import az.rentcar.model.Order;

/**
 *
 * @author anarx
 */
public class OrderDao extends Database{
    public int createOrder(Order order){
        int res=0;
        
          try (DatabaseConnection dbc = new DatabaseConnection()) {
            conn = dbc.getConnection();
            ps = conn.prepareStatement("insert into order_car(id,car_id,name,sname,email,phone) \n" +
                                      " values(order_car_seq.nextval,?,?,?,?,?)");
            ps.setInt(1, order.getCar().getId());
            ps.setString(2, order.getName());
            ps.setString(3, order.getSname());
            ps.setString(4, order.getEmail());
            ps.setString(5, order.getPhone());
       
            res=ps.executeUpdate();
     
            closeAll();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return res;
    }
}
