<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm1.aspx.cs" Inherits="WebApplication2.WebForm1" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
                 <br />

                 Nom de Profil&nbsp;&nbsp; 
         <asp:TextBox ID="TextBox1" runat="server" Width="151px" BorderColor="#660066"></asp:TextBox> 
         &nbsp;<asp:Button ID="Button1" runat="server" Text="Consultation des Profils" OnClick="Button1_Click" /><br />
                 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
         <asp:TextBox ID="TextBox2" runat="server" Width="151px" BorderColor="#660066"></asp:TextBox>
         &nbsp;<asp:Button ID="Button2" runat="server" Text="Modifier Nom de Profil" OnClick="Button2_Click" />
                 <br />
       &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp; 
               <asp:Button ID="Button3" runat="server" Text="Drop Column" OnClick="Button3_Click" />
                 <br />
                 ID de PROFIL&nbsp;&nbsp;&nbsp;
            <asp:TextBox ID="TextBox3" runat="server" Width="151px" BorderColor="#660066"></asp:TextBox>
        &nbsp;&nbsp;
               <asp:Button ID="Button4" runat="server" Text="Ajouter Profil" OnClick="Button4_Click" /> 

                 <br />

    </div>
        
       

        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <asp:Button ID="Button5" runat="server" Text="Supprimer Profil" OnClick="Button5_Click" />
        
       

        <asp:GridView ID="GridView1" runat="server" PageSize="15" AllowPaging="True" OnPageIndexChanging="onPaging" style="margin-left: 0px" AutoGenerateColumns="False" CellPadding="4" ForeColor="#333333" GridLines="None">
             <AlternatingRowStyle BackColor="White" />
             <Columns>
                  <asp:boundfield datafield="ID_PROFIL" headertext="ID"/>
                  <asp:boundfield datafield="NOM_PROFIL" headertext="Nom"/>
                  <asp:boundfield datafield="DATE_CREAT" headertext="Date de Creation"/>
                  <asp:boundfield datafield="DATE_MODIF" headertext="Date de Modification"/>
                  <asp:boundfield datafield="STATUT" headertext="Statut"/>
                  <asp:boundfield datafield="MAT_USER_CREAT" headertext="Matricule"/>

              </Columns>
           
             <EditRowStyle BackColor="#2461BF" />
             <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
             <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
             <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
             <RowStyle BackColor="#EFF3FB" />
             <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
             <SortedAscendingCellStyle BackColor="#F5F7FB" />
             <SortedAscendingHeaderStyle BackColor="#6D95E1" />
             <SortedDescendingCellStyle BackColor="#E9EBEF" />
             <SortedDescendingHeaderStyle BackColor="#4870BE" />
           
        </asp:GridView>
        
        <p>
            &nbsp;</p>
        
       

    </form>
</body>
</html>
