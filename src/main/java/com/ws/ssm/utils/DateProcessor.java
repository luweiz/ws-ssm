package com.ws.ssm.utils;

import java.text.SimpleDateFormat;
import java.util.Date;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

/**
 * Date Processor
 * 
 * @author Robert Lai
 * 
 */
public class DateProcessor implements JsonValueProcessor {

    private String dateFormat;

    public DateProcessor(String dateFormat) {
        this.dateFormat = dateFormat;
    }

    public Object processArrayValue(Object value, JsonConfig jsonConfig) {
        return null;
    }

    public Object processObjectValue(String key, Object value, JsonConfig jsonConfig) {
        if (value == null) {
            return "";
        }
        // transform
        Date date = (Date) value;
        SimpleDateFormat sdf = new SimpleDateFormat(dateFormat);
        return sdf.format(date);
    }
}
