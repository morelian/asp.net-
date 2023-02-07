<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Calender.aspx.cs" Inherits="教务系统web版.WebForm1" %>

<html xmlns="http://www.w3.org/1999/xhtml">


<head id="headerid1">
	
<base target='_self'>
	<title>教学周历查看</title>	
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">
    <link href="Css/blue.css" rel="stylesheet" />
    <link href="Css/common.css" rel="stylesheet" />
    <link href="Css/workstation.css" rel="stylesheet" />
</head>


<body>



<form runat="server" >



<div class="Nsb_pw">
  <div class="Nsb_top">
    <div class="Nsb_top_logo"><table border="0" cellpadding="0" cellspacing="0"><tr><td height="75" valign="middle"><img style="display;" id="imgLogo" src="Image/index_02.png" /></td></tr></table></div>
    <div style="float:right">        
       <asp:Label ID="Labelname" runat="server" Text="官祥杰" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
		<asp:Label ID="Labelno" runat="server" Text="(3210707015)" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
		&nbsp;&nbsp;&nbsp;&nbsp;
       </div>
             
      
     
   </div>
</div>
<div class="Nsb_menu_pw" style="background-color:lightskyblue">
  <div class="Nsb_pw">
    <div id="divFirstMenuClass" class="Nsb_menu menu_cn" =>
      <ul>         
         <li  title="首页">
         	<a class="Nsb_menu_li_h" id="homepage" href="Desk.aspx"><asp:Image ID="Image1" runat="server" ImageUrl="~/Image/Nsb_menu_h.gif" /></a>
         </li>
         
         	<li title="我的桌面">
         		<a id="calender_user_schedule" href="Calender.aspx">我的桌面</a>
         	</li>
         
         	<li title="学籍成绩">
         		<a id="calender_user_schedule" href="Score.aspx">学籍成绩</a>
         	</li>
         
         	<li title="培养管理">
         		<a id="calender_user_schedule" href="Plan.aspx">培养管理</a>
         	</li>
         
         	<li title="考试报名">
         		<a id="calender_user_schedule" href="Examplan.aspx">考试报名</a>
         	</li>
         
         	<li title="实践环节">
         		<a id="calender_user_schedule" href="Experimentap.aspx">实践环节</a>
         	</li>
         
         	<li title="教学评价">
         		<a id="calender_user_schedule" href="Evaluate.aspx">教学评价</a>
         	</li>
         
      </ul>
    </div>
  </div>
</div>
<div class="Nsb_pw">
	
		






  
<div id="LeftMenu1_divChildMenu" class="Nsb_layout_l Nsb_l_list">
	<div class="Nsb_l_list_top"></div>
	
			<h4 class="exam_user_exam">公告留言</h4>
			<ul>			
	
				<li><a  href="message.aspx">已收公告</a></li>
	
				<li><a  href="Message.aspx">已收留言</a></li>
	
			</ul>
	
			<h4 class="exam_user_exam">个人信息</h4>
			<ul>			
	
				<li><a  href="Changemessage.aspx">修改个人信息</a></li>
	
				<li><a  href="Changepw.aspx">修改密码</a></li>
	
			</ul>
	
			<h4 class="exam_user_exam">教学周历</h4>
			<ul>			
	
				<li><a <%--class='Nsb_l_list_now'--%> href="Calender.aspx">教学周历查看</a></li>
	
			</ul>
	
</div>
	
		
	<div class="Nsb_layout_r">
		<iframe style="display:none;" name="ifrmPrint" id="ifrmPrint"></iframe>
		<form action="" name="FormPrint" id="FormPrint" method="post"></form>
 		
 			<br/>
	        <div class="Nsb_r_title"><a href="Desk.aspx">首页</a> » 教学周历» 教学周历查看</div>
    	    <div align="center"> 
				<center>
					<font size="4">&nbsp;2022-2023&nbsp;学年&nbsp;第&nbsp;1&nbsp;学期&nbsp;&nbsp;教学周历</font>&nbsp;&nbsp;&nbsp;&nbsp;		
					<select id="Selectterm" style="width: 170px">
						<option>2022-2023-2</option>
						<option>2022-2023-1</option>
						<option>2021-2022-2</option>
						<option>2021-2022-1</option>

					</select>
					&nbsp;&nbsp;<input type="button" value="打 印" onclick="var SF_FUNC_cache_flush_tmp=SF_FUNC_cache_flush;print(this);SF_FUNC_cache_flush_tmp();" class="button"/>
				</center>
        	</div>        	
		　	<table id="kbtable" border="1" width="100%" cellspacing="0" cellpadding="0" class="Nsb_r_list Nsb_table" style="table-layout:fixed;overflow:hidden;">
				<tr>
					<th width="80" height="38" align="center" border=0>
						<image src="Image/rq.png"/>
					</th>					
					<th width="80" height="48" align="center">星期一</th>
					<th width="80" height="48" align="center">星期二</th>
					<th width="80" height="48" align="center">星期三</th>
					<th width="80" height="48" align="center">星期四</th>
					<th width="80" height="48" align="center">星期五</th>
					<th width="80" height="48" align="center">星期六</th>
					<th width="80" height="48" align="center">星期日</th>
					<th width="110" height="48" align="center" nowrap>备注</th>
				</tr> 
				<tr height='28'><td>周历编制</td><td colspan='8' align='left'></td>
			</table>
		<asp:Calendar ID="Calendar1" runat="server" CssClass="Nsb_r_list Nsb_table"></asp:Calendar>
	
	</div>
</div>
<br/>

<div id="Footer1_divCopyright" class="Nsb_pw" style="display:;">
  <div class="Nsb_rights">Copyright (C) 福建省沐兰有限公司 2023-2033 All Rights Reserved 闽ICP 备12345678号</div>
</div>



	</form>
</body>
</html>
<script language="javascript" sf_script="1">if(typeof(SF_FUNC_Page_End)=='function')SF_FUNC_Page_End();</script>
