<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="登录界面_admin" %>


<!DOCTYPE html>
<html lang="en">
<head runat="server">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <!-- Latest compiled and minified CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous"/>
    <!-- Optional theme -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap-theme.min.css" integrity="sha384-fLW2N01lMqjakBkx3l/M9EahuwpSfeNvV63J5ezn3uZzapT0u7EYsXMjQV+0En5r" crossorigin="anonymous"/>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <title>用户登录</title> 
</head>
<body>
    <style>
        body
        {
            width: 100%;
            height: 100%;
            overflow: hidden;
            background: url(../images/bg.png) no-repeat;
            background-size: 100% 100%;
            background-attachment: fixed;
        }

        form
        {
            width: 474px;
            margin: 200px auto;
            padding: 20px 30px;
            background-color: rgba(255, 255, 255, 0.8);
        }

            form div
            {
                margin-bottom:10px;
            }

        a:link, a:visited, a:hover, a:active
        {
            text-decoration: none;
            color: rgba(0, 0, 0, 0.5);
        }
    </style>
    <script src="Scripts/jquery-3.0.0.min.js"></script>
    <script src="Scripts/popper.min.js"></script>
    <script src="Scripts/bootstrap.min.js"></script>
    <div class="container">
        <form id="form1" runat="server">
            <div style="margin-bottom:20px;">
                <h2 style="text-align:center;">用户登录</h2>
            </div>
            <div class="form-group has-success has-feedback">
                <asp:TextBox type="text" class="form-control" id="TB_Yhm" placeholder="用户名" runat="server"></asp:TextBox>
            </div>
            <div class="form-group has-success has-feedback">
                <asp:TextBox type="password" class="form-control" id="TB_pwd" placeholder="密码" runat="server" TextMode="Password"></asp:TextBox>
                <span class="glyphicon glyphicon-lock form-control-feedback"></span>
            </div>
            <div class="form-group has-success has-feedback">
                <asp:RadioButtonList ID="RBL_Cel" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">学生</asp:ListItem>
                        <asp:ListItem >管理员</asp:ListItem>
                </asp:RadioButtonList>
            </div>
            <div class="form-check">
                <label class="form-check-label-right">                   
                    <input type="checkbox" class="form-check-input" value=""><span style="font-size:15px;">记住密码</span>
                </label>
            </div>
            <div>
                <asp:button id="BT_in" type="submit" class="btn btn-info btn-block" Text="登录" runat="server" OnClick="BT_in_Click"></asp:button>
            </div>
            <div>
                <a href="zc.aspx" style="display:inline;font-size:15px;">还未注册</a>
            </div>
        </form>
    </div>
</body>
</html>
