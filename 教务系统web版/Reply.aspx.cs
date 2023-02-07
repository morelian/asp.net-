using SmartLinli.DatabaseDevelopement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 教务系统web版
{
    public partial class Reply : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
           
            this.Labelname.Text = Login.h["Name"].ToString();
            this.Labelno.Text = Login.h["No"].ToString();
        }
        public SqlHelper sqlHelper = new SqlHelper();
        protected void Buttonsend_Click(object sender, EventArgs e)
        {
            int No = int.Parse(Request.QueryString["序号"]);
            string commandText2 = $@"SELECT * FROM tb_Message AS M  where RecipientNo='{Login.h["No"].ToString()}' 
                AND No='{No}';";
            sqlHelper.QuickRead(commandText2);
            if (sqlHelper.HasRecord)
            { }
            string n = "1111";
            SqlHelper sqlHelper3 = new SqlHelper();
            string t = $@"SELECT TOP 1 * FROM tb_Message AS M ORDER BY NO DESC";
            sqlHelper3.QuickRead(t);
            if (sqlHelper3.HasRecord)
            {
                n = sqlHelper3["No"].ToString();
                n = (int.Parse(n) + 1).ToString();
            }
            if (long.Parse(this.sqlHelper["SenderNo"].ToString()) > 2000000000)
            {
                string commandText =
                    $@"INSERT INTO tb_Message(No,Title,Type,SenderNo,Time,Content,Readed,RecipientNo)
					VALUES
					('{n}','{Login.h["Name"].ToString()}的回复','回复','{Login.h["No"].ToString()}','{DateTime.Now}','{this.TextBoxcontent.Text.Trim()}','0','{this.sqlHelper["SenderNo"]}');";
                SqlHelper sqlHelper2 = new SqlHelper();
                int rowAffected = sqlHelper2.QuickSubmit(commandText);
                if (rowAffected == 1)
                {
                   this.Labelmgls.Text= "发送成功！";
                }
                else
                {
                  this.Labelmgls.Text=  "发送失败！";
                }
            }
            else
            {
                string commandText =
                                   $@"INSERT INTO tb_Message(No,Title,Type,SenderNo,Time,Content,Readed,RecipientNo)
					VALUES
					('{n}','{Login.h["Name"].ToString()}的回复','回复','{Login.h["No"].ToString()}','{DateTime.Now}','{this.TextBoxcontent.Text.Trim()}','0','{this.sqlHelper["SenderNo"]}');";
                SqlHelper sqlHelper2 = new SqlHelper();
                int rowAffected = sqlHelper2.QuickSubmit(commandText);
                if (rowAffected == 1)
                {
                    this.Labelmgls.Text = "发送成功！";
                }
                else
                {
                    this.Labelmgls.Text = "发送失败！";
                }
            }
        }
    }
}