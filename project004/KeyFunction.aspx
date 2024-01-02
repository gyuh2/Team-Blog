<%@ Page Title="" Language="C#" MasterPageFile="~/MyBlog.Master" AutoEventWireup="true" CodeBehind="KeyFunction.aspx.cs" Inherits="Project004.WebForm2" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .back {
            font-family: 'Noto Sans KR';
            padding-bottom:10%; padding-top:2%;
        }
        .centerAlign {
            text-align: center;
        }
        .btnStyle {
            font-family: 'Noto Sans KR';
            height: 35px;
            width: 80px;
            background-color: #213A73;
            border-style: groove; 
            border-width: 1px;
            color:white;
            font-size: medium;
        }
        .dropStyle {
            font-family: 'Noto Sans KR';
            height: 35px;
            width: 120px;
            background-color: #f5f5f6;
            border-style: groove; 
            border-width: 1px;
            font-size: medium;
        }
        .functionStyle {
            font-size: x-large;
            color: #213A73;
            text-align: left;
        }
        .tableStyle {
            width: 100%;
            height: 400px;
        }
        .tdStyle {
            width: 400px;
            height: 400px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="back">
            <h2>프로젝트 주요 기능</h2>
            <p><strong>저희 팀 프로젝트의 가장 중요한 기능을 알 수 있습니다.</strong></p>
            <br />
            <asp:DropDownList class="dropStyle" ID="DropDownList1" runat="server" DataSourceID="SqlDataSource1" DataTextField="fName" DataValueField="fName" OnDataBound="DropDownList1_DataBound"></asp:DropDownList>
            &nbsp;&nbsp;<asp:Button class="btnStyle" ID="Button3" runat="server" Text="조회하기" OnClick="Button3_Click" />
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" SelectCommand="SELECT [fName] FROM [B_function] ORDER BY [fName]"></asp:SqlDataSource>
            <br />
            <br />
            <hr />
            <br /><br />
            <strong>
            <asp:Label ID="Label1" runat="server" Text="" CssClass="functionStyle"></asp:Label>
            <br /><br />
            </strong>
            
            <table class="tableStyle">
                <tr>
                    <td class="tdStyle">
            <asp:Image ID="Image1" runat="server" Height="400px" Width="100%"/>
                    </td>
                    <td style="padding-left:5%;">
            <p><asp:Label width="55%" ID="Label2" runat="server" Text=""></asp:Label></p>
                        
                    </td>
                </tr>
            </table>
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br /><br />
      </div>
</asp:Content>