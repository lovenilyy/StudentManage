using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;
/// <summary>
/// CSql 的摘要说明
/// </summary>
public class CSql
{
    public static string strConn = System.Configuration.ConfigurationManager.ConnectionStrings["strConn"].ToString();
    public CSql()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //    
    }
    /// <summary>
    /// SqlDataAdapter 读取数据
    /// </summary>
    /// <param name="strSql"></param>
    /// <returns></returns>
    public static DataSet CreateDataSet(string strSql)
    {
        DataSet ds = new DataSet();
        SqlDataAdapter da = new SqlDataAdapter(strSql, strConn);
        try
        {
            da.Fill(ds);
            da.Dispose();
        }
        catch
        {
            return null;
        }
        finally
        {
            da.Dispose();
        }
        return ds;
    }
    public static bool Execute(string sql)
    {
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand cmd = new SqlCommand(sql, conn);
        try
        {
            conn.Open();
            int count = cmd.ExecuteNonQuery();
            if (count >= 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch (Exception ex)
        {
            throw ex;
            return false;
        }
        finally
        {
            conn.Close();
        }
    }

    public static DataSet GetDataSet(string sql)
    {
        SqlDataAdapter adp = new SqlDataAdapter(sql, strConn);
        try
        {
            DataSet ds = new DataSet();
            adp.Fill(ds);
            return ds;
        }
        catch (Exception ex)
        {
            throw ex;
            return null;
        }
        finally
        {
            adp.Dispose();
        }
    }
    public static SqlDataReader ExecuteReader(string sql)
    {
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand cmd = new SqlCommand(sql, conn);
        try
        {
            conn.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            return rd;
            conn.Close();
        }
        catch (Exception ex)
        {
            return null;
        }
        finally
        {
            //conn.Close();
        }
        return null;
    }

    /// <summary>
    /// 执行Sql语句
    /// </summary>
    /// <param name="sql">sql语句参数</param>
    /// <returns></returns>
    public static bool doSql(string sql)
    {
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand cmd = new SqlCommand(sql, conn);
        try
        {
            conn.Open();
            int count = cmd.ExecuteNonQuery();
            if (count >= 0)
            {
                return true;
            }
            else
            {
                return false;
            }
        }
        catch (Exception ex)
        {
            return false;
        }
        finally
        {
            conn.Close();
        }
    }
    public static void JSAlert(string msg)
    {
        HttpContext.Current.Response.Write("<Script>alert('" + msg + "')</Script>");
    }
    /// <summary>
    /// 下拉框绑定
    /// </summary>
    public static void Bind(ref DropDownList DDL, string strSql, string mValue, string mText)
    {
        SqlConnection conn = new SqlConnection(strConn);
        SqlCommand comm = new SqlCommand(strSql, conn);
        try
        {
            conn.Open();
            SqlDataReader reader = comm.ExecuteReader();
            DDL.DataSource = reader;
            DDL.DataTextField = mText;
            DDL.DataValueField = mValue;
            DDL.DataBind();
            comm.Dispose();
            conn.Close();
            conn.Dispose();
        }
        catch (Exception ex)
        {
            throw ex;
        }
        finally
        {
            conn.Close();
            conn.Dispose();
        }

    }
}