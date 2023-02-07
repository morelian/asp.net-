using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 教务系统web版
{
    public partial class Examplanto : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Labelname.Text = Login.h["Name"].ToString();
            this.Labelno.Text = Login.h["No"].ToString();

            int n = int.Parse(Request.QueryString["term"]);
            if (n == 2)
            {

            }
            else
            {
                this.SqlDataSource1.SelectCommand = $@"SELECT E.No AS '序号',C.Name AS '课程',E.Time AS '时间',E.ClassroomNo AS '教室' FROM tb_Exam AS E
	JOIN tb_TeachingTask AS TT ON TT.No=E.TeachingTaskNo
	JOIN tb_Course AS C ON C.No=TT.CourseNo
	JOIN tb_Trainingprogram AS T ON T.TeachingTaskNo=TT.No WHERE T.MajorNo=
    (SELECT M.No FROM tb_Major AS M WHERE M.No=(SELECT C.MajorNo FROM tb_Student AS S JOIN tb_Class AS C ON C.No=S.ClassNo WHERE S.No='3210707000' ))
     ";
            }
        }
    }
}