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

namespace Project004.MemberOnly
{
    public partial class Modify : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack) 
            {
                string id = User.Identity.Name;

                string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
                SqlConnection con = new SqlConnection(conStr);
                string sql = "Select * from B_user where id = @id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    Label1.Text = id;
                    TextBox1.Text = rd["name"].ToString();
                    TextBox4.Text = rd["univ"].ToString();
                    TextBox5.Text = rd["major"].ToString();
                    TextBox6.Text = rd["part"].ToString();
                    TextBox7.Text = rd["task"].ToString();
                    Image3.Visible = true;
                    Image3.ImageUrl = "~/UserImages/" + rd["photo"].ToString();

                    if (rd.Read())
                    {
                        Button1.Text = rd["fName"].ToString();
                    }
                }
                rd.Close();
                con.Close();
            }

    }
        protected void Button1_Click(object sender, EventArgs e)
        {
            string id = User.Identity.Name;
            string name = TextBox1.Text;
            string passwd = TextBox2.Text;
            string univ = TextBox4.Text;
            string major = TextBox5.Text;
            string part = TextBox6.Text;
            string task = TextBox7.Text;
            string Photo = Image3.ImageUrl;
            FileInfo photoName = new FileInfo(Server.MapPath("~/UserImages/") + Photo);
            Photo = photoName.Name;

            if (passwd == TextBox3.Text)
            {
                string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
                SqlConnection con = new SqlConnection(conStr);
                string sql = @"Update B_user Set name=@name, passwd=@passwd, univ=@univ, major=@major, part=@part, task=@task, Photo=@Photo where id = @id";
                SqlCommand cmd = new SqlCommand(sql, con);

                if (FileUpload1.HasFile)//첨부된 파일이 있는 경우 (사진 앨범과 유사)
                {
                    //img도 변경
                    Image3.ImageUrl = "";
                    Photo = FileUpload1.FileName;
                    //실제로 폴더에서 파일 삭제
                    FileInfo myFile2 = new FileInfo(Server.MapPath("~/UserImages/") + Photo); myFile2.Delete();
                    FileInfo myFile = new FileInfo(Server.MapPath("~/UserImages/") + Photo);

                    if (myFile.Exists)
                    {//이미 존재하는 파일명을 첨부하려고 함 : 파일 이름 뒤에 1,2,3을 붙임
                        myFile = NewFileName(myFile); //호출
                        Photo = myFile.Name; //경로를 제외한 파일 이름만, 여기까진 DB에 저장
                    }
                    FileUpload1.SaveAs(myFile.FullName); //파일을 서버에 저장(full path name을 주어야 함)
                }


                cmd.Parameters.AddWithValue("@name", name);
                cmd.Parameters.AddWithValue("@passwd", passwd);
                cmd.Parameters.AddWithValue("@univ", univ);
                cmd.Parameters.AddWithValue("@major", major);
                cmd.Parameters.AddWithValue("@part", part);
                cmd.Parameters.AddWithValue("@task", task);
                cmd.Parameters.AddWithValue("@id", id);
                cmd.Parameters.AddWithValue("@Photo", Photo);

                con.Open();
                int a = cmd.ExecuteNonQuery();
                con.Close();

                if (a > 0)
                {
                    string str = "<script> alert('정보가 변경되었습니다.'); ";
                    str += " location.href='Modify.aspx'; ";
                    str += "</script>";
                    Response.Write(str);
                }
                else
                    Label3.Text = "정보변경에 실패했습니다.";
            }
            else
            {
                string str = "<script> alert('비밀번호가 일치하지 않습니다.'); ";
                str += " location.href='Modify.aspx'; ";
                str += "</script>";
                Response.Write(str);
            }
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
    }
}