package bean;

import java.io.Serializable;

public class Module implements Serializable {
    private String mid;//模块号
    private String modsim;//模块sim卡号
    private Integer modstatus = 0;//模块状态：2表示已损坏，1表示已绑定设备，0表示待绑定设备，默认为0；

    public String getMid() {
        return mid;
    }

    public void setMid(String mid) {
        this.mid = mid;
    }

    public String getModsim() {
        return modsim;
    }

    public void setModsim(String modsim) {
        this.modsim = modsim;
    }

    public Integer getModstatus() {
        return modstatus;
    }

    public void setModstatus(Integer modstatus) {
        this.modstatus = modstatus;
    }
}
