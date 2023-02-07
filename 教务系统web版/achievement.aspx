<%@ Page Title="" Language="C#" MasterPageFile="~/Exam.Master" AutoEventWireup="true" CodeBehind="achievement.aspx.cs" Inherits="教务系统web版.achievement" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
     <asp:Label ID="Labelname" runat="server" Text="官祥杰" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label> 
	<asp:Label ID="Labelno" runat="server" Text="(3210707015)" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

       
<div class="Nsb_layout_r">
	<div class="Nsb_r_title"><a href="Desk.aspx">首页</a>» 考试成绩 » 课程成绩查询 » 查询列表</div>
<div style="font-size:20px;text-align:center;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="课程编号" DataSourceID="SqlDataSource1"  CssClass="Nsb_r_list Nsb_table" OnSelectedIndexChanged="GridView1_SelectedIndexChanged">
        <Columns>
            <asp:BoundField DataField="学期" HeaderText="学期" SortExpression="学期"  />
            <asp:BoundField DataField="课程编号" HeaderText="课程编号" ReadOnly="True" SortExpression="课程编号"  />
            <asp:BoundField DataField="课程名称" HeaderText="课程名称" SortExpression="课程名称"  />
            <asp:BoundField DataField="成绩" HeaderText="成绩" SortExpression="成绩" />
            <asp:BoundField DataField="时长" HeaderText="时长" SortExpression="时长" />
            <asp:BoundField DataField="学分" HeaderText="学分" SortExpression="学分"  />
            <asp:BoundField DataField="类型" HeaderText="类型" SortExpression="类型"/>
            <asp:BoundField DataField="属性" HeaderText="属性" SortExpression="属性"  />
        </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EduJWConnectionString %>" SelectCommand="SELECT [学期], [课程编号], [课程名称], [成绩], [时长], [学分], [类型], [属性] FROM [ScoreView] WHERE ([StudentNo] = @StudentNo)">
    <SelectParameters>
        <asp:SessionParameter DefaultValue="3210707001" Name="StudentNo" SessionField="StudentNo" Type="String" />
    </SelectParameters>
    </asp:SqlDataSource>
</div>

    </div>
</asp:Content>
