package myconverter;

import org.apache.commons.beanutils.Converter;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

public class MyConverter implements Converter {
    @Override
    public Object convert(Class clazz,Object value){
        //class 要转换成的类型
        //object为页面上传入的值
        //将object转成date类型
        SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        try {
            Date date = sdf.parse((String) value);
            return date;
        } catch (ParseException e) {
            e.printStackTrace();
        }
        return null;
    }
}
