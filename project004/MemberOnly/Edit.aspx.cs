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

namespace project004.MemberOnly
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)//매우 중요, 빠뜨리면 수정 안 됨
            {
                string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
                SqlConnection con = new SqlConnection(conStr);

                string sql = "Select * from B_docu Where seq = " + Request.QueryString["sn"];
                SqlCommand cmd = new SqlCommand(sql, con);
                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();


                if (rd.Read())
                {
                    TextBox1.Text = rd["divide"].ToString(); //구분
                    TextBox2.Text = rd["title"].ToString(); //제목
                    TextBox3.Text = rd["content"].ToString(); //내용
                    TextBox4.Text = rd["name"].ToString(); //작성자

                    Label1.Text = rd["fName"].ToString(); //파일명
                    Label2.Text = "(" + rd["fSize"].ToString() + " bytes)";
                    HiddenField1.Value = rd["fSize"].ToString();

                    if (Label1.Text == " ")
                    {
                        Label1.Visible = false;
                        LinkButton1.Visible = false;
                        Label2.Visible = false;
                    }
                    else
                    {
                        Label1.Visible = true;
                        LinkButton1.Visible = true;
                        Label2.Visible = true;
                    }
                }
                rd.Close();
                con.Close();
            }

        }
        protected void Button8_Click(object sender, EventArgs e)
        {//수정 버튼
            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령
            string sql = @"Update B_docu Set divide=@divide, title=@title, content=@content, name=@name, fName=@fName, fSize=@fSize
                            Where seq = " + Request.QueryString["sn"];
            SqlCommand cmd = new SqlCommand(sql, con);

            //첨부파일 수정 여부 파악
            string fileName = Label1.Text;
            int fileSize = int.Parse(HiddenField1.Value);

            if (FileUpload1.HasFile)//첨부된 파일이 있는 경우 (사진 앨범과 유사)
            {
                fileName = FileUpload1.FileName;
                FileInfo myFile = new FileInfo(Server.MapPath("~/Uploads/") + fileName);
                if (myFile.Exists)
                {//이미 존재하는 파일명을 첨부하려고 함 : 파일 이름 뒤에 숫자 붙임
                    myFile = NewFileName(myFile); //호출
                    fileName = myFile.Name; //경로를 제외한 파일 이름만, 여기까진 DB에 저장
                }
                FileUpload1.SaveAs(myFile.FullName); //파일을 서버에 저장(full path name을 주어야 함)
                fileSize = FileUpload1.PostedFile.ContentLength; //바이트 단위
            }

            cmd.Parameters.AddWithValue("@divide", TextBox1.Text);
            cmd.Parameters.AddWithValue("@title", TextBox2.Text);
            cmd.Parameters.AddWithValue("@content", TextBox3.Text);
            cmd.Parameters.AddWithValue("@name", TextBox4.Text);
            cmd.Parameters.AddWithValue("@fName", fileName);
            cmd.Parameters.AddWithValue("@fSize", fileSize);

            //실행 및 화면표시
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/docu/List.aspx"); //List 페이지로 이동


        }

        private FileInfo NewFileName(FileInfo myFile)
        {
            int num = 0;
            string fileName = "";
            string fName = myFile.Name.Substring(0, (myFile.Name.Length - myFile.Extension.Length));
            string fExtension = myFile.Extension;

            do
            {
                num++;
                fileName = fName + "_" + num + fExtension;
                myFile = new FileInfo(Server.MapPath("~/Uploads/") + fileName);
            } while (myFile.Exists);

            return myFile;

        }

        protected void LinkButton1_Click1(object sender, EventArgs e)
        {//수정 : 파일 삭제 버튼
            //(1) DB에서 해당 레코드의 fName, fSize 수정
            string seq = Request.QueryString["sn"]; // 리스트에서 읽어온 글의 번호
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            string sql = @"Update B_docu Set fName=' ', fSize=0 Where seq = " + seq;
            SqlCommand cmd = new SqlCommand(sql, con);
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();
            // (2) 실제로 Uploads 폴더에서 파일 삭제
            FileInfo myFile = new FileInfo(Server.MapPath("~/Uploads/") + Label1.Text); myFile.Delete();
            Response.Redirect("~/MemberOnly/Edit.aspx?sn=" + seq); // 현재 페이지 다시 띄움

        }
    }
}