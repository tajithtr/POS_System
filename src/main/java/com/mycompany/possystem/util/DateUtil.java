package com.mycompany.possystem.util;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateUtil {
    private static final SimpleDateFormat dateFormat = new SimpleDateFormat("dd-MMM-yyyy hh:mm a");

    public static String format(Date date) {
        return dateFormat.format(date);
    }
}
