<%@ Page Title="" Language="C#" MasterPageFile="~/MyBlog.Master" AutoEventWireup="true" CodeBehind="write.aspx.cs" Inherits="project004.MemberOnly.write" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
        .{
            font-family:'Noto Sans KR';
        }
        .tit{
            width:20%;
            background-color: #f2f2f2;
            text-align:center;
            padding-top:10px;
            padding-bottom:10px;
            border : 1px solid #CCCCCC;
        }
        .tit2{
            border : 1px solid #CCCCCC;
            padding-top:10px;
            padding-bottom:10px;
        }
        .allWrite {
            width: 95%;
            border-collapse:collapse;
        }
        .mul{
            margin-bottom:5px;
            margin-top:5px;
        }
        .btnPush{
            background-color: #213A73;
            color:white;
            border-style:groove;
            border-width:1px;
            height:35px;
            width:65px;
        }
    </style>

    <div style=" padding-bottom:10%;">
        <br />
    <h2 style= "padding-bottom:25px; padding-top:5px;">내용 작성 및 업로드</h2>
        <table class="allWrite">
            <tr>
                <td class="tit">구분</td>
                <td class="tit2">
                    &nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="글의 구분을 입력하세요." ControlToValidate="TextBox1" ForeColor="Red">
                        *</asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="tit">제목</td>
                <td class="tit2">
                    &nbsp;
                    <asp:TextBox ID="TextBox2" runat="server" Width="94.7%"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                     ErrorMessage="제목을 입력하세요." ControlToValidate="TextBox2" ForeColor="Red" Display="Dynamic">
                        *</asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="tit">내용</td>
                <td class="tit2">
                    &nbsp;
                    <asp:TextBox ID="TextBox3" runat="server" Width="95%" Height="300px" TextMode="MultiLine" CssClass="mul"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                     ErrorMessage="내용을 입력하세요." ControlToValidate="TextBox3" ForeColor="Red" Display="Dynamic">
                        *</asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="tit">작성자</td>
                <td>
                    &nbsp;
                    <asp:TextBox ID="TextBox4" runat="server" Width="300px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="작성자를 입력하세요." ControlToValidate="TextBox4" ForeColor="Red">
                        *</asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="tit">파일 첨부</td>
                <td class="tit2">
                    &nbsp;
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="55%"/>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    <br />
                    <asp:Button ID="Button8" runat="server" Text="글쓰기" OnClick="Button8_Click" CssClass="btnPush"/>
&nbsp;              <asp:Button ID="Button9" runat="server" Text="리스트" PostBackUrl="~/docu/List.aspx" CssClass="btnPush" CausesValidation="False"/>
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false"/>
    </div>
</asp:Content>
