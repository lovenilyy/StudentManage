using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 学生管理_stuAdd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
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
        string strSql = " select * from zy ";
        CSql.Bind(ref DDL_zhiye, strSql, "专业", "专业");
    }

    protected void BT_up_Click(object sender, EventArgs e)
    {
        string pic = "";
        if (FU_up.HasFile)
        {
            pic = FU_up.FileName;
            FU_up.SaveAs(Server.MapPath("\\images\\") + pic);
            TB_pic.Text = pic;
        }
        else
        {
            CSql.JSAlert("请先选择图片，再上传！");
        }

        string sql = "INSERT INTO [xsqk] ( [id] ,[Name] ,[Zy] ,[Sex] ,[csrq] ,[xf] ,[CET4] ,[pic] ) VALUES ('"+TB_id.Text.Trim()+"','"+TB_Name.Text.Trim()+"','"+DDL_zhiye.Text.Trim()+"','"+RBL_Cel.Text.Trim()+"','"+TB_csrq.Text.Trim()+"',"+TB_xf.Text.Trim()+",'"+TB_cet4.Text.Trim()+"','"+TB_pic.Text.Trim()+"')";
        if (CSql.Execute(sql))
            CSql.JSAlert("添加成功！");
        else
            CSql.JSAlert("添加失败！");
    }
}