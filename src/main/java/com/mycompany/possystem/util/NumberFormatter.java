package com.mycompany.possystem.util;

import java.text.DecimalFormat;

public class NumberFormatter {
    private static final DecimalFormat formatter = new DecimalFormat("#,##0.00");

    public static String format(double amount) {
        return formatter.format(amount);
    }
}
