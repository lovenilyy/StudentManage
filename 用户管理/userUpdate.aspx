<%@ Page Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userUpdate.aspx.cs" Inherits="用户管理_userUpdate" %>

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
            <caption>用户修改</caption>
            <tr>
                <td class="active" id="2">id</td>
                <td class="active" id="3">
                    
                    <asp:TextBox ID="TB_id" runat="server" ReadOnly="True"></asp:TextBox>
                    
                </td>
            </tr>
            <tr>
                <td class="active" id="2">姓名</td>
                <td class="active" id="3">
                    <asp:DropDownList ID="DDL_name" runat="server" Height="22px" OnSelectedIndexChanged="DDL_name_SelectedIndexChanged" Width="128px" AutoPostBack="True">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="success" id="2">性别</td>
                <td class="success" id="3">
                    <asp:TextBox ID="TB_Sex" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="warning" id="2">原密码</td>
                <td class="warning"id="3">
                    <asp:TextBox ID="TB_pwd" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="warning" id="2">新密码</td>
                <td class="warning"id="3">
                    <asp:TextBox ID="TB_qrpwd" runat="server" ></asp:TextBox>
                </td>
            </tr>
           <tr>
                <td class="warning" id="2">身份</td>
                <td class="warning"id="3" style="font-size: 8pt">
                    <asp:TextBox ID="TB_sf" runat="server" ></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td class="warning" id="2">头像</td>
                <td class="warning"id="3">
                    <img style="width:100px" src="../images/<%=pic %>" runat="server" id="imgold"/>

                    <asp:TextBox ID="TB_imgold" runat="server" Visible="False"></asp:TextBox>

                </td>
            </tr>

            <tr>
                <td class="warning" id="2">上传头像</td>
                <td class="warning"id="3">
                    <img style="width:100px" src="../images/<%#Eval(TB_imgnew.Text.Trim()) %>" runat="server" id="imgnew"/>
                    <asp:FileUpload ID="FU_up" runat="server" />
                    <asp:TextBox ID="TB_imgnew" runat="server" Visible="False" />
                    <asp:Button ID="BT_up" runat="server" Text="上传头像" OnClick="BT_up_Click" />
                </td>
            </tr>


            <tr>
                <td class="active" colspan="2" id="2">
                    <asp:Button ID="BT_update" runat="server" OnClick="BT_update_Click" Text="修改" Width="214px" style="align-items:center; height: 26px;"/>
                </td>
            </tr>
</asp:Content>
    