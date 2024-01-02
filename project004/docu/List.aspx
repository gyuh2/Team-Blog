<%@ Page Title="" Language="C#" MasterPageFile="~/MyBlog.Master" AutoEventWireup="true" CodeBehind="List.aspx.cs" Inherits="project004.docu.List" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style type="text/css">
    .{
        font-family:'Noto Sans KR';
    }
    .back{
        font-family:'Noto Sans KR';
        padding-bottom:10%; 
    }
    .btnPush{
        background-color: #213A73;
        color:white;
        border-style:none;
        border-width:1px;
        height:35px;
        width:65px;
    }

    </style>
    <div class="back">
        <br />
        <h2>자료실</h2>
            <p ><strong>팀 블로그의 자료를 한 눈에 보고  다운로드 받을 수 있습니다.</strong></p>
        <br />

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="seq" DataSourceID="SqlDataSource1" AllowPaging="True" Width="95%" 
            BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Horizontal">
            <Columns>
                <asp:BoundField DataField="seq" HeaderText="번호" InsertVisible="False" ReadOnly="True" SortExpression="seq">
                    <HeaderStyle Width="77px" />
                    <ItemStyle HorizontalAlign="Center" />                
                </asp:BoundField>
                
                <asp:BoundField DataField="divide" HeaderText="구분" SortExpression="divide">
                    <HeaderStyle Width="200px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>

                <asp:TemplateField HeaderText="제목" SortExpression="title">
                    <EditItemTemplate>
                        
                    </EditItemTemplate>
                    <ItemTemplate>
                        <%# ShowTitle(Eval("seq").ToString(),
                                Eval("title").ToString())%>
                    </ItemTemplate>
                    <HeaderStyle Width="250px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:TemplateField>

                <asp:BoundField DataField="name" HeaderText="작성자" SortExpression="name">
                    <HeaderStyle Width="100px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>

                <asp:BoundField DataField="date" HeaderText="날짜" SortExpression="date" DataFormatString="{0:yyyy-MM-dd}">
                    <HeaderStyle Width="100px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>

                <asp:BoundField DataField="hit" HeaderText="조회수" SortExpression="hit">
                    <HeaderStyle Width="70px" />
                    <ItemStyle HorizontalAlign="Center" />
                </asp:BoundField>
            </Columns>

            <FooterStyle BackColor="#213A73" ForeColor="#213A73" />
            <HeaderStyle BackColor="#F2F2F2" Font-Size="18px"  />
            <PagerStyle BackColor="White" ForeColor="#213A73" HorizontalAlign="Center" BorderStyle="None" />

        </asp:GridView>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" SelectCommand="SELECT [seq], [divide], [title], [name], [date], [hit] FROM [B_docu] ORDER BY [seq] DESC"></asp:SqlDataSource>
        <br />
        <asp:Panel ID="Panel1" runat="server">
            <asp:Button ID="Button8" runat="server" PostBackUrl="~/MemberOnly/write.aspx" Text="글쓰기" CssClass="btnPush"/>
        </asp:Panel>
    </div>


</asp:Content>
