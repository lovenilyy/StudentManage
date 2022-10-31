using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class 登录_zc : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        UnobtrusiveValidationMode = UnobtrusiveValidationMode.None;
        if (!IsPostBack)
        {
            
        }
    }

    protected void BT_up_Click(object sender, EventArgs e)
    {
        if (TB_pwd.Text.Trim() == TB_pwdshow.Text.Trim())
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
            
            string sql = string.Format("insert into Yh (Name,Xb,pwd,Sf,pic) values ('" + TB_Name.Text.Trim() + "','" + RBL_Cel.Text.Trim() + "','" + TB_pwd.Text.Trim() + "','" + DDL_zhiye.Text.Trim() + "','" + pic + "')");
            bool ds = CSql.Execute(sql);
            if (ds)
            {
                CSql.JSAlert("注册成功！");

            }
            else
            {
                CSql.JSAlert("注册失败！");
            }
        }
        else
        {
            CSql.JSAlert("两次输入的密码不一致！请重新输入！");
        }
    }
}