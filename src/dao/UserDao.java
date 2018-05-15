package dao;

import bean.User;

public interface UserDao {

    void add(User user)throws Exception;

    User findByUsernameAndPwd(String username, String password) throws Exception;
}
