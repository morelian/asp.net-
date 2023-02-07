using SmartLinli.DatabaseDevelopement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 教务系统web版
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        public static SqlHelper h = new SqlHelper();
        protected void Buttonlogin_Click(object sender, EventArgs e)
        {
            string commandText =
                $@"SELECT *
					FROM tb_Student
					WHERE No='{this.TextBoxid.Text.Trim()}' AND PassWord=HASHBYTES('MD5', '{this.TextBoxpw.Text.Trim()}');";
           

           h.QuickRead(commandText);
            if (h.HasRecord)
            {
                Session["StudentNo"] = TextBoxid.Text.Trim();
                Session["Name"] = h["Name"].ToString();
                Response.Redirect("Desk.aspx");

            }
            else
            {
                this.Labelmgls.Visible = true;
            }

        }
    }
}