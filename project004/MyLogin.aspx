<%@ Page Title="" Language="C#" MasterPageFile="~/MyBlog.Master" AutoEventWireup="true" CodeBehind="MyLogin.aspx.cs" Inherits="Project004.MyLogin1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
     .{
         font-family:'Noto Sans KR';
     }
    .ba{
        font-size:large;
    }
    .allba{
        margin-left:22%;
        margin-top:2%;
        padding-bottom:20%;
    }
    .allLog{
        width:50%;
    }
    .txtMa{
        margin-bottom:5%;
    }
    .logBtn{
        background-color:#F2F2F2;
        border: 1px solid #CCCCCC;
        text-align:center;
        font-family:'Noto Sans KR';
        height:60px;
        font-size:large;
        margin-top:5%;
        margin-bottom:5%;
    }
    .logBtn:hover{
        background-color:#CCCCCC;
    }
    .errMessage{
        color:red;
        text-align:center;
    }
    </style>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <br />
    <div class="allba">

        <table class="allLog" style="width: 50%;">
            <tr>
                <td style="font-size:x-large; padding-bottom:50px; text-align:center;"><strong>로그인</strong></td>
                
            </tr>
            <tr>
                <td class="ba">아이디</td>
            </tr>
            <tr>
                <td class="auto-style2">
                    <asp:TextBox ID="TextBox1" runat="server" Width="100%" Height="25px" CssClass="txtMa"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="ba">비밀번호</td>
            </tr>
            <tr>
                <td>
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" Width="100%" Height="25px" CssClass="txtMa"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td><asp:CheckBox ID="CheckBox1" runat="server" Text="로그인 상태 유지" />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    <asp:Button ID="Button8" runat="server" Text="로그인" CssClass="logBtn" OnClick="Button8_Click" Width="102%" />
                </td>
            </tr>
            <tr>
            <td Class="errMessage">
                   <asp:Label ID="Label1" runat="server"></asp:Label>
            </td>
            </tr>
        </table>

    </div>


        </asp:Content>