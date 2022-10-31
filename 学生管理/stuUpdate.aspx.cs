using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 学生管理_stuUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (!IsPostBack)
        {
            LoadData();
            if (Session["Login"] == null && Session["Login"] != "yes")
            {
                Response.Write("您还没有登录，请<a href=../登录/Login.aspx>登录</a>");
                Response.End();
            }
        }
    }
    public static string Pic;
    protected void BT_Update_Click(object sender, EventArgs e)
    {
        string sql = string.Format("update xsqk set  id='{0}', Name='{1}', csrq='{2}' , Sex='{3}', Zy='{4}',CET4='{5}' where id='{6}'", TB_id.Text, TB_Name.Text, TB_csrq.Text, TB_sex.Text, TB_xf.Text, TB_zy.Text, TB_cet4.Text, HF_ID.Value);
        if (CSql.Execute(sql))
        {
            CSql.JSAlert("修改成功");
        }
        else
        {
            CSql.JSAlert("修改失败");
        }
    }
    public void LoadData()
    {
        if (Request.QueryString["id"] == null)
        {
            return;
        }
        string id = Request.QueryString["id"].ToString();
        HF_ID.Value = id;
        if (!string.IsNullOrEmpty(id))
        {
            string sql = "SELECT  * FROM xsqk where id=" + id;
            DataSet ds = CSql.GetDataSet(sql);

            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                TB_id.Text = ds.Tables[0].Rows[i]["id"].ToString();
                TB_Name.Text = ds.Tables[0].Rows[i]["Name"].ToString();
                TB_xf.Text = ds.Tables[0].Rows[i]["xf"].ToString();
                TB_csrq.Text = ds.Tables[0].Rows[i]["csrq"].ToString();
                TB_sex.Text = ds.Tables[0].Rows[i]["Sex"].ToString();
                TB_cet4.Text = ds.Tables[0].Rows[i]["CET4"].ToString();
                TB_zy.Text = ds.Tables[0].Rows[i]["Zy"].ToString();
                Pic = ds.Tables[0].Rows[i]["pic"].ToString();
            }
        }
    }
}