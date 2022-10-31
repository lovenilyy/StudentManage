<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userAdd.aspx.cs" Inherits="用户管理_userAdd" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
        <div>
        <table class="table" border="1">
            <caption>用户添加</caption>
            <tr>
                <td class="active" id="2">姓名</td>
                <td class="active" id="3">
                    <asp:TextBox ID="TB_name" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="success" id="2">性别</td>
                <td class="success" id="3">
                    <asp:RadioButtonList ID="RBL_Cel" runat="server" RepeatDirection="Horizontal">
                        <asp:ListItem Selected="True">男</asp:ListItem>
                        <asp:ListItem >女</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="warning" id="2">密码</td>
                <td class="warning"id="3">
                    <asp:TextBox ID="TB_pwd" runat="server" TextMode="Password" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="warning" id="2">确认密码</td>
                <td class="warning"id="3">
                    <asp:TextBox ID="TB_qrpwd" runat="server" TextMode="Password" ></asp:TextBox>
                </td>
            </tr>
           <tr>
                <td class="warning" id="2">选择身份</td>
                <td class="warning"id="3">
                    <asp:DropDownList ID="DDL_zhiye" runat="server">
                        <asp:ListItem>学生</asp:ListItem>
                        <asp:ListItem>管理员</asp:ListItem>
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="warning" id="2">上传头像</td>
                <td class="warning"id="3">
                    <asp:FileUpload ID="FU_up" runat="server" />
                    <asp:TextBox ID="TextBox1" runat="server" Visible="False" ></asp:TextBox>
                </td>
            </tr>


            <tr>
                <td class="active" colspan="2" id="2">
                    <asp:Button ID="BT_Add" runat="server" OnClick="BT_xk_Click" Text="添加" Width="214px" style="align-items:center; height: 26px;"/>
                </td>
            </tr>
</asp:Content>
    
