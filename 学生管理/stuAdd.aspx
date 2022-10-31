<%@ Page Language="C#"  MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="stuAdd.aspx.cs" Inherits="学生管理_stuAdd" %>

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
            <caption>学生添加</caption>

            <tr>
                <td class="success" id="2">学号</td>
                <td class="success" id="3">
                    <asp:TextBox ID="TB_id" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFV_id" runat="server" BackColor="White" ControlToValidate="TB_id" ErrorMessage="请输入学号！" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="active" id="2">姓名</td>
                <td class="active" id="3">
                    <asp:TextBox ID="TB_Name" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RFV_name" runat="server" BackColor="White" ControlToValidate="TB_Name" ErrorMessage="请输入用户名!" ForeColor="Red" Display="Dynamic"></asp:RequiredFieldValidator>
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
                <td class="warning" id="2">出生日期</td>
                <td class="warning"id="3">
                    <asp:TextBox ID="TB_csrq" runat="server" ></asp:TextBox>
                </td>
            </tr>
            
           
            <tr>
                <td class="danger"id="2">专业</td>
                <td class="danger" id="3">
                    <asp:DropDownList ID="DDL_zhiye" runat="server" AutoPostBack="True" Height="22px" Width="128px">
                    </asp:DropDownList>
                </td>
            </tr>

            <tr>
                <td class="danger"id="2">学分</td>
                <td class="danger" id="3">
                    <asp:TextBox ID="TB_xf" runat="server"></asp:TextBox>                    
                </td>
            </tr>
            <tr>
                <td class="danger"id="2">CET4(1通过/0未通过)</td>
                <td class="danger" id="3">
                    <asp:TextBox ID="TB_cet4" runat="server"></asp:TextBox>                    
                </td>
            </tr>

            <tr>
                <td class="danger" id="2">个人图片</td>
                <td class="danger" id="3">
                    <asp:FileUpload ID="FU_up" runat="server" />
                    <asp:TextBox ID="TB_pic" runat="server" Visible="False"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="active" colspan="2" id="2">
                    <asp:Button ID="BT_up" runat="server" OnClick="BT_up_Click" Text="提交" Width="214px" style="align-items:center"/>
                </td>
            </tr>
            <tr>
                <td class="active" colspan="2">
                    &nbsp;</td>
            </tr>
        </table>
    </div>
</asp:Content>
    