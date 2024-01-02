<%@ Page Title="" Language="C#" MasterPageFile="~/MyBlog.Master" AutoEventWireup="true" CodeBehind="LogList.aspx.cs" Inherits="B_Project.LogList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .back{
            padding-left:5%;
            padding-bottom:10%;
            padding:2%;
            font-family:'Noto Sans KR';
        }
        .auto-style7 {
            color: #4152ac;
        }
        .auto-style8 {
            font-size: x-large;
            text-align: left;
            font-weight: normal;
        }
        .auto-style9 {
            width: 400px;
        }
        .auto-style10 {
            height: 30px;
            text-align: right;
            width: 334px;
        }
        .auto-style11 {
            height: 30px;
            width: 49px;
            font-size: medium;
            color: #213A73;
        }
        .auto-style12 {
            width: 49px;
            font-size: medium;
            color: #213A73;
        }
        .auto-style13 {
            text-align: right;
        }
        .auto-style14 {
            text-align: right;
            width: 334px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="back">
        <h2>활동내역</h2>
        <asp:Panel ID="Panel1" runat="server">
            <asp:DataList ID="DataList1" runat="server" DataKeyField="seq" DataSourceID="SqlDataSource1" Width="600px">
                <ItemTemplate>
                    <table class="imgbody">
                        <tr>
                            <td style="padding-bottom: 10px; border-bottom-style: solid; border-bottom-width: 0.5px; border-bottom-color: #CCCCCC; padding-top: 5px; font-family: 'noto Sans KR';"><span class="auto-style7">[<asp:Label ID="Label1" runat="server" Text='<%# Eval("lDate", "{0:MM-dd HH:mm}") %>'></asp:Label>]</span> 에 <span class="auto-style7">[<asp:Label ID="Label3" runat="server" Text='<%# Eval("name") %>'></asp:Label>]</span> 가(이)
                                <asp:Label ID="Label2" runat="server" Text='<%# Eval("content") %>'></asp:Label>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" SelectCommand="SELECT * FROM [B_log] ORDER BY [seq] DESC"></asp:SqlDataSource>
            <br />
            <br />
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
            <table class="auto-style9">
                <tr>
                    <td class="auto-style11" style="font-family: 'noto Sans KR'">이 름</td>
                    <td class="auto-style10" style="font-family: 'noto Sans KR'">
                        <asp:TextBox ID="TextBox1" runat="server" Width="97%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12" style="font-family: 'noto Sans KR'">활 동</td>
                    <td class="auto-style14" style="font-family: 'noto Sans KR'">
                        <asp:TextBox ID="TextBox2" runat="server" Width="97%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style13" colspan="2" style="font-family: 'noto Sans KR'; padding-top: 10px;">
                        <asp:Button ID="Button1" runat="server" BackColor="#213A73" BorderStyle="Groove" BorderWidth="1px" Font-Names="Noto Sans KR" ForeColor="White" Height="35px" OnClick="Button1_Click" Text="확인" Width="65px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <br />
        <br />
        <br />
    </div>
</asp:Content>
