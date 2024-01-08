/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CalculateDay;

import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;

/**
 *
 * @author Phạm Việt Hoàng
 */
public class CalculateDayBetween {

    public static long CalculateDayBetween(String inputDate) {
        long daysBetween = 0;
        DateTimeFormatter dateFormat = DateTimeFormatter.ofPattern("dd-MM-yyyy");
        try {
            LocalDate date = LocalDate.parse(inputDate, dateFormat);
            daysBetween = ChronoUnit.DAYS.between(LocalDate.now(), date);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return daysBetween;
    }
    
    public static void main(String[] args) {
        String date = "29-11-2022";
        System.out.println(CalculateDayBetween(date));
    }
}
