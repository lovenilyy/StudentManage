using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 登录_Exit : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Clear();  //从会话状态集合中移除所有的键和值
        Session.Abandon(); //取消当前会话

        Response.Redirect("../登录/login.aspx");  //跳转登录页
    }
}