<%@ Page Title="" Language="C#" MasterPageFile="~/MyBlog.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="project004.MemberOnly.Edit" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
    .{
         font-family:'Noto Sans KR';
     }
    .back{
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
    .allEdit {
        width: 95%;
        border-collapse:collapse;
    }
    .LinkBtn{
        color:#213A73;
        text-decoration:none;
    }
    .mul{
        margin-bottom:5px;
        margin-top:5px;
    }
    .lbl {
        font-size: small;
        
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

    <div style="padding-bottom:10%;" class="back">
        <br />
    <h2 style= "padding-bottom:25px; padding-top:5px;">내용 수정 및 정정</h2>
        <table class="allEdit">
            <tr>
                <td class="tit">구분</td>
                <td class="tit2">
                    &nbsp;
                    <asp:TextBox ID="TextBox1" runat="server" Width="300px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ErrorMessage="글의 구분을 입력하세요." ControlToValidate="TextBox1" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="tit">제목</td>
                <td class="tit2">
                    &nbsp;
                    <asp:TextBox ID="TextBox2" runat="server" Width="94.7%"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                     ErrorMessage="제목을 입력하세요." ControlToValidate="TextBox2" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="tit">내용</td>
                <td class="tit2">
                    &nbsp;
                    <asp:TextBox ID="TextBox3" runat="server" Width="95%" Height="300px" TextMode="MultiLine" CssClass="mul"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                     ErrorMessage="내용을 입력하세요." ControlToValidate="TextBox3" ForeColor="Red" Display="Dynamic">*</asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="tit">작성자</td>
                <td class="tit2">
                    &nbsp;
                    <asp:TextBox ID="TextBox4" runat="server" Width="300px"></asp:TextBox>
                    &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                        ErrorMessage="작성자를 입력하세요." ControlToValidate="TextBox4" ForeColor="Red">*</asp:RequiredFieldValidator>
                </td>
            </tr>

            <tr>
                <td class="tit">첨부 파일</td>
                <td class="tit2">
                    &nbsp;
                    <asp:Label ID="Label1" runat="server"></asp:Label>
                        &nbsp;<asp:Label ID="Label2" runat="server"></asp:Label>
                        &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" CssClass="LinkBtn" OnClick="LinkButton1_Click1">파일 삭제</asp:LinkButton>
                    <asp:HiddenField ID="HiddenField1" runat="server" />
                </td>
            </tr>

            <tr>
                <td class="tit">파일 첨부</td>
                <td class="tit2">
                    &nbsp;
                    <asp:FileUpload ID="FileUpload1" runat="server" Width="55%"/>
                    &nbsp;<asp:Label ID="Label3" runat="server" CssClass="lbl" ForeColor="Red">* 기존 파일을 삭제한 후 수정하십시오.</asp:Label>
                </td>
            </tr>

            <tr>
                <td colspan="2">
                    &nbsp;<br />
                    <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="수정" CssClass="btnPush"/>
&nbsp;<asp:Button ID="Button9" runat="server" PostBackUrl="~/docu/List.aspx" Text="리스트" CssClass="btnPush" CausesValidation="False"/>
                </td>
            </tr>
        </table>
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="true" ShowSummary="false"/>
    </div>
</asp:Content>
