/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package az.itedu.servlet;

import az.automobile.fileops.AutoFileOps;
import az.automobile.model.Automobile;

/**
 *
 * @author anarx
 */
public class Test {
   

    public static void main(String[] args) {
                AutoFileOps afo=new AutoFileOps();
     /*   Automobile a=new Automobile();
        a.setId("3");
        a.setMarka("Toyota");
       a.setModel("Prado");
       a.setType("Jeep");
       a.setYear("2007");
       a.setMotor("2700");
       a.setColor("White");
       a.setTransmission("Automatic");
       a.setPrice("1/45AZN, 7/300AZN, 30/700AZN");
      

        System.out.println(afo.addAutomobile(a));*/
       
    for(Automobile a:afo.getAllAuto()){
           System.out.println(a);
       }
    }
}
