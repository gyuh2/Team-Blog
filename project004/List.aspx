<%@ Page Title="" Language="C#" MasterPageFile="~/MyBlog.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="Project004.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .{
            font-family:'Noto Sans KR';
        }
        .back{
            font-family:'Noto Sans KR';
            padding-left:5%; 
            padding-bottom:10%; 
            padding:2%;
        }
        .newStyle1 {
            font-family: "맑은 고딕", Arial, Helvetica, sans-serif;
        }
        .newStyle2 {
            font-family: "Noto Sans KR";
        }
        .auto-style11 {
            font-family: "Noto Sans KR";
            font-size: x-large;
            color: #213A73;
        }
        .auto-style12 {
            font-size: large;
            color: #213A73;
        }
        .auto-style13 {
            width: 70px;
        }
        .auto-style14 {
            width: 90%;
        }
        .newStyle3 {
            font-family: "noto Sans KR";
        }
        .auto-style15 {
            font-size: x-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server" >
    <div class="back">
    <h2>팀원소개</h2>
    <asp:DataList ID="DataList1" runat="server"
        DataSourceID="SqlDataSource1" RepeatColumns="2" RepeatDirection="Horizontal" BackColor="#CCCCCC" BorderColor="#213A73" BorderStyle="Solid" BorderWidth="3px" CellPadding="4" CellSpacing="2" ForeColor="Black" GridLines="Both" OnSelectedIndexChanged="DataList1_SelectedIndexChanged" Width="80%">
         <FooterStyle BackColor="#CCCCCC" />
         <HeaderStyle BackColor="Black" Font-Bold="True" ForeColor="White" />
         <ItemStyle BackColor="White" />
        <ItemTemplate>
            <br />
            <table class="imgbody">
                <tr>
                    <td class="auto-style13">
                        <asp:Image ID="Image3" runat="server" Height="200px" ImageUrl='<%# "~/UserImages/" + Eval("photo") %>' Width="200px" />
                    </td>
                    <td>
                        <strong>
                        <asp:Label ID="nameLabel" runat="server" CssClass="auto-style15" Text='<%# Eval("name") %>' />
                        <br />
                        </strong>
                        <span class="newStyle3">
                        <br />
                        </span>
                        <asp:Label ID="univLabel" runat="server" Text='<%# Eval("univ") %>' />
                        <span class="newStyle3">&nbsp;</span><asp:Label ID="majorLabel" runat="server" Text='<%# Eval("major") %>' />
                        <span class="newStyle3">&nbsp;/ </span>
                        <asp:Label ID="partLabel" runat="server" Text='<%# Eval("part") %>' />
                        <span class="newStyle3">
                        <br />
                        <br />
                        </span>
                        <asp:Label ID="taskLabel" runat="server" Text='<%# Eval("task") %>' />
                    </td>
                </tr>
            </table>
            <br />
            <br />
        </ItemTemplate>
         <SelectedItemStyle BackColor="#000099" Font-Bold="True" ForeColor="White" />
 </asp:DataList>
    </div>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" SelectCommand="SELECT [name], [univ], [major], [part], [task], [photo] FROM [B_user]"></asp:SqlDataSource>
    <br />
    <br />
</asp:Content>
