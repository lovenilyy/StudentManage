using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 用户管理_userUpdate : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
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
        string strSql = " select * from Yh ";
        CSql.Bind(ref DDL_name, strSql, "Name", "Name");
    }
    protected void BT_update_Click(object sender, EventArgs e)
    {
        string sql;
        if (TB_imgnew == null)
        {
            sql = string.Format("update [Yh] set [Name] = '" + DDL_name.Text.Trim() + "',[Xb] = '" + TB_Sex.Text.Trim() + "',[pwd] = '" + TB_qrpwd.Text.Trim() + "',[Sf] = '" + TB_sf.Text.Trim() + "',[pic] = '"+TB_imgold.Text.Trim()+"' where id={0} ", TB_id.Text.Trim());
        }
        else
        {
            sql = string.Format("update [Yh] set [Name] = '" + DDL_name.Text.Trim() + "',[Xb] = '" + TB_Sex.Text.Trim() + "',[pwd] = '" + TB_qrpwd.Text.Trim() + "',[Sf] = '" + TB_sf.Text.Trim() + "',[pic] = '"+TB_imgnew.Text.Trim()+"' where id={0} ", TB_id.Text.Trim());
        }

        if (CSql.Execute(sql))
            CSql.JSAlert("修改成功！");
        else
            CSql.JSAlert("修改失败！");
    }
    protected void BT_up_Click(object sender, EventArgs e)
    {
        string pic = "";
        if (FU_up.HasFile)
        {
            pic = FU_up.FileName;
            FU_up.SaveAs(Server.MapPath("\\images\\") + pic);
            TB_imgnew.Text = pic;
        }
        else
        {
            CSql.JSAlert("请先选择图片，再上传！");
        }
    }
    protected void DDL_name_SelectedIndexChanged(object sender, EventArgs e)
    {
        string strSql = string.Format(" select * from Yh where Name = '{0}'", DDL_name.SelectedValue);
        DataSet ds = new DataSet();
        ds = CSql.CreateDataSet(strSql);
        if (ds != null)
        {
            TB_id.Text = ds.Tables[0].Rows[0]["id"].ToString();
            TB_Sex.Text = ds.Tables[0].Rows[0]["Xb"].ToString();
            TB_pwd.Text = ds.Tables[0].Rows[0]["pwd"].ToString();
            TB_sf.Text = ds.Tables[0].Rows[0]["Sf"].ToString();
            TB_imgold.Text= ds.Tables[0].Rows[0]["pic"].ToString();
        }
    }
}