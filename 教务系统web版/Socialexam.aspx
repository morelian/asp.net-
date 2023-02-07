<%@ Page Title="" Language="C#" MasterPageFile="~/Exam.Master" AutoEventWireup="true" CodeBehind="Socialexam.aspx.cs" Inherits="教务系统web版.Socialexam" %>
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

		<div class="Nsb_r_title">
		<a href="/web/1/http/1/210.34.74.244/fjzyyjsxsd/framework/main.jsp"">首页</a> » 成绩管理 » 社会考试报名</div>　
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Nsb_r_list Nsb_table">
            <tr> 
            	<th class="Nsb_r_list_thb" scope="col">序号</th>
            	<th class="Nsb_r_list_thb" scope="col">考级课程名称</th>
                <th class="Nsb_r_list_thb" scope="col">考级等级名称</th>
                <th class="Nsb_r_list_thb" scope="col">考试时间</th>
                <th class="Nsb_r_list_thb" scope="col">报名金额</th>
                <th class="Nsb_r_list_thb" scope="col">操作</th>
            </tr>
          	
        </table>		 
        <br/>
        <div style="text-align: left">已报名课程</div>
        <table width="100%" border="0" cellspacing="0" cellpadding="0" class="Nsb_r_list Nsb_table">
            <tr> 
                <th class="Nsb_r_list_thb" scope="col">考级等级名称</th>
                <th class="Nsb_r_list_thb" scope="col">考级课程名称</th>
                <th class="Nsb_r_list_thb" scope="col">考级时间</th>
                <th class="Nsb_r_list_thb" scope="col">报名金额</th>
                <th class="Nsb_r_list_thb" scope="col">考级准考证号</th>
                <th class="Nsb_r_list_thb" scope="col">原准考证号</th>
                <th class="Nsb_r_list_thb" scope="col">报名验证码</th>
                <th class="Nsb_r_list_thb" scope="col">是否缴费</th>
                <th class="Nsb_r_list_thb" scope="col">缴费状态原因</th>
                <th class="Nsb_r_list_thb" scope="col">操作</th>
            </tr>
            
        </table>	

	</div>

<div id="showDiv" style="background-color: #999900; border: 1px double #000000; text-align: center; width: 220px; height: 60px; display: none; position: absolute;">
	<table cellpadding="0" cellspacing="0" width="100%" height="100%">
		<tr>
			<td height="60px;" style="color: #000000; font-size: 14px;">正在拼命加载中，请稍后...</td>
		</tr>
	</table>
</div>

</asp:Content>
