using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Security;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.IO;

namespace project004.docu
{
    public partial class Read : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if(Page.User.Identity.IsAuthenticated)//로그인 상태 확인
            {
                Panel1.Visible = true;
            }
            else
            {
                Panel1.Visible = false;
            }
            if (!IsPostBack)
            {
                string seq = Request.QueryString["sn"]; //리스트에서 읽어온 글 번호

                //연결
                string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
                SqlConnection con = new SqlConnection(conStr);
                //명령 : 조회수 증가 실행
                string sql = "update B_docu set hit=hit+1 where seq=" + seq;
                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                cmd.ExecuteNonQuery(); //쿼리문 실행
                con.Close();

                //명령 : 글 읽어오기 실행
                string sql2 = "select * from B_docu where seq=" + seq;
                SqlCommand cmd2 = new SqlCommand(sql2, con);

                con.Open();
                SqlDataReader rd = cmd2.ExecuteReader();

                if (rd.Read())
                {
                    Label1.Text = rd["title"].ToString();
                    Label2.Text = rd["name"].ToString();
                    Label3.Text = string.Format("{0:yyyy-MM-dd}", (DateTime)rd["date"]);
                    Label4.Text = rd["hit"].ToString();
                    Label5.Text = rd["content"].ToString().Replace("\n", "<br />");
                    LinkButton1.Text = rd["fName"].ToString();
                    Label6.Text = rd["fSize"].ToString() + "bytes";

                    if (LinkButton1.Text == "")
                    {
                        Label6.Visible = false;
                    }
                    else
                    {
                        Label6.Visible = true;
                    }
                    //수정 내용
                    Button8.PostBackUrl = "~/MemberOnly/Edit.aspx?sn=" + rd["seq"].ToString();
                    Button9.PostBackUrl = "~/MemberOnly/Delete.aspx?sn=" + rd["seq"].ToString();
                    Button10.PostBackUrl = "~/docu/List.aspx";

                }
                rd.Close();
                con.Close();

            }
        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {
            //클라이언트로 파일 전송
            SendFile(Server.MapPath("~/Uploads/") + LinkButton1.Text, LinkButton1.Text); // (전체경로명, 파일명)

        }

        private void SendFile(string fullName, string fileName)
        {
            //파일 이름 보내주기
            //(1)파일 이름 보내주기
            Response.AddHeader("Content-Disposition", "attachment; filename=" + HttpUtility.UrlPathEncode(fileName));
            //다운로드 시 무조건 "파일 다운로드" 대화상자가 뜨도록 attachment; 를 붙인다.
            //타입 지정: 파일 전송 임을 알림
            Response.ContentType = "multipart/form-data";
            //서버에 있는 파일 전송 : full path name
            Response.WriteFile(fullName);
            Response.End();
        }
    }
}