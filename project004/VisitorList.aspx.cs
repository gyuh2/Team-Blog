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
    public partial class VisitorList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        protected string GetContent(object content)
        {
            string c = content.ToString();
            c = c.Replace("\n", "<br />");
            return c;
        }
        protected void Button5_Click(object sender, EventArgs e)
        { // [확인] 버튼
            string user = TextBox1.Text;

            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString; 
            SqlConnection con = new SqlConnection(conStr);

            string sql = "Insert into Visitor(name, content) Values (@name, @content)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@name", user);
            cmd.Parameters.AddWithValue("@content", TextBox2.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            DataList1.DataBind();
            TextBox1.Text = "";
            TextBox2.Text = "";
        }

        protected void DataList1_DeleteCommand(object source, DataListCommandEventArgs e)
        {
            string select = e.CommandArgument.ToString();

            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = "Delete from Visitor Where seq=@seq";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@seq", select);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            DataList1.DataBind(); 
        }

        protected void DataList1_ItemDataBound(object sender, DataListItemEventArgs e)
        {
            LinkButton btn = (LinkButton)e.Item.FindControl("LinkButton1");
            if (Page.User.Identity.IsAuthenticated)
                btn.Visible = true;
            else
                btn.Visible = false;
        }
    }
}