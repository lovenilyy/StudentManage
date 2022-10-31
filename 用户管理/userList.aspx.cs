using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 用户管理_userDelete : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Session["Login"] == null && Session["Login"] != "yes")
            {
                Response.Write("您还没有登录，请<a href=../登录/Login.aspx>登录</a>");
                Response.End();
            }
            Bind();
        }
    }
    public void Bind()
    {
        string strSql = "select * from Yh";
        if (DDL_Stu.SelectedIndex > 0)
        {
            strSql += string.Format(" where {0} like '%{1}%' ", DDL_Stu.SelectedValue, TB_StuNo.Text.Trim());
        }
        if (Session["Field"] != null)
        {
            strSql += " order by " + Session["Field"] + " " + Session["dir"] + " ";
        }
        DataSet ds = new DataSet();
        ds = CSql.GetDataSet(strSql.ToString());
        rpt.DataSource = ds;
        rpt.DataBind();
    }
    public string FormatPic(string pic)
    {
        if (string.IsNullOrEmpty(pic))
        {
            return "7.jpg";
        }
        else
        {
            return pic;

        }
    }

    protected void BT_Que_Click(object sender, EventArgs e)
    {
        Bind();
    }
}