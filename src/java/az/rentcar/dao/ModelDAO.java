/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package az.rentcar.dao;

import az.rentcar.db.DatabaseConnection;
import az.rentcar.model.Marka;
import az.rentcar.model.Model;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author anarx
 */
public class ModelDAO extends Database {

    public Model getModelById(int id) {
        Model model = new Model();
        MarkaDAO markaDAO = new MarkaDAO();

        try (DatabaseConnection dbc = new DatabaseConnection()) {
            conn = dbc.getConnection();
            ps = conn.prepareStatement("select * from model_car where id=?");
            ps.setInt(1, id);
            rs = ps.executeQuery();
            if (rs.next()) {

                model.setId(rs.getInt("id"));
                model.setName(rs.getString("name"));
                model.setMarka(markaDAO.getMarkaById(rs.getInt("marka_id")));

            }

            closeAll();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }

        return model;
    }

    public List<Model> getModelListByMarka(Marka marka) {
        List<Model> modelListByMarka = new ArrayList<>();
        MarkaDAO markaDAO = new MarkaDAO();

        try (DatabaseConnection dbc = new DatabaseConnection()) {
            conn = dbc.getConnection();
            ps = conn.prepareStatement("select * from model_car where marka_id=?");
            ps.setInt(1, marka.getId());
            rs = ps.executeQuery();
            while (rs.next()) {
                Model model = new Model();

                model.setId(rs.getInt("id"));
                model.setName(rs.getString("name"));
                model.setMarka(markaDAO.getMarkaById(rs.getInt("marka_id")));
                modelListByMarka.add(model);
            }

            closeAll();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return modelListByMarka;
    }

     public List<Model> getAllModel() {
        List<Model> modelListByMarka = new ArrayList<>();
        MarkaDAO markaDAO = new MarkaDAO();

        try (DatabaseConnection dbc = new DatabaseConnection()) {
            conn = dbc.getConnection();
            ps = conn.prepareStatement("select * from model_car");
            
            rs = ps.executeQuery();
            while (rs.next()) {
                Model model = new Model();

                model.setId(rs.getInt("id"));
                model.setName(rs.getString("name"));
                model.setMarka(markaDAO.getMarkaById(rs.getInt("marka_id")));
                modelListByMarka.add(model);
            }

            closeAll();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return modelListByMarka;
    }
    
    
    
    public static void main(String[] args) {
        ModelDAO m = new ModelDAO();
        System.out.println(m.getModelById(9));

        MarkaDAO mdo = new MarkaDAO();
        Marka marka = mdo.getMarkaById(7);
        System.out.println("Mark  " + marka);
        for (Model mm : m.getModelListByMarka(marka)) {
            System.out.println(mm);
        }

    }
}
