<%@ Page Title="" Language="C#" MasterPageFile="~/MyBlog.Master" AutoEventWireup="true" CodeBehind="Read.aspx.cs" Inherits="project004.docu.Read" %>
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
        width:15%;
        background-color: #F2F2F2;
        text-align:center;
        height:30px;
        padding-top:10px;
        padding-bottom:10px;
        border: 1px solid #CCCCCC;
    }
    .tit2{
        border: 1px solid #CCCCCC;
        padding-left:1.5%;
    }
    .allRead{
        width:95%;
        border-collapse:collapse;
    }
    .LinkBtn2{
        color:#213A73;
    }
    .byteInfo{
        font-size:small;
    }
    .cenRead {
        text-align: center;
        border:1px solid #CCCCCC;
    }
    .tit3{
        border: 1px solid #CCCCCC;
        padding-left:1.5%;
        padding-top:2%;
        padding-bottom:2%;
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
    <h2 style= "padding-bottom:25px; padding-top:5px;">자료실</h2>
    <table class="allRead">
        <tr>
            <td class="tit" > 제목</td>
            <td colspan="5" class="tit2">
                <asp:Label ID="Label1" runat="server"></asp:Label>
                &nbsp;</td>
        </tr>
        <tr>
            <td class="tit">작성자</td>
            <td style="width:230px" class="tit2">
                <asp:Label ID="Label2" runat="server"></asp:Label>
                &nbsp;
            </td>

            <td style="background-color:#F2F2F2; width:50px; text-align:center; border:1px solid #CCCCCC;">날짜 </td>
            <td style="width: 150px;" class="cenRead">
                <asp:Label ID="Label3" runat="server"></asp:Label>
                &nbsp;
            </td>

            <td style="background-color:#F2F2F2; width:70px; text-align:center; border:1px solid #CCCCCC;">조회수</td>
            <td style="width: 100px;" class="cenRead">
                <asp:Label ID="Label4" runat="server"></asp:Label>
            </td>
        </tr>

        <tr>
            <td class="tit">내용</td>
            <td colspan="5" class="tit3">
                <asp:Label ID="Label5" runat="server" CssClass="lbltit"></asp:Label>
             </td>
        </tr>
        <tr>
            <td class="tit" >파일 첨부</td>
            <td colspan="5" class="tit2">
                &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click" CssClass="LinkBtn2">LinkButton</asp:LinkButton>
                &nbsp;<asp:Label ID="Label6" runat="server" CssClass="byteInfo"></asp:Label>
                &nbsp;</td>
        </tr>

        <tr>
            <td colspan="6"><br />
                <asp:Panel ID="Panel1" runat="server">
                    <asp:Button ID="Button8" runat="server" Text="수정" CssClass="btnPush"/>
                    &nbsp;<asp:Button ID="Button9" runat="server" Text="삭제"  CssClass="btnPush"/>
                </asp:Panel>
            </td>
        </tr>

        <tr>
            <td></td>
            <td style="text-align:right" colspan="5">
                <asp:Button ID="Button10" runat="server" Text="리스트"  CssClass="btnPush"/>
            </td>
        </tr>

        </table>
    <br />
</div>
</asp:Content>
