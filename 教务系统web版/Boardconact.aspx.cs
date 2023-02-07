using SmartLinli.DatabaseDevelopement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 教务系统web版
{
    public partial class Boardconact : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            this.Labelname.Text = Login.h["Name"].ToString();
            this.Labelno.Text = Login.h["No"].ToString();
            int No = int.Parse(Request.QueryString["序号"]);
            SqlHelper sqlHelper1 = new SqlHelper();
            string sql = $@"SELECT 1 FROM tb_ReadBoard WHERE StudentNo='{Login.h["No"].ToString()}' AND BoardNo='{No}';;";
           int num= sqlHelper1.QuickReturn<int>(sql);
            if (num==0) 
            {
                string n = "100001";
                SqlHelper sqlHelper3 = new SqlHelper();
                string t = $@"SELECT TOP 1 * FROM tb_ReadBoard AS M ORDER BY NO DESC";
                sqlHelper3.QuickRead(t);
                if (sqlHelper3.HasRecord)
                {
                    n = sqlHelper3["No"].ToString();
                    n = (int.Parse(n) + 1).ToString();
                }
                string commandText =
                $@"INSERT tb_ReadBoard(No,BoardNo,StudentNo)
            VALUES
            ('{n}','{No}','{Login.h["No"].ToString()}');";
                SqlHelper sqlHelper = new SqlHelper();
                int rowAffected = sqlHelper.QuickSubmit(commandText);
                if (rowAffected != 0)
                {

                }
            }
            sql = $@"SELECT * FROM tb_Board WHERE No='{No}';";
            sqlHelper1.QuickRead(sql);
            if (sqlHelper1.HasRecord)
            {
                TextBoxconcat.Text = sqlHelper1["Content"].ToString();
            }

        }
    }
}