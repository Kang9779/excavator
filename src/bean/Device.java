package bean;

import java.io.Serializable;

/**
 * 设备实体类
 */
public class Device implements Serializable {
    private String did;//设备id
    private String dname;//设备名
    private String manufacturer;//生产厂商
    private String power;//功率
    private String capacity;//容量
    private String work_weight;//负载重量
    private User user;//用户id
    private String mid;//模块id
    private String work_hours;//工作时长
    private String devstatus = String.valueOf(1);//设备状态

    public String getCapacity() {
        return capacity;
    }

    public void setCapacity(String capacity) {
        this.capacity = capacity;
    }

    public String getWork_hours() {
        return work_hours;
    }

    public void setWork_hours(String work_hours) {
        this.work_hours = work_hours;
    }

    public String getDid() {
        return did;
    }

    public void setDid(String did) {
        this.did = did;
    }

    public String getDname() {
        return dname;
    }

    public void setDname(String dname) {
        this.dname = dname;
    }

    public String getManufacturer() {
        return manufacturer;
    }

    public void setManufacturer(String manufacturer) {
        this.manufacturer = manufacturer;
    }

    public String getPower() {
        return power;
    }

    public void setPower(String power) {
        this.power = power;
    }

    public String getWork_weight() {
        return work_weight;
    }

    public void setWork_weight(String work_weight) {
        this.work_weight = work_weight;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getDevstatus() {
        return devstatus;
    }

    public void setDevstatus(String devstatus) {
        this.devstatus = devstatus;
    }
}
