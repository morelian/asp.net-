using SmartLinli.DatabaseDevelopement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 教务系统web版
{
    public partial class Messagecontent : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Labelname.Text = Session["Name"].ToString();
            this.Labelno.Text = Session["StudentNo"].ToString();

            int No= int.Parse(Request.QueryString["序号"]);
            string commandText = $@"
                    update tb_Message set Readed=1 where RecipientNo='{3210707001}' 
                AND   No='{No}'";
            SqlHelper sqlHelper = new SqlHelper();
            int rowAffected = sqlHelper.QuickSubmit(commandText);
            string commandText2 = $@"
                        SELECT * FROM tb_Message  where RecipientNo='{3210707001}' 
                AND No='{No}';";

            sqlHelper.QuickRead(commandText2);
            if (sqlHelper.HasRecord)
            {
                this.TextBoxcontent.Text = sqlHelper["Content"].ToString();
            }
        }
    }
}