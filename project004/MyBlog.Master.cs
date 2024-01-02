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


namespace B_Project
{
    public partial class MyBlog : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            if (Page.User.Identity.IsAuthenticated)
            {
                Label1.Text = "로그인됨.";
                Panel1.Visible = false;
                Panel2.Visible = true;
                Panel3.Visible = true;

                string id = Page.User.Identity.Name;
                string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
                SqlConnection con = new SqlConnection(conStr);

                string sql = "select * from B_user where id = @id";
                SqlCommand cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@id", id);

                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    Image2.Visible = true;
                    Image2.ImageUrl = "~/UserImages/" + rd["photo"].ToString();
                    Label1.Text = rd["part"].ToString()+ " : ";
                    Label2.Text = rd["name"].ToString();
                }
                rd.Close();
                con.Close();
            }
            else
            {
                Panel1.Visible = true;
                Panel2.Visible = false;
                Panel3.Visible = false;
                Image2.Visible = false; //로그인 안되어 있을 경우 유저 사진 뜨지 않도록
            }
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Response.Redirect(Request.UrlReferrer.ToString());
            //현재 페이지로 다시 로드해라 

        }
    }
}