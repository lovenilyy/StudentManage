using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;


public partial class 个人信息_info : System.Web.UI.Page
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
    public static string pic;
    public static string fileName;

    public void Bind()
    {
        //string pic = "";
        string name = Session["Name"].ToString().Trim();
        if (!string.IsNullOrEmpty(name))
        {            
            string sql = string.Format("select * from Yh where Name='{0}'",name);
            DataSet ds=CSql.GetDataSet(sql);
            for(int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                TB_Name.Text = ds.Tables[0].Rows[i]["Name"].ToString();
                TB_pwd.Text = ds.Tables[0].Rows[i]["pwd"].ToString();
                TB_Sex.Text = ds.Tables[0].Rows[i]["Xb"].ToString();
                TB_Sf.Text = ds.Tables[0].Rows[i]["Sf"].ToString();
                //pic = ds.Tables[0].Rows[i]["pic"].ToString();
            }
            rpt.DataSource = ds;
            rpt.DataBind();
        }
        else
        {
            Response.Write("查询失败！");
        }
    }

    //

    protected void BT_xg_Click(object sender, EventArgs e)
    {
        
        string name = Session["Name"].ToString();
        string sql = "update Yh set Name='"+TB_Name.Text.Trim()+"', Xb='"+TB_Sex.Text.Trim()+"', pwd='"+TB_pwd.Text.Trim()+ "', Sf='" + TB_Sf.Text.Trim() + "', pic='" + TB_fileName.Text.Trim()+"' where Name='"+name+"'";
        if (CSql.Execute(sql))
            CSql.JSAlert("修改成功！");
        else
            CSql.JSAlert("修改失败！");
    }

    protected void BT_Upload_Click(object sender, EventArgs e)
    {
        if (FU_up.HasFile)
        { 
            fileName = FU_up.FileName;
            FU_up.SaveAs(Server.MapPath("\\images\\") + fileName);
            img.Src = "\\images\\" + fileName; 
            TB_fileName.Text = fileName;
        }
        else
        {
            CSql.JSAlert("请先选择图片，再上传！");
        }
    }
}