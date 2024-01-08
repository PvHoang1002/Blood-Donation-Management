/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CheckValidation;

/**
 *
 * @author Phạm Việt Hoàng
 */
public class CheckValidPhoneNumber {

    private static final int PHONE_NUMBER_DIGITS = 10;

    public static boolean checkValidPhoneNumber(String phoneNumber) {
        if (phoneNumber.matches("[0-9]+") && phoneNumber.charAt(0) == '0' && phoneNumber.length() == PHONE_NUMBER_DIGITS) {
            return true;
        }
        return false;
    }

    public static void main(String[] args) {
        String a = "0586836231";
        System.out.println(checkValidPhoneNumber(a));
    }
}
