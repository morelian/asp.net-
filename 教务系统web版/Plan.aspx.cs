using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 教务系统web版
{
    public partial class Plan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Labelname.Text = Login.h["Name"].ToString();
            this.Labelno.Text = Login.h["No"].ToString();
            this.SqlDataSource1.SelectCommand = $@"SELECT Tm.Name AS '开课学期',C.Name AS '课程名称' , D.Name AS '开课单位' ,C.Credit AS '学分',C.Length AS '学时',ET.Name '考核方式' ,ST.Name AS '课程属性' ,IIF(C.Examwhether=1,'是','否') AS'是否考试'
            FROM tb_Trainingprogram AS TP
	        JOIN tb_Trainee AS T ON T.No=TP.TraineeNo
	        JOIN tb_TeachingTask AS TT ON TT.No=TP.TeachingTaskNo
	        JOIN tb_Book AS B ON  B.No=TT.BookNo
	        JOIN tb_Course AS C ON C.No=TT.CourseNo
	        JOIN tb_Faculty AS F ON F.No=TT.FacultyNo
	        JOIN tb_Term AS Tm ON Tm.No=TT.TermNo
	        JOIN tb_Department AS D ON D.No=F.DepartmentNo
	        JOIN tb_ExamType AS ET ON ET.No=C.ExamTypeNo
	        JOIN tb_StudyType AS ST ON ST.No=C.StudyTypeNo
            WHERE	TP.MajorNo=(SELECT C.MajorNo FROM tb_Class AS C WHERE C.No=(SELECT S.ClassNo FROM tb_Student AS S WHERE S.No='{Session["StudentNo"].ToString()}'));";

        }
    }
}