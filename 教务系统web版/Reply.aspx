<%@ Page Title="" Language="C#" MasterPageFile="~/Desk.Master" AutoEventWireup="true" CodeBehind="Reply.aspx.cs" Inherits="教务系统web版.Reply" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="body1" runat="server">
          <div class="Nsb_top">
 
    <div style="float:right">        
       <asp:Label ID="Labelname" runat="server" Text="官祥杰" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
		<asp:Label ID="Labelno" runat="server" Text="(3210707015)" class="Nsb_top_menu_nc" style="color: #000000;"></asp:Label>
		&nbsp;&nbsp;&nbsp;&nbsp;
       </div>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:TextBox ID="TextBoxcontent" runat="server"></asp:TextBox><br />
    <asp:Button ID="Buttonsend" runat="server" Text="发送" OnClick="Buttonsend_Click" />
    <br />
    <asp:Label ID="Labelmgls" runat="server" Text="发送成功" Visible="false"></asp:Label>
</asp:Content>
