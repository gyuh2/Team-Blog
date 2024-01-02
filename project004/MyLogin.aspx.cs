using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Web.Security;

namespace Project004
{
    public partial class MyLogin1 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated)
            {
                Response.Redirect(FormsAuthentication.DefaultUrl);
            }
        }

        protected void Button8_Click(object sender, EventArgs e)
        { //로그인 버튼
            if (IsAuthenticated(TextBox1.Text, TextBox2.Text)) // 인증된 사용자이면
            {
                // 실제 로그인 실행: (1)인증 쿠키 생성 + (2)요청한 페이지로 이동
                FormsAuthentication.RedirectFromLoginPage(TextBox1.Text, CheckBox1.Checked);
                //로그인 시켜주는 기능임.
            }
            else
                Label1.Text = "ID 또는 비밀번호가 틀립니다..";
        }

        private bool IsAuthenticated(string userID, string passwd)
        {
            bool result = false;

            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = "Select * from B_user where id = @id and passwd = @passwd";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@id", userID);
            cmd.Parameters.AddWithValue("@passwd", passwd);

            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
                result = true;

            rd.Close();
            con.Close();
            return result;
        }
    }
}