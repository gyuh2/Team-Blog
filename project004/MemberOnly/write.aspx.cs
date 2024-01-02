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
using System.IO; //자료실용

namespace project004.MemberOnly
{
    public partial class write : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
        }

        private FileInfo NewFileName(FileInfo myFile)
        {
            int num = 0;
            string fileName = "";
            string fName = myFile.Name.Substring(0, ((myFile.Name.Length) - (myFile.Extension.Length)));
            string fExtension = myFile.Extension;

            do
            {
                num++;
                fileName = fName + "_" + num + fExtension;
                myFile = new FileInfo(Server.MapPath("~/Uploads/") + fileName);
            } while (myFile.Exists);

            return myFile;
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
            //글쓰기 버튼
            string fName = "";
            int fSize = 0;

            if (FileUpload1.HasFile) //파일 첨부 여부 (true, 있다는 의미)
            {
                fName = FileUpload1.FileName;
                FileInfo myFile = new FileInfo(Server.MapPath("~/Uploads/") + fName);
                if (myFile.Exists)
                {//이미 존재하는 파일명을 첨부하려고 하는 경우 : 파일 이름 뒤에 숫자를 붙여 중복 방지
                    myFile = NewFileName(myFile); //함수 호출
                    fName = myFile.Name; //경로를 제외한 파일 이름, DB에 저장할 정보
                }
                FileUpload1.SaveAs(myFile.FullName); //파일을 서버에 저장, full path name을 주어야 함
                fSize = FileUpload1.PostedFile.ContentLength; //바이트 단위
            }

            //1) 입력 내용 테이블에 저장

            //연결
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);
            //명령
            string sql = @"insert into B_docu (divide, title, content, name, date, fName, fSize)
                            values(@divide, @title, @content, @name, getDate(), @fName, @fSize)";
            SqlCommand cmd = new SqlCommand(sql, con);

            cmd.Parameters.AddWithValue("@divide", TextBox1.Text);
            cmd.Parameters.AddWithValue("@title", TextBox2.Text);
            cmd.Parameters.AddWithValue("@content", TextBox3.Text);
            cmd.Parameters.AddWithValue("@name", TextBox4.Text);
            cmd.Parameters.AddWithValue("@fName", fName);
            cmd.Parameters.AddWithValue("@fSize", fSize);

            //실행 및 화면 출력
            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            Response.Redirect("~/docu/List.aspx");
        }
    }
}