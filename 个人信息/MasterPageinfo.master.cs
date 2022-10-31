using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 个人信息_MasterPageinfo : System.Web.UI.MasterPage
{
    public static string name;
    protected void Page_Load(object sender, EventArgs e)
    {
        name = Session["Name"].ToString();
    }
}
