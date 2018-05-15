package utils;

import net.sf.json.JsonConfig;
import net.sf.json.processors.JsonValueProcessor;

import java.text.SimpleDateFormat;
import java.util.Date;

public class JsonDateValueProcessor implements JsonValueProcessor {
    private  String datePattern = "HH:mm:ss";//默认将Date转成的我们需要的样式这里只提取时分秒

    public JsonDateValueProcessor() {
        super();
    }

    public JsonDateValueProcessor(String datePattern) {
        super();
        this.datePattern = datePattern;
    }


    public Object processArrayValue(Object value, JsonConfig jsonConfig) {
        try{
            if(value instanceof Date){
                SimpleDateFormat sdf = new SimpleDateFormat(datePattern);
                Date date = (Date)value;
                return sdf.format(date);
            }
            return value == null ? "" : value.toString();
        } catch (Exception e) {
            return "";
        }
//      return null;
    }

    public Object processObjectValue(String key, Object value, JsonConfig jsonConfig) {
        try {
                if(value instanceof Date){
                SimpleDateFormat sdf = new SimpleDateFormat(datePattern);
                Date date = (Date)value;
                return sdf.format(date);
            }
            return value == null ? "" : value.toString();
        } catch (Exception e) {
            return "";
        }
//      return null;
    }

    public String getDatePattern() {
        return datePattern;
    }

    public void setDatePattern(String datePattern) {
        this.datePattern = datePattern;
    }
}
