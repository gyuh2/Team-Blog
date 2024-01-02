using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO; //사진 파일 건드릴경우 using

namespace Project004
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (DropDownList1.SelectedIndex == -1)
                {
                    Image1.Visible = false;
                }
            }
        }

        protected void DropDownList1_DataBound(object sender, EventArgs e)
        {
            DropDownList1.Items.Insert(0, new ListItem("-선택하세요-", "-1"));
        }

        protected void Button3_Click(object sender, EventArgs e)
        { //조회하기 버튼
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = "select * from B_function where fName = @fName";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@fName", DropDownList1.SelectedValue);

            con.Open();
            SqlDataReader rd = cmd.ExecuteReader();
            if (rd.Read())
            {
                Label1.Text = DropDownList1.SelectedValue;
                Label2.Text = rd["fContent"].ToString();
                Image1.Visible = true;
                Image1.ImageUrl = "/Fimages/" + rd["photo"].ToString();
                Image1.DataBind();
            }
            rd.Close();
            con.Close();

        }
    }
}