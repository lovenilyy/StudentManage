using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 用户管理_userAdd : System.Web.UI.Page
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
        }
    }

    protected void BT_xk_Click(object sender, EventArgs e)
    {
        if (TB_pwd.Text.Trim()==TB_qrpwd.Text.Trim())
        {
            string pic = "";
            if (FU_up.HasFile)
            {
                pic = FU_up.FileName;
                FU_up.SaveAs(Server.MapPath("\\images\\") + pic);
                TextBox1.Text = pic;
            }
            else
            {
                CSql.JSAlert("请先选择图片，再上传！");
            }                       


            string sql = string.Format("insert Yh (Name,Xb,pwd,Sf,pic) values('" + TB_name.Text.Trim() + "','" + RBL_Cel.Text.Trim() + "','" + TB_qrpwd.Text.Trim() + "','" + DDL_zhiye.Text.Trim() + "','" + pic + "')");
            if (CSql.Execute(sql))
                CSql.JSAlert("添加成功！");
            else
                CSql.JSAlert("添加失败！");
        }
        else
        {
            CSql.JSAlert("两次密码输入不一致！请重新输入！");
        }
    }
}