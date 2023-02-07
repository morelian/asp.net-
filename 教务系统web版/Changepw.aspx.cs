using SmartLinli.DatabaseDevelopement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text.RegularExpressions;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 教务系统web版
{
    public partial class Changepw : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            
            this.Labelno2.Text = Login.h["No"].ToString();
            this.Labelname.Text = Login.h["Name"].ToString();
            this.Labelno.Text = Login.h["No"].ToString();
        }

        protected void Buttonsave_Click(object sender, EventArgs e)
        {

            SqlHelper sqlHelper1 = new SqlHelper();
            string sql = $@"Use EduJW
                            SELECT*FROM tb_Student AS S WHERE S.No='{this.Labelno2.Text}'AND S.PassWord=HASHBYTES('MD5', '{this.TextBoxoldpw.Text.Trim()}');";
            sqlHelper1.QuickRead(sql);
            if (sqlHelper1.HasRecord)
            {
                if (this.TextBoxnewpw2.Text == this.TextBoxnewpw.Text)
                {


                    if (Regex.IsMatch(this.TextBoxnewpw2.Text, "[0-9]") && (Regex.IsMatch(this.TextBoxnewpw2.Text, "[a-z]") || Regex.IsMatch(this.TextBoxnewpw2.Text, "[A-Z]")) && this.TextBoxnewpw2.Text.Length >= 8)
                    {
                        string commandText = $"update tb_Student set PassWord=HASHBYTES('MD5','{this.TextBoxnewpw2.Text.Trim()}') where No='{this.Labelno2.Text}'";
                        SqlHelper sqlHelper = new SqlHelper();
                        int rowAffected = sqlHelper.QuickSubmit(commandText);


                        if (rowAffected > 0)
                        {
                            this.Labelmsgl.Text = "修改完成！"; this.Labelmsgl.Visible = true;

                        }
                        else
                        {
                            this.Labelmsgl.Text = "修改失败！"; this.Labelmsgl.Visible = true;
                        }



                    }
                    else
                    {
                        this.Labelmsgl.Text = "密码设置格式有误请重新输入！"; this.Labelmsgl.Visible = true;
                     
                        this.TextBoxnewpw2.Text = "";
                        this.TextBoxnewpw.Text = "";

                    }
                }
                else
                {
                    this.Labelmsgl.Text = "两次密码输入不同，请重新输入！"; this.Labelmsgl.Visible = true;
                   
                    this.TextBoxnewpw.Text = "";
                    this.TextBoxnewpw.Text = "";
                }

            }
            else
            {
                this.Labelmsgl.Text = "旧密码错误！";this.Labelmsgl.Visible = true;
            }
        }

        protected void Buttonreset_Click(object sender, EventArgs e)
        {
            this.TextBoxoldpw.Text = "";
            this.TextBoxnewpw.Text = "";
            this.TextBoxnewpw2.Text = "";
        }
    }
}