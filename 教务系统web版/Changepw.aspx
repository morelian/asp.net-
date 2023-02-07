<%@ Page Title="" Language="C#" MasterPageFile="~/Desk.Master" AutoEventWireup="true" CodeBehind="Changepw.aspx.cs" Inherits="教务系统web版.Changepw" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
	      <div class="Nsb_top">
 
    <div style="float:right">        
       <asp:Label ID="Labelname" runat="server" Text="官祥杰" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
		<asp:Label ID="Labelno" runat="server" Text="(3210707015)" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
		&nbsp;&nbsp;&nbsp;&nbsp;
       </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    
	<div class="Nsb_layout_r">
	<div class="Nsb_r_title"><a href="/web/1/http/1/210.34.74.244/fjzyyjsxsd/framework/main.jsp">首页</a> » 个人信息 » 修改密码</div>
		
		<input type="hidden" name='id' id='id' value=''>
		<table align="center" width="400">
			<tr>
				<td>
					<table class="dataTable" cellpadding="2" cellspacing="2" align="center"  border=0 name="Form1_1" id="Form1_1" width="98%">
						<tr >
							<td width=90 align=right>
								登陆帐号：
							</td>
							
								<td  width="322">
									<asp:Label ID="Labelno2" runat="server" Text="3210707015"></asp:Label>
									
								</td>
							
						</tr>
						<tr>
							<td width=90 align=right>
								旧密码：
							</td>
							<td  width="322">
								<asp:TextBox ID="TextBoxoldpw" runat="server"></asp:TextBox>
								<font color="red">*必填</font>
							</td>
						</tr>
						<tr >
							<td width=90 align=right>
								新密码：
							</td>
							<td  width="322">
								<asp:TextBox ID="TextBoxnewpw" runat="server"></asp:TextBox>
								<font color="red">*必填</font>
									
							</td>
						
						</tr>
						<tr >
							<td width=90 align=right>
								确认新密码：
							</td>
							<td width="322">
								<asp:TextBox ID="TextBoxnewpw2" runat="server"></asp:TextBox>
								<font color="red">*必填</font>
							</td>
						</tr>
						<tr>
							<td  style="height: 80px;padding-left: 80px;" colspan="2">
								<asp:Button ID="Buttonsave" runat="server" Text="保存" OnClick="Buttonsave_Click" />
							    &nbsp;&nbsp;&nbsp;&nbsp;<input type=hidden name=upt id=upt value="1">
								<asp:Button ID="Buttonreset" runat="server" Text="重置" OnClick="Buttonreset_Click" />
							  <br />  <asp:Label ID="Labelmsgl" runat="server" Text="错误" Visible="False" style="color:red;"></asp:Label>
							</td>
						</tr>
						<tr><td align="center" colspan="2">
						<font color="red">密码至少8位且必须包含数字、字母</font>
						</td>
						</tr>
					</table>
				</td>
			</tr>
		</table>
	
	</div>
	</div>
<br />

</asp:Content>
