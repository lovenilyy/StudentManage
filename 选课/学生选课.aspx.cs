using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 选课_学生选课 : System.Web.UI.Page
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
            string strSql = " select * from xskc ";
            CSql.Bind(ref DDL_cname, strSql, "课程名", "课程名");
            string strSqlZy = " select * from zy ";
            CSql.Bind(ref DDL_zy, strSqlZy, "专业", "专业");
            Bind();
        }
    }

    protected void DDL_kc_SelectedIndexChanged(object sender, EventArgs e)
    {

    }

    protected void BT_xk_Click(object sender, EventArgs e)
    {
        string sql = string.Format("insert xsxk (学号,课程名,姓名,专业) values('{0}','{1}','{2}','{3}')",TB_id.Text.Trim(), DDL_cname.Text.Trim(),TB_name.Text.Trim(),DDL_zy.Text.Trim());
        if (CSql.Execute(sql))
            CSql.JSAlert("选课成功！！");
        else
            CSql.JSAlert("选课失败！！");
    }

    protected void Gv_kc_Sorting(object sender, GridViewSortEventArgs e)
    {
        Session["Field"] = e.SortExpression;
        if (Session["dir"] == null)
        {
            Session["dir"] = "asc";
        }
        else
        {
            if (string.Compare(Session["dir"].ToString(), "asc") == 0)
            {
                Session["dir"] = "desc";
            }
            else
            {
                Session["dir"] = "asc";
            }
        }
        Bind();
    }    
    public void Bind()
    {
        string strSql = "select * from xskc";
        
        DataSet ds = new DataSet();
        ds = CSql.GetDataSet(strSql.ToString());
        Gv_kc.DataSource = ds;
        Gv_kc.DataBind();
    }

    protected void Gv_kc_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Gv_kc.PageIndex = e.NewPageIndex;
        Bind();
    }
}