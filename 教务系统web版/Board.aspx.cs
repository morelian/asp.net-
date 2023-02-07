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
    public partial class Board : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Labelname.Text = Session["Name"].ToString();
            this.Labelno.Text = Session["StudentNo"].ToString();

            build();
        }
        private void build()
        {
   //         SqlConnection sqlConnection = new SqlConnection();
   //         sqlConnection.ConnectionString =
   //             "Server=(local);Database=EduJW;Integrated Security=sspi";
   //         SqlCommand sqlCommand = new SqlCommand();
   //         sqlCommand.Connection = sqlConnection;
   //         sqlCommand.CommandText = $@"SELECT M.No AS '序号',Title AS'标题' ,M.Content AS '内容',Type AS '类型' ,ISNULL(S.Name,'无') AS '发送人'
   //             , Time AS'时间',IIF(RB.BoardNo IS  NULL,'未读','已读') AS ' 状态'  FROM tb_Board AS M
			//LEFT JOIN tb_Faculty AS S ON S.No=SenderNo
			//LEFT JOIN tb_ReadBoard AS RB ON RB.BoardNo=M.No ;";
   //         SqlDataAdapter sqlDataAdapter = new SqlDataAdapter();
   //         sqlDataAdapter.SelectCommand = sqlCommand;
   //         DataTable BoardTable = new DataTable();
   //         sqlConnection.Open();
   //         sqlDataAdapter.Fill(BoardTable);
   //         this.gvboard.DataSource = BoardTable;
   //         this.gvboard.DataBind();
            //DataGridViewButtonColumn btn = new DataGridViewButtonColumn();
            //btn.Name = "操作";
            //btn.HeaderText = "操作";
            //btn.DefaultCellStyle.NullValue = "查看";
            //dcboard.Columns.Add(btn);
        }

        protected void gvboard_RowCommand(object sender, GridViewCommandEventArgs e)
        {

            
        }

  

        protected void Buttonlook_Click(object sender, EventArgs e)
        {
        
                
        }

        protected void gvboard_SelectedIndexChanged(object sender, EventArgs e)
        {

        }
    }
}