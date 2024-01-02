<%@ Page Title="" Language="C#" MasterPageFile="~/MyBlog.Master" AutoEventWireup="true" CodeBehind="Home.aspx.cs" Inherits="proj02.Home" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <style>
        .{
            font-family:'Noto Sans KR';
        }
        .back{
            font-family:'Noto Sans KR';
        }

        .head-style {
            text-align: center;
            color: #213A73;
            background-color:#F2F2F2;
            border-left: 10px solid #FFFFFF;
            border-right: 10px solid #FFFFFF;

        }
        .head-style2{
            text-align:center;
        }
        .menuLIst{
            width:33%;
            background-color:#F2F2F2;
            border-left: 10px solid #FFFFFF;
            border-right: 10px solid #FFFFFF;
            margin-left:5%;
            margin-right:5%;
            padding-top:2%;
            padding-bottom:3%;
            text-align:center;
            
        }
        .tblBot{
            padding-bottom:4%;
        }

        .auto-style1 {
            font-size: small;
        }

        .auto-style2 {
            font-size: large;
        }

    </style>
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/배화_슬라이드 이미지.jpg" CssClass="imgbody"/>
    <br />
    <div class="back">

        <table class="imgbody">
            <tr>
                <td>
                    <table class="imgbody">
                        <tr>
                            <td class="head-style2"><h1>배꼬지 : 배화인들의 모꼬지</h1>
                                <span class="auto-style1">*모꼬지란?&nbsp; 놀이나 잔치 또는 그밖의 일로 여러 사람이 모이는 일</span><br />
                                <br />
                            </td>
                        </tr>
                    </table>
                    <div class="head-style2">
                    해당 사이트는 저희 팀의 프로젝트와 관련된 사항을 집약한 포트폴리오 블로그로서,&nbsp;
                        <br />
                        쾌적한 실내환경을 위한 IoT 기반 스마트홈이라는 주제로 프로젝트를 진행하고 있습니다.
                    <br />
                    <br />
                    <br />
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="head-style2">
                        <h2>프로젝트 주요 내용</h2>
                    </div>
                    <table class="imgbody" style="border-collapse:collapse;">
                        <tr>
                            <td class="head-style"><h2>공공데이터</h2></td>
                            <td class="head-style"><h2>Server</h2></td>
                            <td class="head-style"><h2>Arduino</h2></td>
                        </tr>
                        <tr>
                            <td class="menuLIst">기상청 Open API 활용<br />
                                실시간 온ㆍ습도 Data 참조<br />
                                GPS 기반으로 해당 지역&nbsp; Data 참조<br />
                                <br />
                            </td>

                            <td class="menuLIst">AWS 클라우드 활용<br />
                                데이터 분석 및 인터페이스 역할<br />
                                Spring Boot 기반의 Server 구축<br />
                                <br />
                            </td>

                            <td class="menuLIst" style="padding-bottom:4%;">데이터 마이닝 기법 적용<br />
                                센서를 통한 데이터 추출<br />
                                연동된 IoT 기기 자동 제어<br />
                                App을 통한 원격 제어<br />
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                </td>
            </tr>
            <tr>
                <td>
                    
                    <table class="imgbody">
                        <tr >
                            <td>
                                <h2>성과 목표</h2>
                            </td>
                            <td style="width:3%;" rowspan="2">
                                &nbsp;</td>
                            <td>
                                <h2>기대 효과</h2>
                            </td>
                        </tr>
                        <tr>
                            <td style="width:40%; border:1px solid #CCCCCC; padding-right:4%;" >
                                <ul class="tblBot">
                                    <li>
                                         완성도 높은 결과물 도출을 톻해 공모전 수상
                                    </li>
                                    <li>
                                          체계적인 프로젝트 진행을 통해 졸업작품 마무리
                                    </li>
                                    <li>
                                         쾌적한 실내환경 조성을 통한 바쁜 현대인의 삶의 질 향상
                                    </li>
                                </ul>
                            </td>
                            <td style="width:40%; border:1px solid #CCCCCC; padding-right:4%;">
                                <ul>
                                    <li>
                                        물리적인 H/W와 S/W를 접목한 융합 기술 활용
                                    </li>
                                    <li>
                                        아두이노의 작동원리 파악과 이를 활용한 IoT 로직 구현
                                    </li>
                                    <li>
                                         API의 활용 및 공공데이터를 활용한 데이터 분석 및 제어처리
                                    </li>
                                    <li>
                                        GitLap과 AWS의 활용 방법 습득 및 클라우드 전반에 대한 이해도 향상
                                    </li>
                                </ul>
                            </td>
                        </tr>
                    </table>
                    <br />
                    <br />
                    <br />
                </td>
            </tr>
        </table>

    </div>
</asp:Content>