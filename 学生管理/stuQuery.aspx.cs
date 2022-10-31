using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 学生管理_stuQuery : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if(!IsPostBack)
        {
            Bind();
            if (Session["Login"] == null && Session["Login"] != "yes")
            {
                Response.Write("您还没有登录，请<a href=../登录/Login.aspx>登录</a>");
                Response.End();
            }
        }
    }
    public void Bind()
    {
        string strSql = "select * from xsqk";
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
        Gv_Student.DataSource = ds;
        Gv_Student.DataBind();
    }
    public string GetStatus(string CET4)
    {
        if (CET4 == "0")
        {
            return "<font color='green'>未通过</font>";
        }
        else
        {
            return "<font color='red'>通过</font>";
        }
    }
    protected void Gv_Student_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        Gv_Student.PageIndex = e.NewPageIndex;
        Bind();
    }

    protected void Gv_Student_RowDeleting(object sender, GridViewDeleteEventArgs e)
    {
        string id = Gv_Student.DataKeys[e.RowIndex].Values["id"].ToString();
        string Sxm = Gv_Student.DataKeys[e.RowIndex].Values["Name"].ToString();

        string sql = "delete from xsqk where id=" + id;
        if (CSql.Execute(sql))
        {

            CSql.JSAlert(Sxm + "已被删除");
            Bind();
        }
        else
        {
            CSql.JSAlert(Sxm + "删除失败");
        }
    }

    protected void Gv_Student_RowUpdating(object sender, GridViewUpdateEventArgs e)
    {
        string id = Gv_Student.DataKeys[e.RowIndex].Values["id"].ToString();
        string Sxm = Gv_Student.DataKeys[e.RowIndex].Values["Name"].ToString();

        string sql = string.Format("update xsqk set CET4=1 where id={0}", id);
        if (CSql.Execute(sql))
        {
            GetStatus(sql);
            Bind();
        }
        else
        {
            CSql.JSAlert(Sxm + "审核失败！");
        }
    }
    

    protected void Gv_Student_Sorting(object sender, GridViewSortEventArgs e)
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

    protected void Gv_Student_RowDataBound(object sender, GridViewRowEventArgs e)
    {
        if (e.Row.RowIndex >= 0)
        {
            string id = Gv_Student.DataKeys[e.Row.RowIndex].Values["id"].ToString();
            HyperLink HL_Edite = (HyperLink)e.Row.FindControl("HL_Edite");

            HL_Edite.NavigateUrl = "stuUpdate.aspx?id=" + id;
        }
    }

    protected void BT_Add_Click(object sender, EventArgs e)
    {
        Bind();
    }

    protected void BT_DelAll_Click(object sender, EventArgs e)
    {
        for (int i = 0; i < Gv_Student.Rows.Count; i++)
        {
            CheckBox CB_Select = (CheckBox)Gv_Student.Rows[i].FindControl("CB_Sel");
            if (CB_Select.Checked == true)
            {
                string id = Gv_Student.DataKeys[i].Values["id"].ToString();
                string sql = "delete from xsqk where id=" + id;
                CSql.Execute(sql);
            }
        }
        Bind();
    }

    protected void CB_All_CheckedChanged(object sender, EventArgs e)
    {
        bool isChecked = ((CheckBox)(Gv_Student.HeaderRow.Cells[0].FindControl("CB_ALL"))).Checked;

        foreach (GridViewRow dr in Gv_Student.Rows)
        {
            CheckBox CB_Select = (CheckBox)dr.FindControl("CB_Sel");
            CB_Select.Checked = isChecked;
        }
    }
}