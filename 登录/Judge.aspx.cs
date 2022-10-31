using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 登录界面_main : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["Login"] == null && Session["Login"] != "yes")
        {
            Response.Write("您还没有登录，请<a href=Login.aspx>登录</a>");
            Response.End();
        }
    }
}