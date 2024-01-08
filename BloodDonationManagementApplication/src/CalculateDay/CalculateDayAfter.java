/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CalculateDay;

/**
 *
 * @author Phạm Việt Hoàng
 */
public class CalculateDayAfter {

    public static String calculateDayAfter(String date) {
        int daysAfter = 84;

        int day = Integer.parseInt(date.substring(0, 2));
        int month = Integer.parseInt(date.substring(3, 5));
        int year = Integer.parseInt(date.substring(6));

        int daysLeft = daysInMonth(month, year) - day;
        if (daysAfter <= daysLeft) {
            day += daysAfter;
        }
        while (daysAfter > daysLeft) {
            daysAfter -= daysLeft;
            day = 0;
            month++;
            if (month == 13) {
                month = 1;
                year++;
            }
            daysLeft = daysInMonth(month, year);
            if (daysAfter <= daysLeft) {
                day += daysAfter;
            }
        }

        String dayString, monthString, yearString;
        if (day >= 10) {
            dayString = Integer.toString(day);
        } else {
            dayString = '0' + Integer.toString(day);
        }

        if (month >= 10) {
            monthString = Integer.toString(month);
        } else {
            monthString = '0' + Integer.toString(month);
        }

        if (year >= 10 && year < 100) {
            yearString = "00" + Integer.toString(year);
        } else if (year >= 100 && year < 1000) {
            yearString = '0' + Integer.toString(year);
        } else if (year >= 1000) {
            yearString = Integer.toString(year);
        } else {
            yearString = "000" + Integer.toString(year);
        }
        String dateAfter = dayString + "-" + monthString + '-' + yearString;
        return dateAfter;
    }

    private boolean isValidDate(int day, int month, int year) {
        if (day <= 0 || day > 31 || month <= 0 || month > 12 || year < 0) {
            return false;
        }
        int days = daysInMonth(month, year);
        if (day > days) {
            return false;
        }
        return true;
    }

    private static boolean isLeapYear(int year) {
        if (year % 400 == 0) {
            return true;
        }
        if (year % 100 == 0) {
            return false;
        }
        if (year % 4 == 0) {
            return true;
        }
        return false;
    }

    private static int daysInMonth(int month, int year) {
        int days = 0;
        switch (month) {
            case 1:
            case 3:
            case 5:
            case 7:
            case 8:
            case 10:
            case 12:
                days = 31;
                break;
            case 4:
            case 6:
            case 9:
            case 11:
                days = 30;
                break;
            case 2:
                if (isLeapYear(year)) {
                    days = 29;
                } else {
                    days = 28;
                }
                break;
            default:
                break;
        }
        return days;
    }
}
