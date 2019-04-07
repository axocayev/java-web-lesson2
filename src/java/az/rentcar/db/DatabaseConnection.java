/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package az.rentcar.db;

import java.io.Closeable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author anarx
 */
public class DatabaseConnection implements Closeable{
    private Connection conn=null;
    
    public  Connection getConnection(){
       
        try {
            Class.forName("oracle.jdbc.driver.OracleDriver");
          //  Class.forName("com.mysql.jdbc.Driver");  //
            String user="auto";
            String pass="auto";
            String url="jdbc:oracle:thin:@192.168.100.204:1521:xe";
      //      String url_mysql="jdbc:mysql://localhost:3306/dbname";
            conn=DriverManager.getConnection(url, user, pass);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return conn;
    }
    
    public static void main(String[] args) {
        System.out.println(new DatabaseConnection().getConnection());
    }
    
    @Override
    public  void close(){
        try {
            conn.close();
        } catch (SQLException ex) {
            Logger.getLogger(DatabaseConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
            
}
