package bean;
import java.io.Serializable;
import java.util.Date;

/**
 * 传感器实体类
 */
public class Sensor implements Serializable {
    private String sid; //传感器id
    private Module module;//模块号

    private String dgwp;//斗杆无杆腔压力
    private String dgwy;//斗杆位移
    private String dgyp;//斗杆有杆腔压力
    private String dgY;//斗杆Y倾角
    private String dgX;//斗杆X倾角

    private String dbyp;//动臂有杆腔压力
    private String dbwp;//动臂无杆腔压力
    private String dbwy;//动臂位移
    private String dbY;//动臂Y倾角
    private String dbX;//动臂X倾角

    private String cdwy;//铲斗位移
    private String cdwp;//铲斗无杆腔压力
    private String cdyp;//铲斗有杆腔压力
    private String cdX;//铲斗X倾角
    private String cdY;//铲斗Y倾角

    private String location;//位置信息
    private Date date;//时间

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public Module getModule() {
        return module;
    }

    public void setModule(Module module) {
        this.module = module;
    }

    public String getDgwp() {
        return dgwp;
    }

    public void setDgwp(String dgwp) {
        this.dgwp = dgwp;
    }

    public String getDgwy() {
        return dgwy;
    }

    public void setDgwy(String dgwy) {
        this.dgwy = dgwy;
    }

    public String getDgyp() {
        return dgyp;
    }

    public void setDgyp(String dgyp) {
        this.dgyp = dgyp;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getDbyp() {
        return dbyp;
    }

    public void setDbyp(String dbyp) {
        this.dbyp = dbyp;
    }

    public String getDbwp() {
        return dbwp;
    }

    public void setDbwp(String dbwp) {
        this.dbwp = dbwp;
    }

    public String getDbwy() {
        return dbwy;
    }

    public void setDbwy(String dbwy) {
        this.dbwy = dbwy;
    }

    public String getDgY() {
        return dgY;
    }

    public void setDgY(String dgY) {
        this.dgY = dgY;
    }

    public String getDgX() {
        return dgX;
    }

    public void setDgX(String dgX) {
        this.dgX = dgX;
    }

    public String getCdyp() {
        return cdyp;
    }

    public void setCdyp(String cdyp) {
        this.cdyp = cdyp;
    }

    public String getDbY() {
        return dbY;
    }

    public void setDbY(String dbY) {
        this.dbY = dbY;
    }

    public String getDbX() {
        return dbX;
    }

    public void setDbX(String dbX) {
        this.dbX = dbX;
    }

    public String getCdX() {
        return cdX;
    }

    public void setCdX(String cdX) {
        this.cdX = cdX;
    }

    public String getCdY() {
        return cdY;
    }

    public void setCdY(String cdY) {
        this.cdY = cdY;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCdwy() {
        return cdwy;
    }

    public void setCdwy(String cdwy) {
        this.cdwy = cdwy;
    }

    public String getCdwp() {
        return cdwp;
    }

    public void setCdwp(String cdwp) {
        this.cdwp = cdwp;
    }
}
