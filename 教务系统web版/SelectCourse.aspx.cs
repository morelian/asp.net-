using SmartLinli.DatabaseDevelopement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 教务系统web版
{
    public partial class SelectCourse : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Labelname.Text = Login.h["Name"].ToString();
            this.Labelno.Text = Login.h["No"].ToString();
            this.GridView1.Columns[1].Visible = false;
            if (Request.QueryString["序号"] is null)
            {

            }
            else
            {
                SqlHelper h = new SqlHelper();
                SqlHelper h2 = new SqlHelper();
                string n = Request.QueryString["序号"];
                string s = $@"SELECT 1 FROM tb_SelectedCourse AS S WHERE 
                S.StudentNo='{Session["StudentNo"]}' AND S.SelectCourseNo='{n}'";
                SqlHelper sqlHelper4 = new SqlHelper();
                int num = sqlHelper4.QuickReturn<int>(s);
                if (num != 1)
                {
                    int a = 0, b = 0;
                    string n1 = $@"SELECT COUNT(SD.SelectCourseNo) AS '已选人数'
				FROM  tb_TeachingTask AS TT 
	              JOIN tb_Course AS C ON C.No=TT.CourseNo
	               JOIN tb_Faculty AS F ON F.No=TT.FacultyNo
	              JOIN tb_Department AS D ON D.No=F.DepartmentNo
	               JOIN tb_SelectCourse AS SC ON SC.TeachingTaskNo=TT.No
				LEFT	JOIN tb_SelectedCourse AS SD ON SC.No=SD.SelectCourseNo
	               WHERE SC.MajorNo=
       (SELECT C.MajorNo FROM tb_Class AS C WHERE C.No=(SELECT S.ClassNo FROM tb_Student AS S WHERE S.No='{Session["StudentNo"]}'))
         AND   SC.StartTime<=GETDATE() AND  SC.EndTime>=GETDATE()  AND SD.SelectCourseNo='{n}'
		 GROUP BY SD.SelectCourseNo,SC.No,C.Name,F.Name,D.Name,C.Credit,C.Length,SC.Numbers";
                    a = h.QuickReturn<int>(n1);
                    string n2 = $@"SELECT  SC.Numbers AS '限选人数'
					FROM  tb_TeachingTask AS TT 
	                JOIN tb_Course AS C ON C.No=TT.CourseNo
	                JOIN tb_Faculty AS F ON F.No=TT.FacultyNo
	                JOIN tb_Department AS D ON D.No=F.DepartmentNo
	                JOIN tb_SelectCourse AS SC ON SC.TeachingTaskNo=TT.No
				LEFT	JOIN tb_SelectedCourse AS SD ON SC.No=SD.SelectCourseNo
	                WHERE SC.MajorNo=
        (SELECT C.MajorNo FROM tb_Class AS C WHERE C.No=(SELECT S.ClassNo FROM tb_Student AS S WHERE S.No='{Session["StudentNo"]}'))
         AND   SC.StartTime<=GETDATE() AND  SC.EndTime>=GETDATE()  AND SC.No='{n}'
		 GROUP BY SD.SelectCourseNo,SC.No,C.Name,F.Name,D.Name,C.Credit,C.Length,SC.Numbers";
                    b = h2.QuickReturn<int>(n2);
                    if (a >= b)
                    {

                    }
                    else
                    {


                        string commandText = $@"
                     INSERT INTO tb_SelectedCourse (StudentNo,SelectCourseNo)VALUES
                    ('{Session["StudentNo"]}','{n}')
                        ";
                        SqlHelper sqlHelper = new SqlHelper();
                        int rowAffected = sqlHelper.QuickSubmit(commandText);

                        if (rowAffected != 0)
                        {

                        }
                    }
                }
            }
            if (Request.QueryString["选课号"] is null)
            {

            }
            else
            {
                string n = Request.QueryString["选课号"];
                string commandText = $@"
                    DELETE tb_SelectedCourse WHERE StudentNo ='{Session["StudentNo"]}' AND SelectCourseNo='{n}'
                        ";
                SqlHelper sqlHelper = new SqlHelper();
                int rowAffected = sqlHelper.QuickSubmit(commandText);
            }

            this.SqlDataSource1.SelectCommand = $@"SELECT  SC.No AS '序号',C.Name AS '课程名称',F.Name AS '授课教师' ,D.Name AS '授课单位', C.Credit AS '学分', C.Length AS '时长' ,SC.Numbers AS '限选人数',COUNT(SD.SelectCourseNo) AS '已选人数'
					FROM  tb_TeachingTask AS TT 
	                JOIN tb_Course AS C ON C.No=TT.CourseNo
	                JOIN tb_Faculty AS F ON F.No=TT.FacultyNo
	                JOIN tb_Department AS D ON D.No=F.DepartmentNo
	                JOIN tb_SelectCourse AS SC ON SC.TeachingTaskNo=TT.No
				LEFT	JOIN tb_SelectedCourse AS SD ON SC.No=SD.SelectCourseNo
	                WHERE SC.MajorNo=
        (SELECT C.MajorNo FROM tb_Class AS C WHERE C.No=(SELECT S.ClassNo FROM tb_Student AS S WHERE S.No='{Session["StudentNo"]}'))
         AND   SC.StartTime<=GETDATE() AND  SC.EndTime>=GETDATE()  
		 GROUP BY SD.SelectCourseNo,SC.No,C.Name,F.Name,D.Name,C.Credit,C.Length,SC.Numbers
      ;";
            this.SqlDataSource2.SelectCommand = $@"SELECT SdC.SelectCourseNo AS '选课号',C.Name AS '课程名称' FROM  tb_TeachingTask AS TT 
                     JOIN tb_Course AS C ON C.No=TT.CourseNo
                     JOIN tb_Faculty AS F ON F.No=TT.FacultyNo
                     JOIN tb_Department AS D ON D.No=F.DepartmentNo
                     JOIN tb_SelectCourse AS SC ON SC.TeachingTaskNo=TT.No
                       JOIN tb_SelectedCourse AS SdC ON SdC.SelectCourseNo=SC.No
                     WHERE SC.MajorNo=
            (SELECT C.MajorNo FROM tb_Class AS C WHERE C.No=(SELECT S.ClassNo FROM tb_Student AS S WHERE S.No='{Session["StudentNo"]}'))
            AND SdC.StudentNo ='{Session["StudentNo"]}';";
        }
    }
}