<%@ Page Title="" Language="C#" MasterPageFile="~/Evaluate.Master" AutoEventWireup="true" CodeBehind="Studentevaluate.aspx.cs" Inherits="教务系统web版.Studentevaluate" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
     <asp:Label ID="Labelname" runat="server" Text="官祥杰" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label> 
	<asp:Label ID="Labelno" runat="server" Text="(3210707015)" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

        <div class="Nsb_layout_r">
	<div class="Nsb_r_title"><a href="Desk.aspx">首页</a>» 教学评价 » 评价信息</div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" AutoGenerateEditButton="True" OnRowUpdating="GridView1_RowUpdating" OnRowUpdated="GridView1_RowUpdated" CssClass="Nsb_r_list Nsb_table">
                <Columns>
                    <asp:BoundField DataField="序号" HeaderText="序号" SortExpression="序号" />
                    <asp:BoundField DataField="课程名称" HeaderText="课程名称" SortExpression="课程名称" />
                    <asp:BoundField DataField="教师" HeaderText="教师" SortExpression="教师" />
                    <asp:BoundField DataField="单位" HeaderText="单位" SortExpression="单位" />
                    <asp:BoundField DataField="教师评分" HeaderText="教师评分" SortExpression="教师评分" />
                    <asp:BoundField DataField="学生评语" HeaderText="学生评语" SortExpression="学生评语" />
                </Columns>
            </asp:GridView>

            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EduJWConnectionString %>" SelectCommand="Select 
    SS.TeachingTaskNo AS '序号',Ce.Name AS '课程名称',F.Name AS '教师',D.Name AS '单位',SS.FaculatyScore AS'教师评分', SS.StudentComment AS '学生评语' 
    from tb_Evaluate AS E
	JOIN tb_TeachingTask AS TT ON TT.No=E.TeachingTaskNo
	JOIN tb_StudentScore AS SS ON SS.TeachingTaskNo=TT.No
	JOIN tb_Faculty AS F ON F.No=TT.FacultyNo
	JOIN tb_Department AS D ON D.No=F.DepartmentNo
	JOIN tb_Course AS Ce ON Ce.No=TT.CourseNo" UpdateCommand="UPDATE tb_StudentScore SET
                FaculatyScore=@教师评分,StudentComment=@学生评语
                WHERE TeachingTaskNo=@序号"></asp:SqlDataSource>
            </div>
    
</asp:Content>
