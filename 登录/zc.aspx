<%@ Page Language="C#"   AutoEventWireup="true" CodeFile="zc.aspx.cs"  Inherits="登录_zc" %>


<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"/>
    <link rel="stylesheet" href="css/biaoge.css" />
    <script src="https://cdn.bootcss.com/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <title></title>    
    <style type="text/css">
        .table {
            width: 60%;
            border-style: solid;
            border-width: 1px;
            margin : 0 auto;
        }
        #2 {
            text-align:center;
        }
        #3 {
            text-align: left;
            width: 571px;
        }
        
    </style>
    </head>
<body>
     <form runat="server">   
    <div>
        <table class="table" border="1">
            <caption>用户注册</caption>
            <tr>
                <td class="active" id="2">用户名</td>
                <td class="active" id="3">
                    <asp:TextBox ID="TB_Name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFV_name" runat="server" BackColor="White" ControlToValidate="TB_Name" ErrorMessage="请输入用户名" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="success" id="2">密码</td>
                <td class="success" id="3">
                    <asp:TextBox ID="TB_pwd" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFV_pwd" runat="server" BackColor="White" ControlToValidate="TB_pwd" ErrorMessage="密码不能为空！" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="warning" id="2">确认密码</td>
                <td class="warning"id="3">
                    <asp:TextBox ID="TB_pwdshow" runat="server" TextMode="Password" ></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFV_Repwd" runat="server" ControlToValidate="TB_pwd" ErrorMessage="请输入确认密码！" ForeColor="Red"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CV_Repwd" runat="server" ControlToCompare="TB_pwd" ControlToValidate="TB_pwdshow" ErrorMessage="两次输入不一致！" ForeColor="Red" Display="Dynamic"></asp:CompareValidator>
                </td>
            </tr>
            <tr>
                <td class="warning" id="2">性别</td>
                <td class="warning"id="3">
                    <asp:RadioButtonList ID="RBL_Cel" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">男</asp:ListItem>
                        <asp:ListItem >女</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
           
            <tr>
                <td class="danger"id="2">身份</td>
                <td class="danger" id="3">
                    <asp:DropDownList ID="DDL_zhiye" runat="server" AutoPostBack="True">
                        <asp:ListItem>学生</asp:ListItem>
                        <asp:ListItem>管理员</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="danger" id="2">个人图片</td>
                <td class="danger" id="3">
                    <asp:FileUpload ID="FU_up" runat="server" />
                    <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="active" colspan="2" id="2">
                    <asp:Button ID="BT_fh" runat="server" Text="返回上一级" Width="214px" />
                    <asp:Button ID="BT_up" runat="server" OnClick="BT_up_Click" Text="提交" Width="214px" style="align-items:center"/>
                </td>
            </tr>
            <tr>
                <td class="active" colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
    </form>
</body>
</html>
    