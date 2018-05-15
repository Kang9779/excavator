package service.impl;

import dao.UserDao;
import dao.impl.UserDaoImpl;
import bean.User;
import service.UserService;

public class UserServiceImpl implements UserService{
    /***
     * 用户注册
     */
    @Override
    public void regist(User user) throws Exception {
        UserDao dao = new UserDaoImpl();
        dao.add(user);
    }

    /**
     * 用户登陆
     * @param username
     * @param password
     * @return
     * @throws Exception
     */
    @Override
    public User login(String username, String password) throws Exception {
        UserDao dao = new UserDaoImpl();
        User user = null;
        user = dao.findByUsernameAndPwd(username,password);
        return user;
    }
}
