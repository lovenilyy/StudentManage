<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="userDel.aspx.cs" Inherits="用户管理_userDel" %>

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
            <caption>用户删除</caption>
            <tr>
                <td class="active" id="2">选择用户</td>
                <td class="active" id="3">
                    <asp:DropDownList ID="DDL_name" runat="server" AutoPostBack="True" Height="16px" Width="130px" OnSelectedIndexChanged="DDL_name_SelectedIndexChanged">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="success" id="2">性别</td>
                <td class="success" id="3">
                    <asp:TextBox ID="TB_sex" runat="server" ></asp:TextBox>
                </td>
            </tr>
            
                <td class="warning" id="2">身份</td>
                <td class="warning"id="3">
                    <asp:TextBox ID="TB_sf" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="warning" id="2">头像</td>
                <td class="warning"id="3">
                    <asp:TextBox ID="TB_pic" runat="server" ></asp:TextBox>
                </td>
            </tr>


            <tr>
                <td class="active" colspan="2" id="2">
                    <asp:Button ID="BT_Del" runat="server" OnClick="BT_Del_Click" Text="删除" Width="214px" style="align-items:center; height: 26px;"/>
                </td>
            </tr>
</asp:Content>
    

