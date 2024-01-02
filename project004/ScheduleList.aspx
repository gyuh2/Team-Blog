<%@ Page Title="" Language="C#" MasterPageFile="~/MyBlog.Master" AutoEventWireup="true" CodeBehind="ScheduleList.aspx.cs" Inherits="B_Blog.ScheduleList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .back{
            padding-left:5%;
            padding-bottom:10%;
            padding:2%;
            font-family:'Noto Sans KR';
        }
        .auto-style2 {
            width: 400px;
        }
        .auto-style7 {
            height: 30px;
            text-align: left;
        }

        .auto-style8 {
            width: 789px;
        }

        .auto-style9 {
            text-align: left;
            width: 298px;
        }

        .auto-style10 {
            height: 30px;
            text-align: left;
            font-family: "Noto Sans KR";
            font-size: large;
        }
        .auto-style11 {
            text-align: center;
        }
        .auto-style12 {
            width: 55px;
            color: #213A73;
            font-size: medium;
            height: 30px;
            text-align: left;
        }
        .auto-style13 {
            font-size: medium;
        }
        .auto-style14 {
            font-size: medium;
            color: #213A73;
            height: 39px;
        }
        .auto-style16 {
            width: 50px;
            height: 40px;
            text-align: center;
        }
        .auto-style17 {
            height: 40px;
        }
        .auto-style19 {
            height: 40px;
        }
        .auto-style20 {
            width: 90%;
        }
        .auto-style21 {
            font-size: medium;
            color: #213A73;
        }
        .auto-style22 {
            font-size: x-large;
            text-align: left;
            font-weight: normal;
        }
        .auto-style23 {
            height: 39px;
            text-align: right;
            font-size: medium;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="back">
    <h2>프로젝트 일정</h2>
    <asp:Panel ID="Panel3" runat="server">
        <table class="auto-style8">
            <tr>
                <td>
                    <asp:Calendar ID="Calendar1" runat="server" OnDayRender="Calendar1_DayRender" OnSelectionChanged="Calendar1_SelectionChanged" Width="650px" Height="450px" BackColor="#F0F0F0" BorderStyle="None" CellSpacing="1" Font-Names="noto Sans KR" Font-Size="10pt" ForeColor="Black" BorderColor="#C9C9C9" ShowGridLines="True" OnVisibleMonthChanged="Calendar1_VisibleMonthChanged">
                        <DayHeaderStyle Font-Bold="True" Font-Size="10pt" ForeColor="#333333" Height="20pt" />
                        <DayStyle BackColor="white" />
                        <NextPrevStyle Font-Bold="True" Font-Size="10pt" ForeColor="White" />
                        <OtherMonthDayStyle ForeColor="#999999" />
                        <SelectedDayStyle BackColor="#F7F2E5" ForeColor="#CC0000" />
                        <TitleStyle BackColor="#213A73" BorderStyle="Solid" Font-Bold="True" Font-Size="12pt" ForeColor="White" Height="25pt" />
                        <TodayDayStyle BackColor="#DEDEDE" ForeColor="#333333" />
                    </asp:Calendar>
                </td>
                <td class="auto-style9" style="vertical-align: bottom; padding-left: 20px;">
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="seq" DataSourceID="SqlDataSource1" Width="279px">
                        <ItemTemplate>
                            <table class="auto-style20" style="border-collapse: collapse">
                                <tr>
                                    <td class="auto-style14" colspan="2" style="font-family: 'noto Sans KR'"><strong style="font-family: 'noto Sans KR'; font-size: medium; color: #213A73">[일정]</strong></td>
                                </tr>
                                <tr>
                                    <td class="auto-style16" style="border: 0.1px solid #CCCCCC; border-collapse: collapse; background-color: #F7F2E5; font-family: 'noto Sans KR'; font-size: medium; font-weight: 500;"><span class="auto-style13">날짜</span></td>
                                    <td class="auto-style19" style="border: 0.1px solid #CCCCCC; border-collapse: collapse; padding-left: 10px;">
                                        <asp:Label ID="Label3" runat="server" CssClass="auto-style21" Font-Names="Noto Sans KR" Font-Size="Medium" Text='<%# Eval("tDate", "{0:yyyy-MM-dd}") %>'></asp:Label>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style16" style="border: 0.1px solid #CCCCCC; border-collapse: collapse; background-color: #F7F2E5; font-family: 'noto Sans KR'; font-size: medium; font-weight: 500;"><span class="auto-style13">일정</span></td>
                                    <td class="auto-style17" style="border: 0.1px solid #CCCCCC; border-collapse: collapse; padding-left: 10px;">
                                        <asp:Label ID="Label4" runat="server" CssClass="auto-style13" Font-Names="Noto Sans KR" Font-Size="Medium" Text='<%# Eval("content") %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
        </table>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" SelectCommand="SELECT * FROM [B_schedule]"></asp:SqlDataSource>
        <br />
    </asp:Panel>
    </div>
    <div class="auto-style11">
        <asp:Panel ID="Panel4" runat="server">
            <br />
            <table class="auto-style2">
                <tr>
                    <td class="auto-style12" style="font-family: 'Noto Sans KR'; font-size: medium; color: #213A73;">날&nbsp; 짜</td>
                    <td class="auto-style7" style="padding-left: 10px">
                        <asp:Label ID="Label2" runat="server" CssClass="auto-style13" Font-Names="Noto Sans KR" Font-Size="Medium"></asp:Label>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style12" style="font-family: 'Noto Sans KR'; color: #213A73;">내&nbsp; 용</td>
                    <td class="auto-style10" style="padding-left: 10px">
                        <asp:TextBox ID="TextBox1" runat="server" Width="97%"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style23" colspan="2" style="padding-top: 10px">
                        <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="등록" BackColor="#213A73" BorderStyle="Groove" BorderWidth="1px" Font-Names="Noto Sans KR" ForeColor="White" Height="35px" Width="65px" />
                    </td>
                </tr>
            </table>
        </asp:Panel>
    </div>
    <br />
    <br />
    <br />
</asp:Content>
