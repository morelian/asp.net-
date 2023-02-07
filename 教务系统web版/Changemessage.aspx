<%@ Page Title="" Language="C#" MasterPageFile="~/Desk.Master" AutoEventWireup="true" CodeBehind="Changemessage.aspx.cs" Inherits="教务系统web版.Changemessage" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
	
  <div class="Nsb_top">
 
    <div style="float:right">        
       <asp:Label ID="Labelname" runat="server" Text="官祥杰" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
		<asp:Label ID="Labelno" runat="server" Text="(3210707015)" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
		&nbsp;&nbsp;&nbsp;&nbsp;
       </div>
             
      
     
   </div>

</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Nsb_layout_r">
	<div class="Nsb_r_title"><a href="Desk.aspx">首页</a> » 个人信息 » 修改个人信息</div>
		
		<table align="center" width="400">
			<form method="post">
			<tr>
				<td>
					<table class="dataTable" cellpadding="2" cellspacing="2" align="center"  border=0 name="Form1_1" id="Form1_1" width="98%">
						<tr >
							<td width=120  align=right>
								登录帐号：
							</td>
							<td  width="232">
								<asp:TextBox ID="TextBoxno" runat="server" ReadOnly="True" Text="3210707001"></asp:TextBox>
							</td>
						</tr>
						<tr >
							<td width=120  align=right>
								真实姓名：
							</td>
							<td width="232">
								<asp:TextBox ID="TextBoxname" runat="server" Text="1号"></asp:TextBox><font color="red">*必填</font>
							</td>
						</tr>
						<tr>
							<td width=120 align=right>
								密码保护问题1：
							</td>
							<td width="232">
								<asp:TextBox ID="TextBoxquestion" runat="server"></asp:TextBox>
							</td>
						</tr>
						<tr >
							<td width=120 align=right>
								回答1：
							</td>
							<td  width="232">
								<asp:TextBox ID="TextBoanswer" runat="server"></asp:TextBox>
							</td>
						
						</tr>
						<tr >
							<td width=120  align=right>
								密码保护问题2：
							</td>
							<td width="232">
								<asp:TextBox ID="TextBoxquestion2" runat="server"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td width=120  align=right>
								回答2：
							</td>
							<td width="232">
								<asp:TextBox ID="TextBoxanswer2" runat="server"></asp:TextBox>
							</td>
						</tr>
						<tr　style="display:none;">
							<td width=120  align=right style="display:none;">
								自定义分页数量：
							</td>
							<td  width="232" style="display:none;">
								<input type="text" name="pageSize" id="pageSize" class="input" maxlength="5"
									value="10"
									size=24 style="width:150px;height:20px"  />
							</td>
						</tr>
						<tr>
							<td width=120  align=right style="display:none;">
								总积分：
							</td>
							<td  width="232" style="display:none;">
								<input type="text" name="zjftxt" id="zjftxt" class="input" maxlength="5" disabled="disabled"
									value=""
									size=24 style="width:150px;height:20px"  />
							</td>
						</tr>
						<tr>
							<td width=120  align=right style="display:none;">
								可用积分：
							</td>
							<td  width="232" style="display:none;">
								<input type="text" name="kyjftxt" id="kyjftxt" class="input" maxlength="5" disabled="disabled"
									value=""
									size=24 style="width:150px;height:20px"  />
							</td>
						</tr>
						<tr>
							<td align="center" colspan="2">
								<br />
								<asp:Button ID="Buttonsave" runat="server" Text="保存" OnClick="Buttonsave_Click" />
							    &nbsp;&nbsp;&nbsp;&nbsp;<input type=hidden name=upt id=upt value="1">
								<asp:Button ID="Buttonreset" runat="server" Text="重置" OnClick="Buttonreset_Click" /><br />
							    <asp:Label ID="Labelmsgl" runat="server" Text="错误" Visible="False" style="color:red;"></asp:Label>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			</form>
		</table>
		
	</div>

</asp:Content>
