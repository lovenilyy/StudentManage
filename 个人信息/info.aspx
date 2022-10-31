<%@ Page Language="C#" MasterPageFile="MasterPageinfo.master" AutoEventWireup="true" CodeFile="info.aspx.cs" Inherits="个人信息_info" %>

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
        <table class="table" border="1">
            <caption>个人信息</caption>
            <tr>
                <td class="active" id="2">用户名</td>
                <td class="active" id="3">
                    <asp:TextBox ID="TB_Name" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="success" id="2">密码</td>
                <td class="success" id="3">
                    <asp:TextBox ID="TB_pwd" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="warning" id="2">性别</td>
                <td class="warning" id="3">
                    <asp:TextBox ID="TB_Sex" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="warning" id="2">身份</td>
                <td class="warning" id="3">
                    <asp:TextBox ID="TB_Sf" runat="server"></asp:TextBox>
                </td>
            </tr>
            
            <tr>
                <td class="danger"id="2">个人头像</td>
                <td class="danger"id="3">
                    <asp:Repeater ID="rpt" runat="server">
                <ItemTemplate>
                    <img style="width:100px" src="../images/<%#Eval("pic") %>" runnat="server"/>
                </ItemTemplate>
                    </asp:Repeater>
                    </td>
            </tr>

            <tr>
                <td class="danger"id="2">
                    <asp:Label ID="Label1" runat="server" Text="修改头像"></asp:Label>
                    <asp:FileUpload ID="FU_up" runat="server" Width="227px" />
                    <asp:Button ID="BT_Upload" runat="server" Text="上传头像" OnClick="BT_Upload_Click" Width="230px" />                 
                </td>
                <td class="danger"id="3">
                    
                    <img style="width:100px" src="" runat="server" id="img"/>
                    <asp:TextBox ID="TB_fileName" runat="server" Visible="False"></asp:TextBox>
                    </td>
            </tr>
            <tr>
                <td class="danger"id="2" colspan="2">
                    <asp:Button ID="BT_xg" runat="server" Text="修改信息" Width="88px" OnClick="BT_xg_Click" />
                </td>
            </tr>
            
        </table>
</body>
</asp:Content>
