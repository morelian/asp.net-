<%@ Page Title="" Language="C#" MasterPageFile="~/Train.Master" AutoEventWireup="true" CodeBehind="Plan.aspx.cs" Inherits="教务系统web版.Plan" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
     <asp:Label ID="Labelname" runat="server" Text="官祥杰" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label> 
	<asp:Label ID="Labelno" runat="server" Text="(3210707015)" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="Nsb_layout_r">
	<div class="Nsb_r_title"><a href="Desk.aspx">首页</a>» 培养方案 » 指导培养方案</div>
<div style="font-size:20px;text-align:center;">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" CssClass="Nsb_r_list Nsb_table">
        <Columns>
            <asp:BoundField DataField="开课学期" HeaderText="开课学期" SortExpression="开课学期" />
            <asp:BoundField DataField="课程名称" HeaderText="课程名称" SortExpression="课程名称" />
            <asp:BoundField DataField="开课单位" HeaderText="开课单位" SortExpression="开课单位" />
            <asp:BoundField DataField="学分" HeaderText="学分" SortExpression="学分" />
            <asp:BoundField DataField="学时" HeaderText="学时" SortExpression="学时" />
            <asp:BoundField DataField="考核方式" HeaderText="考核方式" SortExpression="考核方式" />
            <asp:BoundField DataField="课程属性" HeaderText="课程属性" SortExpression="课程属性" />
            <asp:BoundField DataField="是否考试" HeaderText="是否考试" ReadOnly="True" SortExpression="是否考试" />
        </Columns>
    </asp:GridView>

    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EduJWConnectionString %>" SelectCommand="SELECT Tm.Name AS '开课学期',C.Name AS '课程名称' , D.Name AS '开课单位' ,C.Credit AS '学分',C.Length AS '学时',ET.Name '考核方式' ,ST.Name AS '课程属性' ,IIF(C.Examwhether=1,'是','否') AS'是否考试'
            FROM tb_Trainingprogram AS TP
	        JOIN tb_Trainee AS T ON T.No=TP.TraineeNo
	        JOIN tb_TeachingTask AS TT ON TT.No=TP.TeachingTaskNo
	        JOIN tb_Book AS B ON  B.No=TT.BookNo
	        JOIN tb_Course AS C ON C.No=TT.CourseNo
	        JOIN tb_Faculty AS F ON F.No=TT.FacultyNo
	        JOIN tb_Term AS Tm ON Tm.No=TT.TermNo
	        JOIN tb_Department AS D ON D.No=F.DepartmentNo
	        JOIN tb_ExamType AS ET ON ET.No=C.ExamTypeNo
	        JOIN tb_StudyType AS ST ON ST.No=C.StudyTypeNo;
          "></asp:SqlDataSource>

    </div>
        </div>
</asp:Content>
