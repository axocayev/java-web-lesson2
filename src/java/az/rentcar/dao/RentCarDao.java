/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package az.rentcar.dao;

import az.rentcar.db.DatabaseConnection;
import az.rentcar.model.Model;
import az.rentcar.model.RentCar;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author anarx
 */
public class RentCarDao extends Database {

    public List<RentCar> getAllCars() {
        List<RentCar> modelListByMarka = new ArrayList<>();
        MarkaDAO markaDAO = new MarkaDAO();
        ModelDAO modelDAO = new ModelDAO();
        try (DatabaseConnection dbc = new DatabaseConnection()) {
            conn = dbc.getConnection();
            ps = conn.prepareStatement("select * from rent_car");

            rs = ps.executeQuery();
            while (rs.next()) {
                RentCar rentCar = new RentCar();

                rentCar.setId(rs.getInt("id"));
                rentCar.setColor(rs.getString("color"));
                rentCar.setMotor(rs.getString("motor"));
                rentCar.setPrice(rs.getString("price"));
                rentCar.setTransmission(rs.getString("transmission"));
                rentCar.setType(rs.getString("type"));
                rentCar.setYear(rs.getString("year"));
                rentCar.setMarka(markaDAO.getMarkaById(rs.getInt("marka_id")));
                rentCar.setModel(modelDAO.getModelById(rs.getInt("model_id")));
                modelListByMarka.add(rentCar);
            }

            closeAll();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return modelListByMarka;
    }

    public List<RentCar> getCarsByMarka(int marka_id) {
        List<RentCar> modelListByMarka = new ArrayList<>();
        MarkaDAO markaDAO = new MarkaDAO();
        ModelDAO modelDAO = new ModelDAO();
        try (DatabaseConnection dbc = new DatabaseConnection()) {
            conn = dbc.getConnection();
            ps = conn.prepareStatement("select * from rent_car where marka_id=?");
            ps.setInt(1, marka_id);

            rs = ps.executeQuery();
            while (rs.next()) {
                RentCar rentCar = new RentCar();

                rentCar.setId(rs.getInt("id"));
                rentCar.setColor(rs.getString("color"));
                rentCar.setMotor(rs.getString("motor"));
                rentCar.setPrice(rs.getString("price"));
                rentCar.setTransmission(rs.getString("transmission"));
                rentCar.setType(rs.getString("type"));
                rentCar.setYear(rs.getString("year"));
                rentCar.setMarka(markaDAO.getMarkaById(rs.getInt("marka_id")));
                rentCar.setModel(modelDAO.getModelById(rs.getInt("model_id")));
                modelListByMarka.add(rentCar);
            }

            closeAll();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return modelListByMarka;
    }

    public RentCar getRentCarById(int rentCar_id) {
        RentCar rentCar = new RentCar();
        MarkaDAO markaDAO = new MarkaDAO();
        ModelDAO modelDAO = new ModelDAO();
        try (DatabaseConnection dbc = new DatabaseConnection()) {
            conn = dbc.getConnection();
            ps = conn.prepareStatement("select * from rent_car where id=?");
            ps.setInt(1, rentCar_id);

            rs = ps.executeQuery();
            if (rs.next()) {

                rentCar.setId(rs.getInt("id"));
                rentCar.setColor(rs.getString("color"));
                rentCar.setMotor(rs.getString("motor"));
                rentCar.setPrice(rs.getString("price"));
                rentCar.setTransmission(rs.getString("transmission"));
                rentCar.setType(rs.getString("type"));
                rentCar.setYear(rs.getString("year"));
                rentCar.setMarka(markaDAO.getMarkaById(rs.getInt("marka_id")));
                rentCar.setModel(modelDAO.getModelById(rs.getInt("model_id")));

            }

            closeAll();

        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return rentCar;
    }

}
