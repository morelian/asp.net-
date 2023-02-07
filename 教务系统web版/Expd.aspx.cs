using SmartLinli.DatabaseDevelopement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 教务系统web版
{
    public partial class Expd : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Labelname.Text = Login.h["Name"].ToString();
            this.Labelno.Text = Login.h["No"].ToString();
            if (Request.QueryString["项目编号"] is  null)
            {

            }
            else
            {
                string n = Request.QueryString["项目编号"];
                SqlHelper sqlHelper = new SqlHelper();
                string sql = $@"SELECT * FROM tb_ExperimentSd 
                        WHERE ExperimentNo='{n}' AND StudentNo='{Session["StudentNo"]}'";
                sqlHelper.QuickRead(sql);
                if (sqlHelper.HasRecord)
                {
                  
                }
                else
                {
                    sql = $@"INSERT INTO tb_ExperimentSd (ExperimentNo,StudentNo)VALUES
                            ('{n}','{Session["StudentNo"]}')";
                    sqlHelper.QuickSubmit(sql);
                   
                }
            }
            //this.Labelname.Text = Login.h["Name"].ToString();
            //this.Labelno.Text = Login.h["No"].ToString();
            this.SqlDataSource1.SelectCommand= $@"SELECT E.No AS '项目编号',E.Name AS '实验项目名称',ET.Name AS '项目类型',E.Length AS '计划学时',L.Name AS '承担实验室',F.Name AS '负责教师'  FROM tb_ExperimentSd AS Ed
                            JOIN tb_Experiment AS E ON E.No=Ed.ExperimentNo
                            JOIN tb_ExperimentType AS ET ON ET.No=E.TypeNo
                            JOIN tb_Lab AS L ON l.No=E.LabNo
                            JOIN tb_Faculty AS F ON F.No=E.FacultyNo
                            WHERE Ed.StudentNo='{Session["StudentNo"]}';
                            ";
        }
    }
}