<%@ Page Title="" Language="C#" MasterPageFile="~/Exam.Master" AutoEventWireup="true" CodeBehind="Examplan.aspx.cs" Inherits="教务系统web版.Examplan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .auto-style1 {
            height: 20px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
     <asp:Label ID="Labelname" runat="server" Text="官祥杰" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label> 
	<asp:Label ID="Labelno" runat="server" Text="(3210707015)" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
        <div class="Nsb_layout_r">
	
		<div class="Nsb_r_title"><a href="/web/1/http/1/210.34.74.244/fjzyyjsxsd/framework/main.jsp"">首页</a> » 我的考试 » 考试安排查询</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="no_border_table">
			<tr>
				<th width="40%" align="right" class="auto-style1">学年学期：</th>
				<td class="auto-style1">
					<asp:DropDownList ID="Dropterm" runat="server" DataSourceID="SqlDataSource1" DataTextField="Name" DataValueField="Name" style="width: 170px;"></asp:DropDownList>
				    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EduJWConnectionString %>" SelectCommand="SELECT [Name] FROM [tb_Term]"></asp:SqlDataSource>
				</td>
			</tr>
			<tr>
				<th width="40%" align="right">学期类别：</th>
				<td>
					<asp:DropDownList ID="Droptype" runat="server" style="width: 170px;">
                        <asp:ListItem>期末</asp:ListItem>
                    </asp:DropDownList>
				</td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<asp:Button ID="Buttonselect" runat="server" Text="查询" OnClick="Buttonselect_Click" />
				</td>
			</tr>
		</table>
	</form>
	</div>
</div>
</asp:Content>
