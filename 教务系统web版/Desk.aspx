<%@ Page Title="" Language="C#" MasterPageFile="~/Index.Master" AutoEventWireup="true" CodeBehind="Desk.aspx.cs" Inherits="教务系统web版.Desk" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style>

    body {color:#FFF;font-size: 14px;font-family: "微软雅黑";}
ul,dl,dd,h1,h2,h3,h4,h5,h6,form,p,{ padding:0; margin:0;}
font{ color:#FFF;}
.wap{position:relative;height:450px; width:910px;margin:0 auto;}
.block1{width:265px; height:287px; background:#09619F;}
.block1 img{position:absolute;top:92px;left:28px;}
.block1tex{position:absolute;top:169px;left:33px;}
.block1text{position:absolute;top:172px;left:135px;width: 150px;height:73px;line-height:21px;}
.block1pc{background:#2271A9;position:absolute;width:90px;height:117px;left: 141px;top:31px;}
.block1pc img{position:absolute;width:90px;height:117px;left:0;top:0;}

.block2{position:absolute;width:153px;height:287px;background:#4FB5C7;left:270px;top:0px;}
.block2 img{position:absolute;top:92px;left:43px;}
.block2tex{position:absolute;top:164px;left:48px;}

.block3{position:absolute;width:173px;height:141px;background:#1978D8;left:428px;top:0px;}
.block3 img{position:absolute;top:29px;left:38px;}
.block3tex{position:absolute;top:91px;left:58px;}

.block4{position:absolute;width:173px;height:141px;background:#90A8E3;left:428px;top:146px;}
.block4 img{position:absolute;top:21px;left:48px;}
.block4tex{position:absolute;top:91px;left:57px;}

.block5{position:absolute;width:304px;height:141px;background:#DB6987;right:0px;top:0px;}
.block5 img{position:absolute;top:28px;left:21px;}
.block5tex{position:absolute;top:96px;left:35px;}
.block5text{line-height:21px;position:absolute;top:30px;left:112px;width: 172px;height:87px;}

.block6{position:absolute;width:304px;height:141px;background:#8E7AAA;right:0px;top:146px;}
.block6 img{position:absolute;top:12px;left:21px;}
.block6tex{position:absolute;top:96px;left:35px;}
.block6text{line-height:21px;position:absolute;top:30px;left:112px;width: 172px;height:87px;}

.block7{position:absolute;width:130px;height:138px;background:#187D9A;top:292px;}
.block7 img{position:absolute;top:26px;left:30px;}
.block7tex{position:absolute;top:94px;left:36px;}

.block8{position:absolute;width:130px;height:138px;background:#A0CF41;left:135px;top:292px;}
.block8 img{position:absolute;top:26px;left:30px;}
.block8tex{position:absolute;top:94px;left:35px;}

.block9{position:absolute;width:153px;height:138px;background:#EAAF76;left:270px;top:292px;}
.block9 img{position:absolute;top:26px;left:41px;}
.block9tex{position:absolute;top:94px;left:46px;}

.block10{position:absolute;width:173px;height:138px;background:#88BAD9;left:428px;top:292px;}
.block10 img{position:absolute;top:22px;left:51px;}
.block10tex{position:absolute;top:94px;left:53px;}

.block11{position:absolute;width:149px;height:138px;background:#B69CCC;left:606px;top:292px;}
.block11 img{position:absolute;top:19px;left:45px;}
.block11tex{position:absolute;top:94px;left:47px;}

.block12{position:absolute;width:149px;height:138px;background:#09619F;right:0px;top:292px;}
.block12 img{position:absolute;top:26px;left:45px;}
.block12tex{position:absolute;top:94px;left:46px;}
a {color:#FFFFFF;}

</style>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="body1" runat="server">
    <asp:Label ID="Labelname" runat="server" Text="官祥杰" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label> 
	<asp:Label ID="Labelno" runat="server" Text="(3210707015)" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <br /> <br /> <br />
    <div class="wap">
 <div class="block1">
    <div>
    	<img src="Image/tp1.png" width="72" height="64" />
    </div>
    <div class="block1tex">个人信息</div>
    <div class="block1text"> 
		<asp:Label ID="Labelname2" runat="server" Text="姓名：官祥杰"></asp:Label><br/> 
		<asp:Label ID="Labelno2" runat="server" Text="学号：3210707015"></asp:Label><br/>
    </div>
    <div class="block1pc" >
		<asp:Image ID="studentimage" runat="server" ImageUrl="~/Image/zwtp.gif" style=" border:0;"/>
    	
   	</div>

  </div>
  
  
	  <a href="SelectCourse.aspx">
	  	<div class="block2"> 
	  		<div>
	  			<img src="Image/tp2.png" width="65" height="65" />
	  		</div>
			<div class="block2tex">选课中心</div>
		</div>
	  </a>
  
  
  
  
	  <a href="Evaluate.aspx">
	  	<div class="block3"> 
	  		<div>
	  			<img src="Image/tp3.png" width="92" height="55" />
	  		</div>
			<div class="block3tex">学生评教</div>
		</div>
	  </a>
  
  
  
  
	  <a href="plan.aspx">
	  	<div class="block4"> 
	  		<div>
	  			<img src="Image/tp4.png" width="71" height="62" />
	  		</div>
			<div class="block4tex">培养方案</div>
		</div>
	  </a>
  
  
  
	  <a href="Message.aspx">
	  	<div class="block5"> 
	  		<div>
	  			<img src="Image/tp5.png" width="80" height="57" />
	  		</div>
			<div class="block5tex">已收留言</div>
			<div class="block5text" id="grxx"></div>
		</div>
	  </a>
  
  
  
  
	  <a href="Board.aspx">
	  	<div class="block6"> 
	  		<div>
	  			<img src="Image/tp6.png" width="67" height="79" />
	  		</div>
			<div class="block6tex">已收公告</div>
			<div class="block6text" id="ggtz"></div>
		</div>
	  </a>
  
  
  
  
	  <a href="Score.aspx">
	  	<div class="block7"> 
	  		<div>
	  			<img src="Image/tp7.png" width="66" height="59" />
	  		</div>
			<div class="block7tex">课程成绩查询</div> 
		</div>
	  </a>
  
  
  
	  <a href="Calender.aspx">
	  	<div class="block8"> 
	  		<div>
	  			<img src="Image/tp8.png" width="64" height="60" />
	  		</div>
			<div class="block8tex">教学周历</div> 
		</div>
	  </a>
  
  
  
	  <a href="Examplan.aspx">
	  	<div class="block9"> 
	  		<div>
	  			<img src="Image/tp9.png" width="66" height="66" />
	  		</div>
			<div class="block9tex">授课计划查询</div> 
		</div>
	  </a>
  
  
  
	  <a href="Score.aspx">
	  	<div class="block10"> 
	  		<div>
	  			<img src="Image/tp10.png" width="71" height="69" />
	  		</div>
			<div class="block10tex">考试成绩</div> 
		</div>
	  </a>
  
  
  
	  <a href="Studentcard.aspx">
	  	<div class="block11"> 
	  		<div>
	  			<img src="Image/tp11.png" width="62" height="73" />
	  		</div>
			<div class="block11tex">学籍卡片</div> 
		</div>
	  </a>
  
 
   
	  <a href="Socialexam.aspx">
	  	<div class="block12"> 
	  		<div>
	  			<img src="Image/tp12.png" width="55" height="67" />
	  		</div>
			<div class="block12tex">社会考试报名</div> 
		</div>
	  </a>
   
  
</div>
             

     <br />
     
    <div class="Nsb_rights">Copyright (C) 福建省沐兰有限公司 2023-2033 All Rights Reserved 闽ICP 备12345678号</div>

  
    <div></div>
</asp:Content>
