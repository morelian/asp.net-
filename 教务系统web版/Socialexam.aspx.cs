using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 教务系统web版
{
    public partial class Socialexam : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Labelname.Text = Session["Name"].ToString();
            this.Labelno.Text = Session["StudentNo"].ToString();
        }
    }
}