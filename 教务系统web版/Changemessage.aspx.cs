using SmartLinli.DatabaseDevelopement;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace 教务系统web版
{
    public partial class Changemessage : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            this.Labelname.Text = Session["Name"].ToString();
            this.Labelno.Text = Session["StudentNo"].ToString();
            this.TextBoxno.Text = Session["StudentNo"].ToString();
            this.TextBoxname.Text = Session["Name"].ToString();
        }

        protected void Buttonsave_Click(object sender, EventArgs e)
        {
            string commandText = $@"	OPEN SYMMETRIC KEY sk_EduJW_ForDataCrypto												

        DECRYPTION BY ASYMMETRIC KEY ak_EduJW_ForSymKeyCrypto
            WITH PASSWORD = '1qaz@WSX';
            UPDATE tb_Student

        SET
            Securityissue = '{this.TextBoxquestion.Text}?'
            , Answer = ENCRYPTBYKEY(KEY_GUID('sk_EduJW_ForDataCrypto'), '{this.TextBoanswer.Text}')
            , Securityissue2 = '{this.TextBoxquestion2.Text}?'
            , Answer2 = ENCRYPTBYKEY(KEY_GUID('sk_EduJW_ForDataCrypto'), '{this.TextBoxanswer2.Text}')
            where No ='{Session["StudentNo"].ToString()}'

              CLOSE SYMMETRIC KEY sk_EduJW_ForDataCrypto;";
            SqlHelper sqlHelper = new SqlHelper();
            int rowAffected = sqlHelper.QuickSubmit(commandText);
            if (rowAffected > 0) this.Labelmsgl.Text = "保存成功!";
            else this.Labelmsgl.Text = "保存失败!";this.Labelmsgl.Visible = true;
        }

        protected void Buttonreset_Click(object sender, EventArgs e)
        {
            this.TextBoanswer.Text = "";
            this.TextBoxquestion.Text = "";
            this.TextBoxanswer2.Text = "";
            this.TextBoxquestion2.Text = "";
        }
    }
}