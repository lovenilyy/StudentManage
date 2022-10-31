using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 用户管理_userDel : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
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
        string strSql = " select * from Yh ";
        CSql.Bind(ref DDL_name, strSql, "Name", "Name");
    }
    protected void DDL_name_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strSql = string.Format(" select * from Yh where Name = '{0}'", DDL_name.SelectedValue);
        DataSet ds = new DataSet();
        ds = CSql.GetDataSet(strSql);
        if (ds != null)
        {
            TB_sex.Text = ds.Tables[0].Rows[0]["Xb"].ToString();
            TB_sf.Text = ds.Tables[0].Rows[0]["Sf"].ToString();
            TB_pic.Text = ds.Tables[0].Rows[0]["pic"].ToString();
        }
    }

    protected void BT_Del_Click(object sender, EventArgs e)
    {
        string strSql = string.Format(" delete  from Yh where Name = '{0}'", DDL_name.SelectedValue);
        bool ds = CSql.Execute(strSql);
        if (ds)
            CSql.JSAlert("删除成功！");
        else
            CSql.JSAlert("删除失败！");
        Bind();
    }
}