<%@ Page Title="" Language="C#" MasterPageFile="~/Exam.Master" AutoEventWireup="true" CodeBehind="Examplanto.aspx.cs" Inherits="教务系统web版.Examplanto" %>
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
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="序号" DataSourceID="SqlDataSource1" CssClass="Nsb_r_list Nsb_table">
        <Columns>
            <asp:BoundField DataField="序号" HeaderText="序号" ReadOnly="True" SortExpression="序号" />
            <asp:BoundField DataField="课程" HeaderText="课程" SortExpression="课程" />
            <asp:BoundField DataField="时间" HeaderText="时间" SortExpression="时间" />
            <asp:BoundField DataField="教室" HeaderText="教室" SortExpression="教室" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EduJWConnectionString %>" SelectCommand="SELECT E.No AS '序号',C.Name AS '课程',E.Time AS '时间',E.ClassroomNo AS '教室' FROM tb_Exam AS E
	JOIN tb_TeachingTask AS TT ON TT.No=E.TeachingTaskNo
	JOIN tb_Course AS C ON C.No=TT.CourseNo
	JOIN tb_Trainingprogram AS T ON T.TeachingTaskNo=TT.No "></asp:SqlDataSource>
    </div>
        </div>

</asp:Content>
