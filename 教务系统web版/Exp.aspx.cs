using SmartLinli.DatabaseDevelopement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 教务系统web版
{
    public partial class Exp : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Labelname.Text = Login.h["Name"].ToString();
            this.Labelno.Text = Login.h["No"].ToString();
            if (Request.QueryString["项目编号"] is null)
            {

            }
            else
            {
                string n = Request.QueryString["项目编号"];
                SqlHelper sqlHelper = new SqlHelper();


                string sql = $@" DELETE tb_ExperimentSd 
                             WHERE ExperimentNo='{n}' AND StudentNo='{Session["StudentNo"]}'";
                sqlHelper.QuickSubmit(sql);
            }
        }

    }
}