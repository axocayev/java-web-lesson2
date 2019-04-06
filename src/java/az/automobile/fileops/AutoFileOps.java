/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package az.automobile.fileops;

import az.automobile.model.Automobile;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author anarx
 */
public class AutoFileOps {

    File file = new File("D:\\mobile.txt");

    private static String leftPad(String string, int length) {
        String format = "%" + length + "s";
        return String.format(format, string);
    }

    public boolean addAutomobile(Automobile automobile) {
        boolean res = false;
        try {
            FileOutputStream fileOutputStream = new FileOutputStream(file, true);

            fileOutputStream.write(leftPad(automobile.getId(), 6).getBytes());
            fileOutputStream.write(leftPad(automobile.getMarka(), 20).getBytes());
            fileOutputStream.write(leftPad(automobile.getModel(), 10).getBytes());
            fileOutputStream.write(leftPad(automobile.getType(), 10).getBytes());
            fileOutputStream.write(leftPad(automobile.getYear(), 5).getBytes());
            fileOutputStream.write(leftPad(automobile.getMotor(), 5).getBytes());
            fileOutputStream.write(leftPad(automobile.getColor(), 10).getBytes());
            fileOutputStream.write(leftPad(automobile.getTransmission(), 10).getBytes());
            fileOutputStream.write(leftPad(automobile.getPrice(), 50).getBytes());
            fileOutputStream.write("\n".getBytes());
            fileOutputStream.close();
            res = true;
        } catch (FileNotFoundException ex) {
            Logger.getLogger(AutoFileOps.class.getName()).log(Level.SEVERE, null, ex);
            res = false;
        } catch (IOException ex) {
            Logger.getLogger(AutoFileOps.class.getName()).log(Level.SEVERE, null, ex);
            res = false;

        }
        return res;
    }

    public List<Automobile> getAllAuto() {
        List<Automobile> list = new ArrayList<>();
        try {
            Scanner in = new Scanner(file);
            while (in.hasNextLine()) {
                String line = in.nextLine();
                Automobile automobile = new Automobile();
                System.out.println(line);
                System.out.println(line.substring(37, 46));

                automobile.setId(line.substring(0, 6).trim());
                automobile.setMarka(line.substring(7, 27).trim());
                automobile.setModel(line.substring(27, 36).trim());
                automobile.setType(line.substring(37, 46).trim());
                automobile.setYear(line.substring(47, 51).trim());
                automobile.setMotor(line.substring(52, 56).trim());
                automobile.setColor(line.substring(57, 66).trim());
                automobile.setTransmission(line.substring(67, 76).trim());
                automobile.setPrice(line.substring(77, 126).trim());

                /*
            fileOutputStream.write(leftPad(automobile.getColor(), 10).getBytes());
            fileOutputStream.write(leftPad(automobile.getTransmission(), 10).getBytes());
            fileOutputStream.write(leftPad(automobile.getPrice(), 50).getBytes());
                 */
                list.add(automobile);
            }

            in.close();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(AutoFileOps.class.getName()).log(Level.SEVERE, null, ex);
        }

        return list;
    }

    public boolean updateAuto(Automobile automobile) {
        List<Automobile> list = getAllAuto();
        FileOutputStream fileOutputStream;
        try {
            fileOutputStream = new FileOutputStream(file);
            fileOutputStream.close();
        } catch (FileNotFoundException ex) {
            Logger.getLogger(AutoFileOps.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IOException ex) {
            Logger.getLogger(AutoFileOps.class.getName()).log(Level.SEVERE, null, ex);
        }
        for (Automobile a : list) {
            if (a.getId().equals(automobile.getId())) {
                addAutomobile(automobile);
            } else {
                addAutomobile(a);
            }
        }

        return true;
    }

    public boolean deleteAuto(Automobile automobile) {

        return true;
    }

    public Automobile getAutoById(String id) {

        List<Automobile> list = getAllAuto();
        Automobile automobile = null;
        for (Automobile a : list) {
            if (a.getId().equals(id)) {
                automobile = a;
                break;
            }
        }

        return automobile;
    }

    public int getNextId() {
        List<Automobile> list = getAllAuto();
        Automobile automobile = list.get(list.size() - 1);
        return Integer.parseInt(automobile.getId()) + 1;
    }
}
