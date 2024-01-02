using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // 추가
using System.Data.SqlClient;
using System.Configuration;

namespace B_Project
{
    public partial class LogList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated)
            {  // 팀원(로그인 상태)
                Panel1.Visible = true;
                Panel2.Visible = true;
            }
            else
            {   // 일반인
                Panel1.Visible = true;
                Panel2.Visible = false;
            }
        }



        protected void Button1_Click(object sender, EventArgs e)
        { //[확인] 버튼
            string user = Page.User.Identity.Name;

            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = "insert into B_log(id, name, content) values (@id, @name, @content);";

            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@id", user);
            cmd.Parameters.AddWithValue("@name", TextBox1.Text);
            cmd.Parameters.AddWithValue("@content", TextBox2.Text);

            con.Open();
            cmd.ExecuteNonQuery(); 
            con.Close();

            DataList1.DataBind();
            TextBox2.Text = ""; 
        } 
    }
}