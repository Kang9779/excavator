package dao.impl;

import dao.UserDao;
import bean.User;
import org.apache.commons.dbutils.QueryRunner;
import org.apache.commons.dbutils.handlers.BeanHandler;
import utils.DataSourceUtils;

import java.sql.SQLException;

public class UserDaoImpl implements UserDao{

    /**
     * 用户注册
     * */
    @Override
    public void add(User user) throws Exception {

        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "insert into user values(?,?,?,?,?);";
        try {
            qr.update(sql,user.getUid(),user.getUsername(),user.getPassword(),user.getEmail(),user.getTelephone());
        }
        catch (SQLException e){
            e.printStackTrace();
        }
    }

    @Override
    public User findByUsernameAndPwd(String username, String password) throws Exception {
        QueryRunner qr = new QueryRunner(DataSourceUtils.getDataSource());
        String sql = "select * from user where username=? and password=?";
        User user= new User();
        user = qr.query(sql,new BeanHandler<>(User.class),username,password);
        return user;
    }
}
