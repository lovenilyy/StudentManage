using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;

public partial class 登录界面_admin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        }
    }
    protected void BT_in_Click(object sender, EventArgs e)
    {
        string name = TB_Yhm.Text.ToString().Trim();
        string pwd = TB_pwd.Text.ToString().Trim();
        string sf = RBL_Cel.Text.Trim();
        string sql = "SELECT * from Yh where Name='" + name + "'and pwd='" + pwd + "'and Sf='" + sf + "'";

        DataSet ds=CSql.GetDataSet(sql);
        DataTable dt = ds.Tables[0];
        
        if (dt.Rows.Count > 0)
        {
            switch (sf)
            {
                case "学生":
                    Session["Login"] = "yes";
                    Session["Name"]=TB_Yhm.Text.Trim();
                    Response.Redirect("~/选课/stuSearch.aspx");
                    break;                
                case "管理员":
                    Session["Login"] = "yes";
                    Session["Name"] = TB_Yhm.Text.Trim();
                    Response.Redirect("~/用户管理/userList.aspx");
                    break;
                case "教师":
                    Session["Login"] = "yes";
                    Session["Name"] = TB_Yhm.Text.Trim();
                    Response.Redirect("~/学生管理/stuQuery.aspx");
                    break;
                default:
                    break;
            }
        }
        else
        {
            CSql.JSAlert("用户名或密码有误！请重新输入！");
        }
    }
}