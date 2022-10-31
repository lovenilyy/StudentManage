<%@ Page Title="" Language="C#" MasterPageFile="MasterPageSea.master" AutoEventWireup="true" CodeFile="学生选课.aspx.cs" Inherits="选课_学生选课" %>

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
            <caption>学生选课</caption>
            <tr>
                <td class="active" id="2">课程名</td>
                <td class="active" id="3">
                    <asp:DropDownList ID="DDL_cname" runat="server" Height="35px" Width="128px">
                    </asp:DropDownList>
                </td>
            </tr>
            <tr>
                <td class="success" id="2">学号</td>
                <td class="success" id="3">
                    <asp:TextBox ID="TB_id" runat="server"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="warning" id="2">姓名</td>
                <td class="warning"id="3">
                    <asp:TextBox ID="TB_name" runat="server" ></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="warning" id="2">专业</td>
                <td class="warning"id="3">
                    <asp:DropDownList ID="DDL_zy" runat="server" Height="35px" Width="128px">
                    </asp:DropDownList>
                </td>
            </tr>
           
            
            <tr>
                <td class="active" colspan="2" id="2">
                    <asp:Button ID="BT_xk" runat="server" OnClick="BT_xk_Click" Text="选课" Width="214px" style="align-items:center"/>
                </td>
            </tr>
            <tr>
                <td class="active" colspan="2">
                    <asp:GridView ID="Gv_kc" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" OnPageIndexChanging="Gv_kc_PageIndexChanging" OnSorting="Gv_kc_Sorting" Width="536px">
                        <Columns>
                            <asp:BoundField DataField="课程号" HeaderText="课程号" SortExpression="Sxh" />
                            <asp:BoundField DataField="课程名" HeaderText="课程名" SortExpression="Sxm" />
                            <asp:BoundField DataField="开课学期" HeaderText="开课学期" />
                            <asp:BoundField DataField="学时" HeaderText="学时" SortExpression="Szy" />
                            <asp:BoundField DataField="学分" HeaderText="学分" SortExpression="Szy" />
                        </Columns>
                    </asp:GridView>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
    
