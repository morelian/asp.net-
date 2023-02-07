<%@ Page Title="" Language="C#" MasterPageFile="~/Desk.Master" AutoEventWireup="true" CodeBehind="Message.aspx.cs" Inherits="教务系统web版.Message" %>
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
	<div class="Nsb_r_title"><a href="Desk.aspx">首页</a> » 公告留言 » 已收留言</div>
    <asp:GridView ID="gvmessage" runat="server" AutoGenerateColumns="False" DataKeyNames="序号" DataSourceID="SqlDataSource1" OnDataBinding="gvmessage_DataBinding" AllowPaging="True" AllowSorting="True" PageSize="5" CssClass="Nsb_r_list Nsb_table">
        <Columns>
            <asp:BoundField DataField="序号" HeaderText="序号" ReadOnly="True" SortExpression="序号" />
            <asp:BoundField DataField="标题" HeaderText="标题" SortExpression="标题" />
            <asp:BoundField DataField="类型" HeaderText="类型" SortExpression="类型" />
            <asp:BoundField DataField="发送人" HeaderText="发送人" ReadOnly="True" SortExpression="发送人" />
            <asp:BoundField DataField="时间" HeaderText="发送时间" SortExpression="时间" />
            <asp:BoundField DataField=" 状态" HeaderText=" 状态" ReadOnly="True" SortExpression=" 状态" />
            <asp:HyperLinkField DataNavigateUrlFields="序号" DataNavigateUrlFormatString="Messagecontent.aspx?序号={0}" DataTextFormatString="{0:c}" HeaderText="操作" Text="查看" />
            <asp:HyperLinkField DataNavigateUrlFields="序号" DataNavigateUrlFormatString="Reply.aspx?序号={0}" DataTextFormatString="{0:c}" HeaderText="操作" Text="回复" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EduJWConnectionString %>" SelectCommand="SELECT M.No AS '序号',Title AS'标题' ,Type AS '类型' ,ISNULL(F.Name,'无') AS '发送人' , Time AS'时间',IIF(Readed=0,'未读','已读') AS ' 状态' FROM tb_Message AS M LEFT JOIN tb_Faculty AS F ON F.No=M.SenderNo"></asp:SqlDataSource>
        </div>
</asp:Content>
