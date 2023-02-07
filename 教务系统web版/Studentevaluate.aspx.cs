using SmartLinli.DatabaseDevelopement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 教务系统web版
{
    public partial class Studentevaluate : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Labelname.Text = Login.h["Name"].ToString();
            this.Labelno.Text = Login.h["No"].ToString();

            this.SqlDataSource1.SelectCommand = $@"Select 
    SS.TeachingTaskNo AS '序号',Ce.Name AS '课程名称',F.Name AS '教师',D.Name AS '单位',SS.FaculatyScore AS'教师评分', SS.StudentComment AS '学生评语' 
    from tb_Evaluate AS E
	JOIN tb_TeachingTask AS TT ON TT.No=E.TeachingTaskNo
	JOIN tb_StudentScore AS SS ON SS.TeachingTaskNo=TT.No
	JOIN tb_Faculty AS F ON F.No=TT.FacultyNo
	JOIN tb_Department AS D ON D.No=F.DepartmentNo
	JOIN tb_Course AS Ce ON Ce.No=TT.CourseNo WHERE StudentNo='{Session["StudentNo"].ToString()}'";
        }



        protected void GridView1_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
           
        }

        protected void GridView1_RowUpdated(object sender, GridViewUpdatedEventArgs e)
        {
          
        }
    }
    
}