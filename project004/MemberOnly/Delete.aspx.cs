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
    public partial class Delete : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string seq = Request.QueryString["sn"];

            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = "delete from B_docu where seq =" + seq;
            SqlCommand cmd = new SqlCommand(sql, con);

            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            con.Close();

            Response.Redirect("~/docu/List.aspx");
        }
    }
}