using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Project004
{
    public partial class WebForm1 : System.Web.UI.Page
    {
        string dd = "";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
                SqlConnection con = new SqlConnection(conStr);

                string sql = "select sum(price) total from B_pay";
                SqlCommand cmd = new SqlCommand(sql, con);

                con.Open();
                SqlDataReader rd = cmd.ExecuteReader();
                if (rd.Read())
                {
                    string num1 = String.Format("{0:#,###}", rd["total"]);
                    Label1.Text = num1 + "   (원)";
                    string num2 = String.Format("{0:#,###}", 1300000 - int.Parse(rd["total"].ToString()));
                    Label2.Text = num2 + "   (원)";
                }
                rd.Close();
                con.Close();
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {//신청완료 버튼
            dd = Calendar1.SelectedDate.ToString();
            if (dd == "0001-01-01 오전 12:00:00")
            { //날짜를 선택하지 않은 경우
                string str = "<script> alert('날짜를 선택해주세요.');";
                str += " location.href='Outlay.aspx'; </script>";
                Response.Write(str);
            }
            else
            { //날짜 선택되어 정상처리 
                string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
                SqlConnection con = new SqlConnection(conStr);

                string sql = "";
                SqlCommand cmd = null;
                sql = "insert into B_pay(subject,date,price) values(@subject,@date,@price)";
                cmd = new SqlCommand(sql, con);
                cmd.Parameters.AddWithValue("@subject", TextBox1.Text);
                cmd.Parameters.AddWithValue("@price", TextBox2.Text);
                cmd.Parameters.AddWithValue("@date", Calendar1.SelectedDate);


                con.Open();
                int a = cmd.ExecuteNonQuery();
                con.Close();

                if (a > 0)
                {
                    string str = "<script> alert('신청 완료 되었습니다.');";
                    str += " location.href='Outlay.aspx'; </script>";
                    Response.Write(str);
                }
                else
                {
                    string str = "<script> alert('신청 중에 오류가 발생하였습니다');";
                    Response.Write(str);
                }
            }
        }
    }
}