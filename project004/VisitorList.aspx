<%@ Page Title="" Language="C#" MasterPageFile="~/MyBlog.Master" AutoEventWireup="true" CodeBehind="VisitorList.aspx.cs" Inherits="B_Project.VisitorList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .back{
            
            padding-bottom:10%;
            padding:2%;
            font-family:'Noto Sans KR';
        }
        .auto-style7 {
            height: 28px;
        }

        .auto-style8 {
            color: #808080;
        }

        .auto-style9 {
            font-size: small;
        }

        .auto-style10 {
            width: 100%;
            height: 78px;
        }

        .auto-style11 {
            font-size: x-large;
            text-align: left;
        }

        .auto-style12 {
            width: 100%;
        }

        .auto-style13 {
            width: 49px;
            color: #213A73;
            font-size: medium;
            height: 48px;
        }

        .auto-style14 {
            color: #213A73;
            font-size: medium;
            text-align: right;
        }

        .auto-style15 {
            width: 49px;
            color: #213A73;
            font-size: medium;
            height: 30px;
        }

        .auto-style16 {
            height: 30px;
            text-align: right;
        }

        .auto-style17 {
            text-align: right;
            height: 48px;
        }

        .auto-style18 {
            width: 500px;
        }

        .auto-style19 {
            width: 494px;
        }

        .auto-style20 {
            color: #4152AC;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="back">
        <h2>&nbsp;방명록</h2>
        <table align="left" class="auto-style18">
            <tr>
                <td class="auto-style19">
                    <asp:DataList ID="DataList1" runat="server" DataKeyField="seq" DataSourceID="SqlDataSource1" OnDeleteCommand="DataList1_DeleteCommand" OnItemDataBound="DataList1_ItemDataBound" Width="488px" HorizontalAlign="Center">
                        <ItemTemplate>
                            <table class="auto-style10" style="font-family: 'Noto Sans KR'">
                                <tr>
                                    <td style="background-color: #F2F2F2; padding-left: 10px; padding-top: 2px; padding-bottom: 2px;"><span class="auto-style9">NO</span>.<strong><asp:Label ID="Label2" runat="server" Text='<%# Eval("seq") %>'></asp:Label>
                                    </strong>&nbsp;<asp:Label ID="Label3" runat="server" Text='익명' ForeColor="#4152AC" CssClass="auto-style20"></asp:Label>
                                        &nbsp;<span class="auto-style8"><span class="auto-style9">(</span><asp:Label ID="Label5" runat="server" CssClass="auto-style9" ForeColor="Gray" Text='<%# Eval("vDate", "{0:yyyy.MM.dd HH:mm}") %>'></asp:Label><span class="auto-style9">)</span></span>&nbsp;&nbsp;
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandArgument='<%# Eval("seq") %>' CommandName="Delete" ForeColor="#CC0000">삭제</asp:LinkButton>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="auto-style7" style="font-family: 'Noto Sans KR'; padding-left: 10px; padding-bottom: 10px; padding-top: 5px;">
                                        <asp:Label ID="Label4" runat="server" Text='<%# GetContent(Eval("content")) %>'></asp:Label>
                                    </td>
                                </tr>
                            </table>
                        </ItemTemplate>
                    </asp:DataList>
                </td>
            </tr>
            <tr>
                <td class="auto-style19" style="padding-top: 30px">
                    <table align="left" class="auto-style12" style="font-family: 'noto Sans KR'">
                        <tr>
                            <td class="auto-style15">이 름</td>
                            <td class="auto-style16">
                                <asp:TextBox ID="TextBox1" runat="server" Width="97%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style13">내 용</td>
                            <td class="auto-style17">
                                <asp:TextBox ID="TextBox2" runat="server" TextMode="MultiLine" Width="97%"></asp:TextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="auto-style14" colspan="2">
                                <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="확인" BackColor="#213A73" BorderStyle="Groove" BorderWidth="1px" ForeColor="White" Height="35px" Width="65px" Font-Names="Noto Sans KR" />
                                <br />
                                <br />
                                <br />
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" SelectCommand="SELECT * FROM [Visitor] ORDER BY [seq] DESC" ></asp:SqlDataSource>
        </table>
    </div>
</asp:Content>
