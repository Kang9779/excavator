function checkform()
{
    var form = document.register;
    var user_name=form.getElementById("username");
    var password = form.getElementById("password");
    var confirmpassword = form.getElementById("confirm password");
    if(user_name==""||user_name==null)
    {
        alert("用户名不能为空！");
        form.element("username").focus();
    }
    if(password==""||password==null)
    {
        alert("密码不能为空！");
        form.element("password").focus();
    }
    if(!password.equalTo(confirmpassword))
    {
        alert("密码输入不一致！");
        form.element("confirm password").focus();
    }
}