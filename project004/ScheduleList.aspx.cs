using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data; // 추가
using System.Data.SqlClient;
using System.Configuration;

namespace B_Blog
{
    public partial class ScheduleList : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Text = Calendar1.TodaysDate.ToShortDateString();  // 날짜 Label에 현재 날짜가 기본으로 표시

            if (!IsPostBack)
            {
                if (Page.User.Identity.IsAuthenticated)
                {  // 팀원(로그인 상태)
                    Panel3.Visible = true;
                    Panel4.Visible = true;
                }
                else
                {   // 일반인
                    Panel3.Visible = true;
                    Panel4.Visible = false;
                }
                Calendar1.SelectedDate = Calendar1.TodaysDate;
                ShowToDoList();
            }
        }

        private void ShowToDoList()
        {
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = "Select * from B_schedule where tDate=@tDate";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@tDate", Calendar1.SelectedDate.ToShortDateString());

            con.Open();
            DataList1.DataSource = cmd.ExecuteReader();
            DataList1.DataSourceID = null;  //안전 코드
            DataList1.DataBind();
            con.Close();
        }

        protected void Calendar1_DayRender(object sender, DayRenderEventArgs e)
        {
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = "Select * from B_schedule where tDate=@tDate";

            SqlDataAdapter adt = new SqlDataAdapter(sql, con);
            adt.SelectCommand.Parameters.AddWithValue("@tDate", e.Day.Date.ToShortDateString());

            DataSet ds = new DataSet();
            adt.Fill(ds, "B_SCHEDULE");

            if (ds.Tables[0].Rows.Count > 0)
            {
                string title = null;
                Label lbl = null;

                for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
                {
                    title = ds.Tables[0].Rows[i]["content"].ToString();
                    lbl = new Label();

                    lbl.Text = "<br/>" + title;
                    lbl.Font.Size = FontUnit.XSmall;
                    lbl.Font.Name = "noto Sans KR";
                    lbl.ForeColor = System.Drawing.Color.DarkBlue;

                    e.Cell.Controls.Add(lbl);
                }
            }


        }

        protected void Calendar1_SelectionChanged(object sender, EventArgs e)
        {
            Session["day"] = Calendar1.SelectedDate;
            Session["month"] = Calendar1.VisibleDate;
            Label2.Text = Calendar1.SelectedDate.ToShortDateString();

            ShowToDoList();
        }

        protected void Calendar1_VisibleMonthChanged(object sender, MonthChangedEventArgs e)
        {
            Session["month"] = Calendar1.VisibleDate;
        }

        protected void Button5_Click(object sender, EventArgs e)
        {  // [등록] 버튼
            string id = Page.User.Identity.Name;
            string conStr = ConfigurationManager.ConnectionStrings["master"].ConnectionString;
            SqlConnection con = new SqlConnection(conStr);

            string sql = "Insert into B_schedule(id, tDate, content) Values(@id, @tDate, @content)";
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.Parameters.AddWithValue("@id", id);
            cmd.Parameters.AddWithValue("@tDate", Calendar1.SelectedDate.ToShortDateString());
            cmd.Parameters.AddWithValue("@content", TextBox1.Text);

            con.Open();
            cmd.ExecuteNonQuery();
            con.Close();

            ShowToDoList(); // 화면 갱신
            TextBox1.Text = "";
        }
    }
}