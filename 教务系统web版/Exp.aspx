<%@ Page Title="" Language="C#" MasterPageFile="~/Practice.Master" AutoEventWireup="true" CodeBehind="Exp.aspx.cs" Inherits="教务系统web版.Exp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
         <asp:Label ID="Labelname" runat="server" Text="官祥杰" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label> 
	<asp:Label ID="Labelno" runat="server" Text="(3210707015)" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="Nsb_layout_r">
	<div class="Nsb_r_title"><a href="Desk.aspx">首页</a>>>实验教学>>实验预约管理(可选)</div>
<div style="font-size:20px;text-align:center;">
    <a href="Exp.aspx">可选实验</a>&nbsp;&nbsp; <a href="Expd.aspx">已选实验</a>
    <br /><br />
    <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="Nsb_r_list Nsb_table" DataKeyNames="项目编号" DataSourceID="SqlDataSource1">
        <Columns>
            <asp:BoundField DataField="项目编号" HeaderText="项目编号" ReadOnly="True" SortExpression="项目编号" />
            <asp:BoundField DataField="实验项目名称" HeaderText="实验项目名称" SortExpression="实验项目名称" />
            <asp:BoundField DataField="项目类型" HeaderText="项目类型" SortExpression="项目类型" />
            <asp:BoundField DataField="计划学时" HeaderText="计划学时" SortExpression="计划学时" />
            <asp:BoundField DataField="承担实验室" HeaderText="承担实验室" SortExpression="承担实验室" />
            <asp:BoundField DataField="负责教师" HeaderText="负责教师" SortExpression="负责教师" />
            <asp:HyperLinkField AccessibleHeaderText="" DataNavigateUrlFields="项目编号" DataNavigateUrlFormatString="Expd.aspx?项目编号={0}" DataTextFormatString="{c:0}" HeaderText="操作" Text="选择" />
        </Columns>
    </asp:GridView>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:EduJWConnectionString %>" SelectCommand="SELECT E.No AS '项目编号',E.Name AS '实验项目名称',ET.Name AS '项目类型',E.Length AS '计划学时',L.Name AS '承担实验室',F.Name AS '负责教师'  FROM tb_Experiment AS E
                            JOIN tb_ExperimentType AS ET ON ET.No=E.TypeNo
                            JOIN tb_Lab AS L ON l.No=E.LabNo
                            JOIN tb_Faculty AS F ON F.No=E.FacultyNo"></asp:SqlDataSource>
    
    </div>
        </div>
</asp:Content>
