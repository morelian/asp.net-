<%@ Page Title="" Language="C#" MasterPageFile="~/Evaluate.Master" AutoEventWireup="true" CodeBehind="Evaluate.aspx.cs" Inherits="教务系统web版.Evaluate1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
     <asp:Label ID="Labelname" runat="server" Text="官祥杰" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label> 
	<asp:Label ID="Labelno" runat="server" Text="(3210707015)" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Nsb_layout_r">
	<form action="" name="Form1" id="Form1" method="post">
		<div class="Nsb_r_title"><a href="/web/1/http/1/210.34.74.244/fjzyyjsxsd/framework/main.jsp"">首页</a> » 教学评价 » 学生评价</div>
		<table width="100%" border="0" cellspacing="0" cellpadding="0" class="Nsb_r_list Nsb_table">
            <tr>
                <th width="6%" class="Nsb_r_list_thb" scope="col">序号</th>
                <th class="Nsb_r_list_thb" scope="col">学年学期</th>
                <th class="Nsb_r_list_thb" scope="col">评价分类</th>
                <th class="Nsb_r_list_thb" scope="col">评价批次</th>
                <th class="Nsb_r_list_thb" scope="col">开始时间</th>
                <th class="Nsb_r_list_thb" scope="col">结束时间</th>
                <th class="Nsb_r_list_thb" scope="col">操作</th>
            </tr>
                                 
            <tr>
          		<td>1</td>
                <td>2022-2023-1</td>
                <td>学生评教</td>
				<td>2022-2023-1学生评教</td>
				<td>2022-12-21 00:00:00</td>
				<td>2023-05-10 00:00:00</td>
				<td >
				 
				        
				[<a href="Studentevaluate.aspx" title="点击进入评价">教学评价</a>]
	 
				
				</td>
            </tr>
             
        </table>		
		<div id="PagingControl1_divOuterClass" class="Nsb_r_list_tdfy"> <div class="Nsb_r_list_fy" ><div class="Nsb_r_list_fy2"><span>转到</span><input name="pageIndex" type="text" value="1" id="pageIndex" onkeyup="var SF_FUNC_cache_flush_tmp=SF_FUNC_cache_flush;keyUpNum(this);SF_FUNC_cache_flush_tmp();"  onafterpaste="var SF_FUNC_cache_flush_tmp=SF_FUNC_cache_flush;keyUpNum(this);SF_FUNC_cache_flush_tmp();" onkeydown="var SF_FUNC_cache_flush_tmp=SF_FUNC_cache_flush;paginationKeyDown();SF_FUNC_cache_flush_tmp();"/> </div><div class="Nsb_r_list_fy3"> <span> 共1页&nbsp;1条</span></div><div class="Nsb_r_list_fy4"><a id="PagingControl1_btnPrevPage" disabled="disabled" title='第一页'></a><a id="PagingControl1_btnNextPage" disabled="disabled" title='最后一页'></a></div></div></div>		
	</form>
	</div>
</div>
</asp:Content>
