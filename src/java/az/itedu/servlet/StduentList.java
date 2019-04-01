/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package az.itedu.servlet;

import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author anarx
 */
public class StduentList {
    public  List<Student> getAllStudent(){
        Student s1=new Student();
        Student s2=new Student();
        Student s3=new Student();
        Student s4=new Student();
        s1.setId(1);
        s1.setName("Anar");
        s1.setSurname("Xocayev");
        s1.setEmail("anarxocayev@gmail.com");
        s1.setPhone("+994556112116");
        
        
        s2.setId(2);
        s2.setName("Asif");
        s2.setSurname("Haciyev");
        s2.setEmail("asifhaciyev@gmail.com");
        s2.setPhone("+994559898959");
        
        s3.setId(3);
        s3.setName("Xalid");
        s3.setSurname("Baxseliyev");
        s3.setEmail("xalibaxsi@gmail.com");
        s3.setPhone("+994556021202");
        
        s4.setId(4);
        s4.setName("Kamal");
        s4.setSurname("Baxseliyev");
        s4.setEmail("kamalibaxsi@gmail.com");
        s4.setPhone("+99455605451545");
        List<Student>  list=new ArrayList<>();
        list.add(s1);
        list.add(s2);
        list.add(s3);
        list.add(s4);
    
        return list;
        
    }
}
