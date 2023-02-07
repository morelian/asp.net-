<%@ Page Title="" Language="C#" MasterPageFile="~/Train.Master" AutoEventWireup="true" CodeBehind="Borrowclassroom.aspx.cs" Inherits="教务系统web版.Borrowclassroom" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
       <asp:Label ID="Labelname" runat="server" Text="官祥杰" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label> 
	<asp:Label ID="Labelno" runat="server" Text="(3210707015)" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Nsb_layout_r">
			<input name="typewhere" id="typewhere" type="hidden" value="jszq" />
			<div class="Nsb_r_title"><a href="Desk.aspx"">首页</a> » 我的课表 » 查询教室借用</div>
			<br/><br/>
			<table width="100%" border="0" cellspacing="0" cellpadding="0" class="no_border_table">
				<tr>
					<td>学期：<select id="xnxqh" name="xnxqh" style="width:130px;" >
							
								<option value="2023-2024-2" >2023-2024-2</option>
							
								<option value="2023-2024-1" >2023-2024-1</option>
							
								<option value="2022-2023-2" >2022-2023-2</option>
							
								<option value="2022-2023-1" selected=true>2022-2023-1</option>
							
								<option value="2021-2022-2" >2021-2022-2</option>
							
								<option value="2021-2022-1" >2021-2022-1</option>
							
								<option value="2020-2021-2" >2020-2021-2</option>
							
								<option value="2020-2021-1" >2020-2021-1</option>
							
								<option value="2019-2020-2" >2019-2020-2</option>
							
								<option value="2019-2020-1" >2019-2020-1</option>
							
								<option value="2018-2019-2" >2018-2019-2</option>
							
								<option value="2018-2019-1" >2018-2019-1</option>
							
								<option value="2017-2018-2" >2017-2018-2</option>
							
								<option value="2017-2018-1" >2017-2018-1</option>
							
								<option value="2016-2017-2" >2016-2017-2</option>
							
								<option value="2016-2017-1" >2016-2017-1</option>
							
								<option value="2015-2016-2" >2015-2016-2</option>
							
								<option value="2015-2016-1" >2015-2016-1</option>
							
								<option value="2014-2015-2" >2014-2015-2</option>
							
								<option value="2014-2015-1" >2014-2015-1</option>
							
								<option value="2013-2014-2" >2013-2014-2</option>
							
								<option value="2013-2014-1" >2013-2014-1</option>
							
								<option value="2012-2013-2" >2012-2013-2</option>
							
								<option value="2012-2013-1" >2012-2013-1</option>
							
								<option value="2011-2012-2" >2011-2012-2</option>
							
								<option value="2011-2012-1" >2011-2012-1</option>
							
								<option value="2010-2011-2" >2010-2011-2</option>
							
								<option value="2010-2011-1" >2010-2011-1</option>
							
								<option value="2009-2010-2" >2009-2010-2</option>
							
								<option value="2009-2010-1" >2009-2010-1</option>
							
								<option value="2008-2009-2" >2008-2009-2</option>
							
								<option value="2008-2009-1" >2008-2009-1</option>
							
								<option value="2007-2008-2" >2007-2008-2</option>
							
								<option value="2007-2008-1" >2007-2008-1</option>
							
								<option value="2006-2007-2" >2006-2007-2</option>
							
								<option value="2006-2007-1" >2006-2007-1</option>
							
								<option value="2005-2006-2" >2005-2006-2</option>
							
								<option value="2005-2006-1" >2005-2006-1</option>
							
								<option value="2004-2005-2" >2004-2005-2</option>
							
								<option value="2004-2005-1" >2004-2005-1</option>
							
						</select></td>
					<td>
						校区：<select name="xqbh" id="xqbh" onchange="var SF_FUNC_cache_flush_tmp=SF_FUNC_cache_flush;onChangeXq(this);SF_FUNC_cache_flush_tmp();"  style="width:100px;"><option value="">-请选择-</option>
							
								<option value="pk">附属龙岩人民医院</option>
							
								<option value="WP">莆田市第一医院</option>
							
								<option value="tU">解放军第一七五医院</option>
							
								<option value="00001">旗山校区</option>
							
								<option value="OD">附属十堰太和医院</option>
							
								<option value="00002">屏山校区</option>
							
								<option value="00003">师大生科院</option>
							
								<option value="00004">附属厦门中医院</option>
							
								<option value="00005">附属厦门第三医院</option>
							
								<option value="00006">附属三明第二医院</option>
							
								<option value="00007">附属三明中西医结合医院</option>
							
								<option value="00008">附属福鼎医院</option>
							
								<option value="00009">联勤保障部队第900医院(原福州总医院)</option>
							
								<option value="00010">武警福建总队医院</option>
							
								<option value="00">附属人民医院</option>
							
								<option value="gD">附属第二人民医院</option>
							
								<option value="hJ">附属康复医院</option>
							
								<option value="e3">其他校区</option>
							
								<option value="RD">附属第三人民医院</option>
							
								<option value="Sg">网络平台</option>
							
						</select>
					</td>
					<td>教学区：<select name="jxqbh" id="jxqbh" style="width:120px;"><option value="">-请选择-</option></select></td>
					<td><nobr>教学楼：<select name="jxlbh" id="jxlbh" onchange="var SF_FUNC_cache_flush_tmp=SF_FUNC_cache_flush;onChangeJxl(this);SF_FUNC_cache_flush_tmp();" style="width:120px;"><option value="">-请选择-</option></select></nobr></td>
					
				</tr>
				<tr>
					<td>教室：<select name="jsbh" id="jsbh" style="width:130px;"><option value="">-请选择-</option></select></td>
					<td>人数：<select style="width:40px;" name="bjfh" id="bjfh">
            	<option value="=">
								=
							</option>
							<option value="&gt;">
								&gt;
							</option>
							<option value="&gt;=">
								&gt;=
							</option>
							<option value="&lt;">
								&lt;
							</option>
							<option value="&lt;=">
								&lt;=
							</option>
							<option value="&lt;&gt;">
								&lt;&gt;
							</option>
             </select>
             <input style="width:75" type="text" name="rnrs" id="rnrs" size="3" maxlength="4" /></td>
             <td>		教室状态：
						<select name="jszt" id="jszt" style="width:120;" size="1" onchange="var SF_FUNC_cache_flush_tmp=SF_FUNC_cache_flush;setStyle();SF_FUNC_cache_flush_tmp();">
							<option value="" selected>
								-请选择-
							</option>
									
									<option value="7">
									Ｌ
									临时调课
									</option>
									
									<option value="6">
									Ｇ
									固定调课
									</option>
									
									<option value="5">
									      
									空闲
									</option>
									
									<option value="4">
									Κ
									考试
									</option>
									
									<option value="3">
									Ｘ
									锁定
									</option>
									
									<option value="2">
									Ｊ
									借用
									</option>
									
									<option value="1">
									◆
									正常上课
									</option>
									
						</select>
						</td>
				  <td>借用院系：<select style="width:120px;">
							<option value="">--请选择--</option>
							
							<option value="XY6d0yTRuK">
									[21000000]实验室管理处
									</option>
							
							<option value="00003">
									[31000000]研究生院
									</option>
							
							<option value="00004">
									[32000000]中医学院
									</option>
							
							<option value="00014">
									[34000000]中西医结合学院
									</option>
							
							<option value="00026">
									[36000000]药学院
									</option>
							
							<option value="00039">
									[38000000]骨伤学院
									</option>
							
							<option value="00042">
									[39000000]针灸学院
									</option>
							
							<option value="00046">
									[40000000]人文与管理学院
									</option>
							
							<option value="00055">
									[42000000]护理学院
									</option>
							
							<option value="00060">
									[43000000]康复医学院
									</option>
							
							<option value="RVSN32mdwG">
									[57020010]龙岩市中医院
									</option>
							
							<option value="tfXHA53vMA">
									[57020014]泉州市正骨医院
									</option>
							
							<option value="DSCxOIC8PJ">
									[57020063]温州市中医院
									</option>
							
							<option value="k1MmSj0AR0">
									[57020067]河南洛阳正骨医院
									</option>
							
							<option value="ClCBALvRsb">
									[57020069]十堰市太和医院
									</option>
							
							<option value="VCHbOzQwO8">
									[57020138]深圳市中医院
									</option>
							
							<option value="eES4ftZ5Ag">
									[57020139]洛阳市中医院
									</option>
							
							<option value="hbaEnlwzn2">
									[57020140]西藏自治区人民医院
									</option>
							
							<option value="apKcj8erHQ">
									[57020141]安徽省中西医结合医院
									</option>
							
							<option value="MRAREVI1Ee">
									[57040086]黑龙江鸡西市中医院
									</option>
							
							<option value="p0nCmlyqks">
									[57040105]宜昌市中医院
									</option>
							
							<option value="dhxcAmKXwa">
									[57040106]柳州市中医院
									</option>
							
							<option value="GLtJQOoqIe">
									[57040107]黔东南州中医院
									</option>
							
							<option value="SNBRLMbcly">
									[57040108]平顶山市中医医院
									</option>
							
							<option value="hNi2747tz5">
									[57040109]贺州市中医医院
									</option>
							
							<option value="M8LpdRBWUa">
									[57040110]江油市中医医院
									</option>
							
							<option value="31geaFvEPC">
									[57040111]宿迁市中医院
									</option>
							
							<option value="eGloLURZJs">
									[57040112]贵州中医药大学第一附属医院
									</option>
							
							<option value="VuBQShIUoS">
									[57040113]山西中医药大学附属医院
									</option>
							
							<option value="k5E9eflwCR">
									[57040114]开封市中心医院
									</option>
							
							<option value="9U1ekidBXH">
									[57040115]云南省中医医院
									</option>
							
							<option value="zNeL9QLbz0">
									[57040116]柳州市中医医院
									</option>
							
							<option value="GK4aFpjTfH">
									[57040117]山东中医药大学第二附属医院
									</option>
							
							<option value="iegRmilfv2">
									[57040118]昆明市中医医院
									</option>
							
							<option value="jBvnewPZcc">
									[57040120]深圳市中医院
									</option>
							
							<option value="WD8vyTz5ce">
									[57040121]西藏自治区人民医院
									</option>
							
							<option value="c2bsjuJLAD">
									[57040122]安徽省中西医结合医院
									</option>
							
							<option value="kd3kUsUqGK">
									[58000000]机关党委
									</option>
							
							<option value="G3FUgMl7Hy">
									[58010000]研究生
									</option>
							
							<option value="NJ3WtiXI1y">
									[58020000]进修生
									</option>
							
						</select></td>		
				</tr>
			<tr>
				<td><nobr>周次：
						<select style="width:55px;" name="zc" size="1">
							<option value="">-请选择-</option>
							<option value="1">
								第1周
							</option>
							<option value="2">
								第2周
							</option>
							<option value="3">
								第3周
							</option>
							<option value="4">
								第4周
							</option>
							<option value="5">
								第5周
							</option>
							<option value="6">
								第6周
							</option>
							<option value="7">
								第7周
							</option>
							<option value="8">
								第8周
							</option>
							<option value="9">
								第9周
							</option>
							<option value="10">
								第10周
							</option>
							<option value="11">
								第11周
							</option>
							<option value="12">
								第12周
							</option>
							<option value="13">
								第13周
							</option>
							<option value="14">
								第14周
							</option>
							<option value="15">
								第15周
							</option>
							<option value="16">
								第16周
							</option>
							<option value="17">
								第17周
							</option>
							<option value="18">
								第18周
							</option>
							<option value="19">
								第19周
							</option>
							<option value="20">
								第20周
							</option>
							<option value="21">
								第21周
							</option>
							<option value="22">
								第22周
							</option>
							<option value="23">
								第23周
							</option>
							<option value="24">
								第24周
							</option>
							<option value="25">
								第25周
							</option>
							<option value="26">
								第26周
							</option>
							<option value="27">
								第27周
							</option>
							<option value="28">
								第28周
							</option>
							<option value="29">
								第29周
							</option>
							<option value="30">
								第30周
							</option>							
						</select>
						至
						<select style="width:55px;" name="zc2" size="1">
							<option value="">-请选择-</option>
							<option value="1">
								第1周
							</option>
							<option value="2">
								第2周
							</option>
							<option value="3">
								第3周
							</option>
							<option value="4">
								第4周
							</option>
							<option value="5">
								第5周
							</option>
							<option value="6">
								第6周
							</option>
							<option value="7">
								第7周
							</option>
							<option value="8">
								第8周
							</option>
							<option value="9">
								第9周
							</option>
							<option value="10">
								第10周
							</option>
							<option value="11">
								第11周
							</option>
							<option value="12">
								第12周
							</option>
							<option value="13">
								第13周
							</option>
							<option value="14">
								第14周
							</option>
							<option value="15">
								第15周
							</option>
							<option value="16">
								第16周
							</option>
							<option value="17">
								第17周
							</option>
							<option value="18">
								第18周
							</option>
							<option value="19">
								第19周
							</option>
							<option value="20">
								第20周
							</option>
							<option value="21">
								第21周
							</option>
							<option value="22">
								第22周
							</option>
							<option value="23">
								第23周
							</option>
							<option value="24">
								第24周
							</option>
							<option value="25">
								第25周
							</option>
							<option value="26">
								第26周
							</option>
							<option value="27">
								第27周
							</option>
							<option value="28">
								第28周
							</option>
							<option value="29">
								第29周
							</option>
							<option value="30">
								第30周
							</option>								
						</select>
						</nobr>
						</td>
					<td><nobr>
						星期：<select style="width:40px;" name="xq" size="1">
							<option value="">--请选择--</option>
							<option value="1">
								一
							</option>
							<option value="2">
								二
							</option>
							<option value="3">
								三
							</option>
							<option value="4">
								四
							</option>
							<option value="5">
								五
							</option>
							<option value="6">
								六
							</option>
							<option value="7">
								日
							</option>
				  </select>至
				  <select style="width:40px;" name="xq2" size="1">
							<option value="">--请选择--</option>
							<option value="1">
								一
							</option>
							<option value="2">
								二
							</option>
							<option value="3">
								三
							</option>
							<option value="4">
								四
							</option>
							<option value="5">
								五
							</option>
							<option value="6">
								六
							</option>
							<option value="7">
								日
							</option>
				  </select>
				  </nobr>
					</td>
					<td>
						<nobr>节次：
					<select name="jc" style="width:50px;" size="1">
							<option value="">-请选择-</option>
							<option value="01">
								第一节
							</option>
							<option value="02">
								第二节
							</option>
							<option value="03">
								第三节
							</option>
							<option value="04">
								第四节
							</option>
							<option value="05">
								第五节
							</option>
							<option value="06">
								第六节
							</option>
							<option value="07">
								第七节
							</option>
							<option value="08">
								第八节
							</option>
							<option value="09">
								第九节
							</option>
							<option value="10">
								第十节
							</option>
							<option value="11">
								第十一节
							</option>
							<option value="12">
								第十二节
							</option>															
				  </select>
						至
					<select name="jc2" style="width:50px;" size="1">
							<option value="">-请选择-</option>
							<option value="01">
								第一节
							</option>
							<option value="02">
								第二节
							</option>
							<option value="03">
								第三节
							</option>
							<option value="04">
								第四节
							</option>
							<option value="05">
								第五节
							</option>
							<option value="06">
								第六节
							</option>
							<option value="07">
								第七节
							</option>
							<option value="08">
								第八节
							</option>
							<option value="09">
								第九节
							</option>
							<option value="10">
								第十节
							</option>
							<option value="11">
								第十一节
							</option>
							<option value="12">
								第十二节
							</option>															
				  </select>	
				  </nobr>
					</td>
			<td><nobr>
				<asp:Button ID="Buttonselect" runat="server" Text="查询" /> </nobr></td>
			</tr>
			</table>
		
		
	<table border="0" width="100%" style="height: 1000px;" cellspacing="0" cellpadding="0"  id="Table2">
			<tr>
				<td height="100%" id="frmtop" >
					<iframe  id="fcenter" name="fcenter"
						style="height:100%; VISIBILITY: inherit; WIDTH: 100%"></iframe>
				</td>
			</tr>
	</table>	
		
	</div>

</asp:Content>
