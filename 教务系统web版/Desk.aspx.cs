using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 教务系统web版
{
    public partial class Desk : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Labelname2.Text = Login.h["Name"].ToString();
            this.Labelno2.Text = Login.h["No"].ToString();
            this.Labelname.Text = Login.h["Name"].ToString();
            this.Labelno.Text = Login.h["No"].ToString();
        }
    }
}