/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package az.rentcar.dao;

import az.rentcar.db.DatabaseConnection;
import az.rentcar.model.Marka;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author anarx
 */
public class MarkaDAO extends Database {

    public int addMarka(Marka marka) {
        //DML data manupulation lang  -- insert delete update
        int res = 0;
        try (DatabaseConnection dbc = new DatabaseConnection()) {
            conn = dbc.getConnection();
            ps = conn.prepareStatement("insert into marka_car values(marka_car_seq.nextval,?)");
            ps.setString(1, marka.getName());
            res = ps.executeUpdate();
            closeAll();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return res;
    }



    public List<Marka> getAllMarka() {
        List<Marka> allMarka = new ArrayList<>();
        try (DatabaseConnection dbc = new DatabaseConnection()) {
            conn = dbc.getConnection();
            ps = conn.prepareStatement("select * from marka_car order by name");
            rs = ps.executeQuery();
            while (rs.next()) {
                Marka m = new Marka();
                m.setId(rs.getInt("id"));
                m.setName(rs.getString("name"));
                allMarka.add(m);
            }

            closeAll();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return allMarka;
    }

    public Marka getMarkaById(int id) {
        Marka marka = new Marka();
        try (DatabaseConnection dbc = new DatabaseConnection()) {
            conn = dbc.getConnection();
            ps = conn.prepareStatement("select * from marka_car where id=?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {
                Marka m = new Marka();
                m.setId(rs.getInt("id"));
                m.setName(rs.getString("name"));
                marka = m;
            }

            closeAll();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return marka;
    }

    public static void main(String[] args) {
        MarkaDAO aO = new MarkaDAO();
        /*for (Marka mm : aO.getAllMarka()) {
            System.out.println(mm);
        }*/

        /*  Marka m=new Marka();
        m.setName("Nissan");
        System.out.println(aO.addMarka(m));*/
        System.out.println(aO.getMarkaById(7));
    }
}
