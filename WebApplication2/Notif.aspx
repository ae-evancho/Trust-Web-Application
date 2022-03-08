<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Notif.aspx.cs" Inherits="WebApplication2.WebForm7" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

     <script src="Scripts/jquery-1.7.1.js"></script>
    
        <script>
            $(function () {
                $(document).ready(function() {
                    if ($('#Dept :selected').text() == "IT(Admin)") {
                        $('#Label2').show();
                        $('#Email').toggleClass('blue');
                    }
                });
                $('#Dept').click(function () {
                var hf = $('#HiddenField1').val();
                if ($('#Dept :selected').text() == "IT(Admin)") {
                    $('#Email').val(hf);
                    $('#Email').toggleClass('blue');
                    $('#Label2').show();
                }
                else {
                    $('#Email').val("");
                    $('#Email').toggleClass('');
                    $('#Label2').hide();
                }
                  });
                    });
               
        </script>



     <style type="text/css">
           
           /*Interieur Style*/

.Initial
{
  display: block;
  padding: 10px 22px 18px 22px;
  float: left;
  color: #444;
  font-weight: bold;
  background-color: #fcfcfc ;
  background-image: url(../Images/titre-coin.gif);
  background-repeat: no-repeat;
  background-position: top left;
}
.Initial:hover
{
  color: #07a0a0;
  background: url("../Images/SelectedButton.png") no-repeat right top;
  opacity:0.4;
}
.Clicked
{
  float: left;
  display: block;
  padding: 10px 22px 18px 22px;
  color: #07a0a0;
  font-weight: bold;
  background-color: #fcfcfc;
  background-image: url(http://www.lria.usthb.dz/plugins/ahuntsic/styles/img/titre-coin.gif);
  background-repeat: no-repeat;
  background-position: top left;
 }
.far {
    display:block;
    border-width:2px;
   content: "";
    background: #fcfcfc;
    position: absolute;
    width: 12px;
    height: 12px;
     left: 50%; 
     bottom: -6px; 
     margin-left: -6px; 
     transform: rotate(45deg); 
  box-shadow: inset 3px 3px 3px rgba(22, 195, 255, 0.5), inset 2px 2px 2px rgba(0, 0, 0, 0.3)
           }
.button {
    background-color: #1C5E55;
    color: white;
    text-align: center;
    padding: 11px 20px;
    display: inline-block;
    font-size: 12px;
    border: 2px solid;
    margin-left: 0px;
    margin-top: 20px;
    transition-duration: 0.4s;
    border-radius:4px;
           }

.button:hover {
  opacity:0.5;
  }

#Button5 {
    float:right;
    margin-right:85px;
    text-decoration:underline;
           }

#Button3 {
     margin-left: 0px;
     float:right;
     margin-right:145px;
     padding: 5px 10px;
           }

#labelDiv {
      height:400px;
      width:300px;
      background-color:white;
      border:1px solid black;
      float:right;
      margin-right:20px;
      margin-top:0;
      padding:0;
         }

#GridView1 {
    margin-top:45px;
         }
.blue {
    background-color:#a0d6b4;
         }

/*Exterieur Style*/
/*////////////////*/        
/*Exterieur Style*/
/*////////////////*/ 

body, html {
  font-family: "Lato", sans-serif;
}

.sidenav {
  position: absolute;
  z-index: 1;
  left: 0;
  background-color: #07a0a0 ;
  overflow-x: hidden;
  padding-top: 0px;
  margin-top:0px;
  width: 180px;
  border-top-left-radius:2%;

}

.sidenav a {
  padding: 8px 8px 8px 16px;
  text-decoration: none;
  color: black;
  display: block;
  padding-top: 13px;
  padding-bottom: 13px;
  font-family: 'Times New Roman';
  font-size:14px;
  text-align:left;
  border-bottom:1px solid white;
 }
.sidenav h3 {
    background-image: url(../Images/titre-coin.gif);
    background-repeat: no-repeat;
    background-position: top left;
    text-align:left; 
    background-color:teal; 
    padding-top:9px; 
    padding-bottom:9px; 
    margin-top:0;  
    color:white;
    margin-bottom:0px;
    border-bottom:1px solid white
      }
.sidenav a:hover {
  color: #b5b9b9;
}

.main {
   font-size: 12px;
   text-align: justify;
   margin-top: 0;
   background-color: #fcfcfc;


  }

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 10px;}
}
.sidenav a.Actif {
    background-color:teal;
    color:white;
    border-right:2px solid orange;
    }
#entete {
    }
#page {
    position: relative;
    text-align: left;
    margin: 2em auto;
    
    padding: 0;
    width: 950px;
    max-width: 98%;
    min-width: 740px;
 }
img {
    max-width: 100%;
    max-height: 100%;
}
div {
    display: block;
}
#contenu {
    position: static;
    border: solid 1px #DEDEDE;
    margin: 10px 0px 5px 190px;
    background: white;
    z-index: 20;
    border-top-left-radius:1%;

  }
.capo {
    margin: 0;
    padding: 0;
    color: white;
    background-color: teal;
    text-indent: 15px;
    width: 100%;
    line-height: 2;
    display:block;
    font-size: 20px;
    background-image: url(../Images/titre-coin.gif);
    background-repeat: no-repeat;
    background-position: top left;
    font-family: sans-serif;
    font-weight: 200;
}
.final {
    padding:0.5em;
    clear:both;
    }
        

 </style>
</head>
<body>
    <form id="form1" runat="server">
        <div id="page">  
    <div id="entete">
        <img src="..\Images\Ban.jpg" height="80"/>
    </div>
  <div id="contenu">  
    <div class="sidenav">
        <h3>&nbsp;&nbsp;&nbsp;Menu Principal</h3>
        <a href="acceuil.aspx">Accueil</a>
        <a href="WebForm2.aspx" id="GE" runat="server">Gestion Des Etats</a>
        <a href="WebForm3.aspx" id="GP" runat="server">Gestion Des Profils</a>
        <a href="WebForm4.aspx" id="GEP" runat="server" >Gestion Mapping</a>
        <a href="WebForm5.aspx" id="GD" runat="server">Gestion Droits D'Accès</a>
        <a href="notif.aspx" id="GN" runat="server" class="Actif">Gestion Des Notifications</a>

    </div>

    <div class="main">
        <h2 class="capo">Gestion De Notification</h2>
       <div class="final">
            <br />
           <asp:HiddenField ID="HiddenField1" runat="server" />
           <table style="width: 100%" >
      <tr>
        <td>
      
          <div style="position: relative; float:left" >
          <asp:Button Text="E-mails" BorderStyle="None" ID="Tab1" CssClass="Initial" runat="server"
             
              OnClick="Tab1_Click" />
                <div  id="t1" runat="server" class="far"></div>
                </div>
            <div style="position: relative; float:left" >
          <asp:Button Text="Notifications" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server"

              OnClick="Tab2_Click" />
                <div id="t2" runat="server" class="far"></div>
                 </div>
          
          <asp:MultiView ID="MainView" runat="server" >
            <asp:View ID="View1" runat="server">
              <table style="width: 100%; background-color: #fcfcfc; border-top:solid; border-top-width:2px; border-top-color:#07a0a0 ">
                <tr>
                  <td>
                   <div style="min-height:550px">
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:myBaseConnectionString %>" SelectCommand="SELECT [Email], [Dept] FROM [Mail_List]"  DeleteCommand="select * from [etat]"></asp:SqlDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"  
                              CellPadding="4" ForeColor="#333333" GridLines="None" style="text-align:center; float:right; margin-top:80px; margin-right:20px"
                                OnRowDataBound="GD2_RowDataBound" OnRowDeleting="GD2_Supp" DataKeyNames="Email"  >
                              <AlternatingRowStyle BackColor="White" />
            <Columns> 
                <asp:BoundField DataField="Email" HeaderText="Email" SortExpression="notif_titre" />
                <asp:BoundField DataField="Dept" HeaderText="Département" SortExpression="notif_type" />
                <asp:CommandField ShowDeleteButton="True" CausesValidation="false" ControlStyle-ForeColor="Blue" ItemStyle-ForeColor="White">
                    
                </asp:CommandField>
            </Columns>
                              <EditRowStyle BackColor="#7C6F57" />
                              <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                              <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                              <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                              <RowStyle BackColor="#E3EAEB" />
                              <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                              <SortedAscendingCellStyle BackColor="#F8FAFA" />
                              <SortedAscendingHeaderStyle BackColor="#246B61" />
                              <SortedDescendingCellStyle BackColor="#D4DFE1" />
                              <SortedDescendingHeaderStyle BackColor="#15524A" />

        </asp:GridView>
                       
                       <br /> <br />
                      <p style="font-family:Consolas">DEPARTEMENT </p> 
                       <asp:DropDownList ID="Dept" runat="server" Font-Names="Consolas" Width="250px">
                           <asp:ListItem>::</asp:ListItem>
                           <asp:ListItem>IT(Admin)</asp:ListItem>
                           <asp:ListItem>IT</asp:ListItem>
                           <asp:ListItem>DRH</asp:ListItem>
                           <asp:ListItem>DCI</asp:ListItem>
                       </asp:DropDownList>
                       <br />
                       <br />
                      <p style="font-family:Consolas">E_MAIL </p> 
                       <asp:TextBox ID="Email" runat="server" Width="250px"></asp:TextBox>
                       <br />
                       <asp:Label ID="Label2" runat="server" Text="Un seul email pour l'admin. Voulez-vous changer cet email?" style="display:none; color:red; font-family:Consolas"></asp:Label>

                       <br />
        <asp:Button ID="Ajouter" runat="server" Text="Ajouter" CssClass="button" OnClick="Ajouter_Click" />

                      
                   </div>
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
              <table style="width: 100%; background-color: #fcfcfc; border-top:solid; border-top-width:2px; border-top-color:#07a0a0 ">
                <tr>
                  <td>
                      <div style="min-height:550px">
                         
                         <div id="labelDiv">
                          <h3 style="font-family:Consolas; height:25px;background-color:#1C5E55;text-align:center; margin:0; color:white">Message</h3>

                          <p style="font-family:Consolas; padding-right:5px;padding-left:5px"><asp:Label ID="Label1" runat="server" Text=""></asp:Label></p>   
                         </div>
                          <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource1" OnRowCommand="LB1Click" 
                              CellPadding="4" ForeColor="#333333" GridLines="None" style="text-align:center">
                              <AlternatingRowStyle BackColor="White" />
            <Columns>
                
                <asp:BoundField DataField="notif_titre" HeaderText="notif_titre" SortExpression="notif_titre" />
                <asp:BoundField DataField="notif_type" HeaderText="notif_type" SortExpression="notif_type" />
                <asp:BoundField DataField="notif_date" HeaderText="notif_date" SortExpression="notif_date" />
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:LinkButton ID="LB1" runat="server" CommandArgument='<%# Bind("notif_titre") %>' Text="Afficher Message" CommandName="Afficher Message" ></asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
                              <EditRowStyle BackColor="#7C6F57" />
                              <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                              <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                              <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                              <RowStyle BackColor="#E3EAEB" />
                              <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                              <SortedAscendingCellStyle BackColor="#F8FAFA" />
                              <SortedAscendingHeaderStyle BackColor="#246B61" />
                              <SortedDescendingCellStyle BackColor="#D4DFE1" />
                              <SortedDescendingHeaderStyle BackColor="#15524A" />
                        </asp:GridView>
        

        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myBaseConnectionString %>" SelectCommand="SELECT [notif_titre], [notif_type], [notif_date] FROM [Notification]"></asp:SqlDataSource>

                      </div>
                      
                  </td>
                </tr>
              </table>
            </asp:View>
          </asp:MultiView>
        </td>
      </tr>
    </table> 
</div>
</div>
</div>
</div> 
         
    
    </form>
 
</body>
</html>
