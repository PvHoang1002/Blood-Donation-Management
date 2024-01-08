/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package CheckValidation;

/**
 *
 * @author Phạm Việt Hoàng
 */
public class CheckValidSSN {
    private static final int SSN_DIGITS = 12;
    public static boolean checkValidSSN(String ssn) {
        if(ssn.matches("[0-9]+") && ssn.length() == SSN_DIGITS) {
            return true;
        }
        return false;
    }
    
    public static void main(String[] args) {
        String a = "001203006231";
        System.out.println(checkValidSSN(a));
    }
}
