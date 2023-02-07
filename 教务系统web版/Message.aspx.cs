using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 教务系统web版
{
    public partial class Message : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Labelname.Text = Session["Name"].ToString();
            this.Labelno.Text = Session["StudentNo"].ToString();

            this.SqlDataSource1.SelectCommand = $@"SELECT M.No AS '序号',Title AS'标题' ,Type AS '类型' ,ISNULL(F.Name,'无') AS '发送人'
                , Time AS'时间',IIF(Readed=0,'未读','已读') AS ' 状态'  FROM tb_Message AS M
			LEFT JOIN tb_Faculty AS F ON F.No=M.SenderNo WHERE RecipientNo='{3210707001}';";
            build();
        }
        private void build()
        {
   //         SqlConnection sqlConnection = new SqlConnection();
   //         sqlConnection.ConnectionString =
   //             "Server=(local);Database=EduJW;Integrated Security=sspi";
   //         SqlCommand sqlCommand = new SqlCommand();
   //         sqlCommand.Connection = sqlConnection;
   //         sqlCommand.CommandText = $@"SELECT M.No AS '序号',Title AS'标题' ,Type AS '类型' ,ISNULL(F.Name,'无') AS '发送人'
   //             , Time AS'时间',IIF(Readed=0,'未读','已读') AS ' 状态'  FROM tb_Message AS M
			//LEFT JOIN tb_Faculty AS F ON F.No=M.SenderNo WHERE RecipientNo='3210707001';";
   //         SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
   //         sqlDataAdapter.SelectCommand = sqlCommand;
   //         DataTable BoardTable = new DataTable();
   //         sqlConnection.Open();
   //         sqlDataAdapter.Fill(BoardTable);
   //         //this.dcboard.Columns.Clear();
   //         this.gvmessage.DataSource = BoardTable;

   //         ButtonField button = new ButtonField();
   //         //button.Text = "查看";
   //         //button.HeaderText = "操作";
   //         //this.gvmessage.Columns.Add(button);
   //         HyperLinkField link = new HyperLinkField();
   //         link.Text = "查看";
   //         link.HeaderText = "操作";
   //         this.gvmessage.Columns.Add(link);
         
   //         this.gvmessage.DataBind();
        }

        protected void gvmessage_DataBinding(object sender, EventArgs e)
        {
            this.SqlDataSource1.SelectCommand = $@"SELECT M.No AS '序号',Title AS'标题' ,Type AS '类型' ,ISNULL(F.Name,'无') AS '发送人'
                , Time AS'时间',IIF(Readed=0,'未读','已读') AS ' 状态'  FROM tb_Message AS M
			LEFT JOIN tb_Faculty AS F ON F.No=M.SenderNo WHERE RecipientNo='{3210707001}';";
        }
    }
}