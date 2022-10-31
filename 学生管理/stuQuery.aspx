<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="stuQuery.aspx.cs" Inherits="学生管理_stuQuery" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">
        .auto-style2 {
            width: 1px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <asp:DropDownList ID="DDL_Stu" runat="server" AutoPostBack="True">
        <asp:ListItem Value="-1">--查询方式--</asp:ListItem>
        <asp:ListItem Value="id">按学号查询</asp:ListItem>
        <asp:ListItem Value="Name">按姓名查询</asp:ListItem>
    </asp:DropDownList>
    <asp:TextBox ID="TB_StuNo" runat="server"></asp:TextBox>
    <asp:Button ID="BT_Add" runat="server" OnClick="BT_Add_Click" Text="查询" />
    <asp:Button ID="BT_DelAll" runat="server" OnClick="BT_DelAll_Click" Text="删除选中项" Width="83px" />
    <asp:GridView ID="Gv_Student" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="id,Name" OnPageIndexChanging="Gv_Student_PageIndexChanging" OnRowDataBound="Gv_Student_RowDataBound" OnRowDeleting="Gv_Student_RowDeleting" OnRowUpdating="Gv_Student_RowUpdating" OnSorting="Gv_Student_Sorting" Width="900px">
        <Columns>
            <asp:TemplateField>
                <HeaderTemplate>
                    <asp:CheckBox ID="CB_All" runat="server" AutoPostBack="True" OnCheckedChanged="CB_All_CheckedChanged" />
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:CheckBox ID="CB_Sel" runat="server" />
                </ItemTemplate>
            </asp:TemplateField>
            <asp:BoundField DataField="id" HeaderText="学号" SortExpression="id" />
            <asp:BoundField DataField="Name" HeaderText="姓名" SortExpression="Name" />
            <asp:BoundField DataField="Sex" HeaderText="性别" />
            <asp:BoundField DataField="Zy" HeaderText="专业" SortExpression="Zy" />
            <asp:BoundField DataField="csrq" DataFormatString="{0:yyyy-MM-dd} " HeaderText="出生日期" SortExpression="csrq" />
            <asp:BoundField DataField="xf" HeaderText="总学分" />
            <asp:TemplateField HeaderText="CET4">
                <ItemTemplate>
                              <%#GetStatus(Eval("CET4").ToString()) %>
                          </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="操作">
                <ItemTemplate>
                    <asp:Button ID="BT_Del" runat="server" CommandName="delete" Text="删除" />
                    <asp:HyperLink ID="HL_Edite" runat="server">修改</asp:HyperLink>
                    <a href='http://localhost:60549/%E5%AD%A6%E7%94%9F%E7%AE%A1%E7%90%86/stuUpdate.aspx?id=<%#Eval("id") %>'>详情</a>
                    <asp:Button ID="BT_Exa" runat="server" CommandName="update" Text="审核" />
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
    </asp:GridView>
    <br />
</asp:Content>

