<%@ Page Title="" Language="C#" MasterPageFile="~/Student.Master" AutoEventWireup="true" CodeBehind="Score.aspx.cs" Inherits="教务系统web版.Score" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="body1" runat="server">
         <div class="Nsb_top">
 
    <div style="float:right">        
       <asp:Label ID="Labelname" runat="server" Text="官祥杰" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
		<asp:Label ID="Labelno" runat="server" Text="(3210707015)" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
		&nbsp;&nbsp;&nbsp;&nbsp;
       </div>
         </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   
<div class="Nsb_layout_r">
	<div class="Nsb_r_title"><a href="Desk.aspx">首页</a>» 考试成绩 » 课程成绩查询</div>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" class="no_border_table">
			<tr>
				<th width="40%" align="right">开课时间：</th>
				<td>
					<select id="kksj" name="kksj" style="width: 170px;">
						<option value="">---请选择---</option>
						
						<option value="2023-2024-2">2023-2024-2</option>
						
						<option value="2023-2024-1">2023-2024-1</option>
						
						<option value="2022-2023-2">2022-2023-2</option>
						
						<option value="2022-2023-1">2022-2023-1</option>
						
						<option value="2021-2022-2">2021-2022-2</option>
						
						<option value="2021-2022-1">2021-2022-1</option>
						
						<option value="2020-2021-2">2020-2021-2</option>
						
						<option value="2020-2021-1">2020-2021-1</option>
						
						<option value="2019-2020-2">2019-2020-2</option>
						
						<option value="2019-2020-1">2019-2020-1</option>
						
						<option value="2018-2019-2">2018-2019-2</option>
						
						<option value="2018-2019-1">2018-2019-1</option>
						
						<option value="2017-2018-2">2017-2018-2</option>
						
						<option value="2017-2018-1">2017-2018-1</option>
						
						<option value="2016-2017-2">2016-2017-2</option>
						
						<option value="2016-2017-1">2016-2017-1</option>
						
						<option value="2015-2016-2">2015-2016-2</option>
						
						<option value="2015-2016-1">2015-2016-1</option>
						
						<option value="2014-2015-2">2014-2015-2</option>
						
						<option value="2014-2015-1">2014-2015-1</option>
						
						<option value="2013-2014-2">2013-2014-2</option>
						
						<option value="2013-2014-1">2013-2014-1</option>
						
						<option value="2012-2013-2">2012-2013-2</option>
						
						<option value="2012-2013-1">2012-2013-1</option>
						
						<option value="2011-2012-2">2011-2012-2</option>
						
						<option value="2011-2012-1">2011-2012-1</option>
						
						<option value="2010-2011-2">2010-2011-2</option>
						
						<option value="2010-2011-1">2010-2011-1</option>
						
						<option value="2009-2010-2">2009-2010-2</option>
						
						<option value="2009-2010-1">2009-2010-1</option>
						
						<option value="2008-2009-2">2008-2009-2</option>
						
						<option value="2008-2009-1">2008-2009-1</option>
						
						<option value="2007-2008-2">2007-2008-2</option>
						
						<option value="2007-2008-1">2007-2008-1</option>
						
						<option value="2006-2007-2">2006-2007-2</option>
						
						<option value="2006-2007-1">2006-2007-1</option>
						
						<option value="2005-2006-2">2005-2006-2</option>
						
						<option value="2005-2006-1">2005-2006-1</option>
						
						<option value="2004-2005-2">2004-2005-2</option>
						
						<option value="2004-2005-1">2004-2005-1</option>
						
					</select>
				</td>
			</tr>
			<tr>
				<th width="40%" align="right">课程性质：</th>
				<td><select id="kcxz" name="kcxz" style="width: 170px;">
						<option value="">---请选择---</option>
						
						<option value="02">公共基础课</option>
						
						<option value="03">专业基础课</option>
						
						<option value="04">专业课</option>
						
						<option value="05">专业选修课</option>
						
						<option value="06">公共选修课</option>
						
						<option value="07">外校交流课程</option>
						
						<option value="08">海外交流课程</option>
						
						<option value="09">指定选修课</option>
						
						<option value="10">OSCE</option>
						
						<option value="11">通识教育课</option>
						
						<option value="12">学科基础课</option>
						
						<option value="13">专业教育课</option>
						
					</select></td>
			</tr>
			
			<tr>
				<th width="40%" align="right">课程名称：</th>
				<td><input type="text" id="kcmc" name="kcmc" value="" style="width: 165px;"/></td>
			</tr>
			<tr>
				<th width="40%" align="right">显示方式：</th>
				<td><select id="xsfs" name="xsfs" style="width: 170px;">
						<option value="all">显示全部成绩</option>
						<option value="max">显示最好成绩</option>
					</select></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					  <asp:Button ID="Buttonselect" runat="server" Text="查询" OnClick="Buttonselect_Click" />
				</td>
			</tr>
		</table>
  
</div>

    


</asp:Content>
