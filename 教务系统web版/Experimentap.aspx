<%@ Page Title="" Language="C#" MasterPageFile="~/Practice.Master" AutoEventWireup="true" CodeBehind="Experimentap.aspx.cs" Inherits="教务系统web版.Experimentap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
     <asp:Label ID="Labelname" runat="server" Text="官祥杰" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label> 
	<asp:Label ID="Labelno" runat="server" Text="(3210707015)" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

   

 <div class="Nsb_layout_r">

        <div class="Nsb_r_title"><a href="DEsk.aspx">首页</a>>>实验教学>>实验预约管理(选择学期)</div>
		<!--  
		<select id="sel1" name="sel1">
		   <option value="f2">学号</option>
		   <option value="f3">姓名</option>
		   <option value="f19">修改字段</option>
		   <option value="f18">修改信息</option>
		   <option value="f17">审核状态</option>
		   <option value="f21">修改时间</option>
		</select>&nbsp;
		<select id="flag1" name="flag1">
		   <option value="like">像</option>
		   <option value="=">等于</option>
		   <option value="<>">不等于</option>
		</select>&nbsp;
		<input id="value1" name="value1" style="width:120px;" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		<select id="sel2" name="sel2">
		   <option value="f2">学号</option>
		   <option value="f3">姓名</option>
		   <option value="f19">修改字段</option>
		   <option value="f18">修改信息</option>
		   <option value="f17">审核状态</option>
		   <option value="f21">修改时间</option>
		</select>&nbsp;&nbsp;
		<select id="flag2" name="flag2">
		   <option value="like">像</option>
		   <option value="=">等于</option>
		   <option value="<>">不等于</option>
		</select>&nbsp;&nbsp;
		<input id="value2" name="value2" style="width:120px;" value=""/>&nbsp;&nbsp;&nbsp;&nbsp;
		<input type="button" id="but" name="but" value="查 询" onclick="doSel();"/>
		-->
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="">
                         <br/>
                         <br/>
                         <br/>
                         <br/>
                         <br/>
                         <br/>
            <tr align="center">
                <td align="right" width="40%">学年学期：</td>
                <td align="left">
                <select id="xnxq" name="xnxq" style="width:180px;">
                       <option value='2022-2023-1'>2022-2023-1</option>
                </select>
                </td>
            </tr>
            <tr><td height="20px"></td></tr>
            
            <tr>
               <td colspan="2" align="center">
				   <asp:Button ID="Buttonbooking" runat="server" Text="进入预约" OnClick="Buttonbooking_Click" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
               </td>
            </tr> 
        </table>
	
</div>
</div>
		</div>



</asp:Content>
