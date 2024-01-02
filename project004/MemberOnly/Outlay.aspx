<%@ Page Title="" Language="C#" MasterPageFile="~/MyBlog.Master" AutoEventWireup="true" CodeBehind="Outlay.aspx.cs" Inherits="Project004.WebForm1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .backStyle {

            font-family: 'Noto Sans KR';
            padding-bottom:10%;
            padding-top:2%;
        }
        .centerAlign {
            text-align: center;
        }
        .rightAlign {
            text-align: right;
        }
        .leftAlign {
            text-align: left;
        }
        .total {
            color:red;
            text-align: right;
        }
        .tableStyle {
            width: 1050px;
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
        .headerStyle {
            background-color: #e1e1e1;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="backStyle">
        <h2>지출 현황 조회 및 등록</h2>
         <p><strong>저희 팀 프로젝트의 예산 현황을 한눈에 알 수 있습니다.</strong></p>

            <table class="tableStyle">
                <tr>
                    <td width="500px" class="centerAlign">
                        <h2 class="centerAlign">실습장비 지출 내역서</h2>
            <asp:DataList class="centerAlign" ID="DataList1" runat="server" DataKeyField="seq" DataSourceID="SqlDataSource1" Width="500px">
                <HeaderTemplate>
                    <table class="headerStyle" align="center">
                        <tr>
                            <td class="centerAlign" width="10px">&nbsp&nbsp;</td>
                            <td class="rightAlign" width="90px"><strong>신청날짜</strong></td>
                            <td class="rightAlign" width="200px"><strong>실습장비</strong></td>
                            <td class="rightAlign" width="200px"><strong>가격&nbsp;(원)</strong></td>
                        </tr>
                    </table>
                </HeaderTemplate>
                <ItemTemplate>
                    &nbsp; &nbsp; &nbsp;&nbsp; 
                    <table align="center">
                        <tr>
                            <td class="centerAlign" width="10px">
                                <asp:Label ID="seqLabel" runat="server" Text='<%#Eval("seq") %>' />
                            </td>
                            <td class="rightAlign" width="90px">
                                <asp:Label ID="dateLabel" runat="server" Text='<%# Eval("date","{0:d}") %>' />
                            </td>
                            <td class="rightAlign" width="200px">
                                <asp:Label ID="subjectLabel" runat="server" Text='<%# Eval("subject") %>' />
                            </td>
                            <td class="rightAlign" width="200px">
                                <asp:Label ID="priceLabel" runat="server" Text='<%# Eval("price","{0:#,0}") %>' />
                                (원)</td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:master %>" SelectCommand="SELECT * FROM [B_pay] ORDER BY [seq]"></asp:SqlDataSource>
                    </td>
                    <td>
                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                        <table width="550px" class="rightAlign"> 
                            <tr>
                                <td colspan="2"> 
                                    <h2 class="leftAlign"><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;실습장비 신청</h2>
                                </td>
                            </tr>
                            <tr>
                                 &nbsp;&nbsp;&nbsp;&nbsp;
                                 <td><br />실습 장비 : &nbsp;</td>
                                 <td class="leftAlign"><br /><asp:TextBox ID="TextBox1" runat="server" Width="195px"></asp:TextBox>&nbsp;<strong>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1" CssClass="total" ErrorMessage="필수 입력"></asp:RequiredFieldValidator>
                                     </strong></td>
                            </tr>
                            <tr>
                                 <td>&nbsp;&nbsp;&nbsp;총 가격 : &nbsp; </td>
                                 <td class="leftAlign"><asp:TextBox ID="TextBox2" runat="server"></asp:TextBox> &nbsp;원&nbsp;&nbsp; <strong>
                                     <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2" CssClass="total" ErrorMessage="필수 입력"></asp:RequiredFieldValidator>
                                     </strong> </td>
                            </tr>
                            <tr>
                                 <td class="rightAlign">신청 일시 :&nbsp;&nbsp;
                                     <br />
                                     <br />
                                     &nbsp; <br />
                                  <br />
                                  <br />
                                  <br />
                                  <br />
                                  <br />
                                  <br />
                                  <br />
                                  <br />
                                 </td>
                                 <td class="leftAlign">
                                  <asp:Calendar ID="Calendar1" runat="server" Width="200px" BackColor="White" BorderColor="#999999" CellPadding="4" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" Height="180px" >
                                      <DayHeaderStyle BackColor="#e1e1e1" Font-Bold="True" Font-Size="7pt"/>
                                      <NextPrevStyle VerticalAlign="Bottom" ForeColor="white"/>
                                      <OtherMonthDayStyle ForeColor="#e1e1e1" />
                                      <SelectedDayStyle BackColor="#213A73" Font-Bold="True" ForeColor="White" />
                                      <SelectorStyle BackColor="#e1e1e1"/>
                                      <TitleStyle BackColor="#213A73" BorderColor="white" ForeColor="White" Font-Bold="True" />
                                      <TodayDayStyle BackColor="#a82632" ForeColor="white" />
                                      <WeekendDayStyle BackColor="#f5f5f6" ForeColor="red" Font-Bold="True"/>
                                      
                                     </asp:Calendar><br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                     &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<asp:Button class="btnStyle" ID="Button1" runat="server" Text="신청완료" OnClick="Button1_Click"/>
                                 </td>
                            </tr>
                            </table>
                    &nbsp;</td>
                </tr>
                <tr>
                    <td>
                    <table width="500px">
                        <hr />
                        <tr>
                        <td class="leftAlign" width="250px">&nbsp;TOTAL: </td>
                        <td class="total" width="250px"><strong><asp:Label ID="Label1" runat="server"></asp:Label></strong></td>
                        </tr>
                        <tr>
                            <td class="leftAlign" width="250px">&nbsp;BALANCE:  </td>
                            <td class="rightAlign" width="250px">
                             <asp:Label TextAlign="right" ID="Label2" runat="server"></asp:Label></td>
                            </tr>
                    </table>
                        </td>
                </tr>
                </table>

            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />
          
      </div>
</asp:Content>
