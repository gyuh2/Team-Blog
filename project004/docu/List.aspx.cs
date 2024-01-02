using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace project004.docu
{
    public partial class List : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.User.Identity.IsAuthenticated)//로그인 상태 확인
            {
                Panel1.Visible = true;
            }
            else
            {
                Panel1.Visible = false;
            }
        }

        protected string ShowTitle(string seq, string title)
        {
            string res = "";
            //res = "<a href='Read.aspx?sn=" + seq + "'>" + title + "</a>"; 하이퍼링크 기본 버전

            res = "<a href='Read.aspx?sn=" + seq + "'" + "style='text-decoration:none; color:#213A73;'>" + "<b>" + title + "</b>" + "</a>";
            return res;
        }
    }
}