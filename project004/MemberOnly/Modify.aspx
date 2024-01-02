<%@ Page Title="" Language="C#" MasterPageFile="~/MyBlog.Master" AutoEventWireup="true" CodeBehind="Modify.aspx.cs" Inherits="Project004.MemberOnly.Modify" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .{
            font-family: 'Noto Sans KR';
        }
        .back{
            padding-bottom:10%;
            padding:2%;
            font-family:'Noto Sans KR';
        }
            .tit {
                width: 15%;
                background-color: #F2F2F2;
                text-align: center;
                height: 30px;
                padding-top: 10px;
                padding-bottom: 10px;
                border: 1px solid #CCCCCC;
            }

            .tit2 {
                border: 1px solid #CCCCCC;
                padding-left: 1.5%;
            }

            .allRead {
                width: 95%;
                border-collapse: collapse;
            }

            .btnPush {
                background-color: #213A73;
                color: white;
                border-style: groove;
                border-width: 1px;
                height: 35px;
                width: 65px;
            }
            .fileMa{
                margin-bottom:2%;
            }
            </style>

    <div class="back">
        <h2>정보 변경</h2>
        <table class="allRead">
            <tr>
                <td class="tit">아이디</td>
                <td colspan="5" class="tit2">
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="tit">이름</td>
                <td colspan="5" class="tit2">
                    <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="tit">비밀번호</td>
                <td colspan="5" class="tit2">
                    <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2" ErrorMessage="필수 입력" ForeColor="Red">*</asp:RequiredFieldValidator>
                    &nbsp; </td>
            </tr>
            <tr>
                <td class="tit">비밀번호 확인</td>
                <td colspan="5" class="tit2">
                    <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox>
                    &nbsp;&nbsp; </td>
            </tr>
            <tr>
                <td class="tit">대학</td>
                <td colspan="5" class="tit2">
                    <asp:TextBox ID="TextBox4" runat="server" ></asp:TextBox>
                    &nbsp; </td>
            </tr>
            <tr>
                <td class="tit">전공</td>
                <td colspan="5" class="tit2">
                    <asp:TextBox ID="TextBox5" runat="server"></asp:TextBox>
                    &nbsp; </td>
            </tr>
            <tr>
                <td class="tit">역할</td>
                <td colspan="5" class="tit2">
                    <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
                    &nbsp;</td>
            </tr>
            <tr>
                <td class="tit">업무</td>
                <td colspan="5" class="tit2">
                    <asp:TextBox ID="TextBox7" runat="server" TextMode="MultiLine" Width="80%"></asp:TextBox>
                </td>
            </tr>
            <tr>
                <td class="tit">프로필 사진</td>
                <td colspan="5" class="tit2">
                    <asp:Image ID="Image3" runat="server" Height="100px" Width="100px" />
                    <br />
                    <asp:FileUpload ID="FileUpload1" runat="server" CssClass="fileMa"/>
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <br />
                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="변경" CssClass="btnPush" />
                </td>
            </tr>
        </table>
        <asp:Label ID="Label3" runat="server"></asp:Label>
        <br />
    </div>
</asp:Content>
