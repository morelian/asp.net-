<%@ Page Title="" Language="C#" MasterPageFile="~/Train.Master" AutoEventWireup="true" CodeBehind="SelectSourse.aspx.cs" Inherits="教务系统web版.SelectSourse" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
              <asp:Label ID="Labelname" runat="server" Text="官祥杰" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label> 
	<asp:Label ID="Labelno" runat="server" Text="(3210707015)" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Nsb_layout_r">
	<div class="Nsb_r_title"><a href="Desk.aspx">首页</a>>>选课管理 » 学生选课中心</div>
<div style="font-size:20px;text-align:center;">
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="Nsb_r_list Nsb_table" DataKeyNames="序号" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="序号" HeaderText="序号" ReadOnly="True" SortExpression="序号" />
            <asp:BoundField DataField="课程名称" HeaderText="课程名称" SortExpression="课程名称" />
            <asp:BoundField DataField="授课教师" HeaderText="授课教师" SortExpression="授课教师" />
            <asp:BoundField DataField="授课单位" HeaderText="授课单位" SortExpression="授课单位" />
            <asp:BoundField DataField="学分" HeaderText="学分" SortExpression="学分" />
            <asp:BoundField DataField="时长" HeaderText="时长" SortExpression="时长" />
            <asp:BoundField DataField="限选人数" HeaderText="限选人数" SortExpression="限选人数" />
            <asp:BoundField DataField="已选人数" HeaderText="已选人数" ReadOnly="True" SortExpression="已选人数" />
            <asp:HyperLinkField DataNavigateUrlFields="序号" DataNavigateUrlFormatString="SelectCourse.aspx?序号={0}" DataTextFormatString="{c:0}" HeaderText="操作" Text="选择" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EduJWConnectionString %>" SelectCommand="SELECT  SC.No AS '序号',C.Name AS '课程名称',F.Name AS '授课教师' ,D.Name AS '授课单位', C.Credit AS '学分', C.Length AS '时长' ,SC.Numbers AS '限选人数',COUNT(SD.SelectCourseNo) AS '已选人数'
					FROM  tb_TeachingTask AS TT 
	                JOIN tb_Course AS C ON C.No=TT.CourseNo
	                JOIN tb_Faculty AS F ON F.No=TT.FacultyNo
	                JOIN tb_Department AS D ON D.No=F.DepartmentNo
	                JOIN tb_SelectCourse AS SC ON SC.TeachingTaskNo=TT.No
				LEFT	JOIN tb_SelectedCourse AS SD ON SC.No=SD.SelectCourseNo
	                WHERE SC.MajorNo=
        (SELECT C.MajorNo FROM tb_Class AS C WHERE C.No=(SELECT S.ClassNo FROM tb_Student AS S WHERE S.No='3210707001'))
         AND   SC.StartTime&lt;=GETDATE() AND  SC.EndTime&gt;=GETDATE()  
		 GROUP BY SD.SelectCourseNo,SC.No,C.Name,F.Name,D.Name,C.Credit,C.Length,SC.Numbers,C.No
      ;"></asp:SqlDataSource>
    已选课程
    <asp:GridView runat="server" AutoGenerateColumns="False" CssClass="Nsb_r_list Nsb_table" DataSourceID="SqlDataSource2">
        <Columns>
            <asp:BoundField DataField="选课号" HeaderText="选课号" SortExpression="选课号" />
            <asp:BoundField DataField="课程名称" HeaderText="课程名称" SortExpression="课程名称" />
            <asp:HyperLinkField DataNavigateUrlFields="选课号" DataNavigateUrlFormatString="SelectCourse.aspx?选课号={0}" DataTextFormatString="{c:0}" HeaderText="操作" Text="退选" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:EduJWConnectionString %>" SelectCommand="SELECT SdC.SelectCourseNo AS '选课号',C.Name AS '课程名称' FROM  tb_TeachingTask AS TT 
	                JOIN tb_Course AS C ON C.No=TT.CourseNo
	                JOIN tb_Faculty AS F ON F.No=TT.FacultyNo
	                JOIN tb_Department AS D ON D.No=F.DepartmentNo
	                JOIN tb_SelectCourse AS SC ON SC.TeachingTaskNo=TT.No
                   JOIN tb_SelectedCourse AS SdC ON SdC.SelectCourseNo=SC.No
	                WHERE SC.MajorNo=
        (SELECT C.MajorNo FROM tb_Class AS C WHERE C.No=(SELECT S.ClassNo FROM tb_Student AS S WHERE S.No='3210707001'))
        AND SdC.StudentNo ='3210707001';"></asp:SqlDataSource>
    </div></div>
</asp:Content>

