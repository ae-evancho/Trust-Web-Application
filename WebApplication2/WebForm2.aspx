<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="WebApplication2.WebForm2" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
        <script src="Scripts/jquery-1.7.1.js"></script>
    
        <script>
            $(function () {
                $('#filter').keyup(function () {
                    var val = $(this).val().toUpperCase();
                    $("#<%= GridView1.ClientID %>").hide();
                    $("#<%= GridView2.ClientID %>").show();
                    $('#GridView2 > tbody > tr').each(function (index, element) {
                      if ($(this).text().toUpperCase().indexOf(val) > 0)
                          $(this).show();
                      else
                          $(this).hide();
                });
            });
            $("#filter").focusout(function () {
                if ($('#filter').val() == '') {
                    $("#<%= GridView2.ClientID %>").hide();
                    $("#<%= GridView1.ClientID %>").show();
                }
            });

        });
        </script>
         <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />

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
  cursor:pointer;
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
    margin-left: 85px;
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

.commFieCSS { text-align:center; width:150px; }
 .commFieCSS a  { text-align:center; padding-left:5px;  text-decoration:underline; font-weight:bold }

.erw input[type=text] {height: 15px}
.erw { color: #4800ff }

#confirm {
    width:320px;
    height:100px;
    background-color:#fff;
    top:50%;
    left:50%;
    position:fixed;
    transform:translate(-50%,-50%);
    box-sizing:border-box;
    box-shadow:0 4px 8px 0 rgba(0, 0, 0, 0.8);
    z-index:80;
    text-align:center;
    padding-top:10px;
    display:none;
    background-color:#fcfcfc; 
    border-radius:4px
      }
#Button6:hover, #Button7:hover {
    filter:brightness(85%);
    cursor:pointer;
      } 
#filter {
     width: 250px;
     height:30px;
     border-right:none;
     border-bottom:none;
     border-color:#507CD1;
     outline:none;
     font-size:14px;
           }
.icon {
  padding: 10px;
  background: white;
  color: grey;
  text-align: center;
  float:right;
  border:1px solid #507CD1; 
  border-width: 2px;
  border-style: inset;
  border-left:none;
  border-bottom:none;
        }
.contain {
  display: flexbox;
  width: 286px;
  display:none;
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
   
    
    <div id="page">  
       <form id="form1" runat="server">
           <div id="op" runat="server" style="width:100vw; height:100vh; opacity:0.5; background-color:black; z-index:40;top:50%;
                       left:50%; position:fixed; transform:translate(-50%,-50%); display:none"></div>



         <div id="confirm" runat="server">
           <asp:Panel ID="Panel1" runat="server" Font-Bold="False" Font-Names="Microsoft YaHei" Font-Size="12px" HorizontalAlign="Left" 
                      Style="margin-right:20px; margin-left:12px; margin-top:5px; padding-bottom:15px;">Etat Déja Attribué, Voulez Vouz Continuer? </asp:Panel>
            <div style="width:100%; height:0px; border:1px solid grey"></div>
            <br />
             <div style="float:right; margin-right:5px;">
            <asp:Button ID="Button6" runat="server" Text="Oui" OnClick="Button6_Click" Height="30px" ForeColor="White" Width="40px" Font-Size="13px" Font-Bold="true" 
                        style=" background-color:#507CD1; text-align:center; border:1px solid grey; font-family:sans-serif; border-radius:3px"   />
            
            <asp:Button ID="Button7" runat="server" Text ="Non" OnClick = "Button7_Click" Height="30px" ForeColor="black" Width="40px" Font-Size="13px" Font-Bold="true" 
                        style="background-color:#fcfcfc; text-align:center; border:1px solid grey; font-family:sans-serif; border-radius:3px"   />
              </div>
         </div>

    <div id="entete">
        <img src="..\Images\Ban.jpg" height="80" />
    </div>
  <div id="contenu">  
    <div class="sidenav">
        <h3>&nbsp;&nbsp;&nbsp;Menu Principal</h3>
        <a href="acceuil.aspx" >Accueil</a>
        <a href="WebForm2.aspx" id="GE" runat="server" class="Actif">Gestion Des Etats</a>
        <a href="WebForm3.aspx" id="GP" runat="server">Gestion Des Profils</a>
        <a href="WebForm4.aspx" id="GEP" runat="server" >Gestion Mapping</a>
        <a href="WebForm5.aspx" id="GD" runat="server">Gestion Droits D'Accès</a>
        <a href="notif.aspx" id="GN" runat="server">Gestion Des Notifications</a>
    </div>

    <div class="main">
        <h2 class="capo">Gestion Des Etats</h2>
       <div class="final">
          <br />
     <table style="width: 100%" >
      <tr>
        <td>
          <div style="position: relative; float:left" >
          <asp:Button Text="Consult/Modif/Supp" BorderStyle="None" ID="Tab1" CssClass="Initial" runat="server"
             
              OnClick="Tab1_Click" />
                <div  id="t1" runat="server" class="far"></div>
                </div>
            <div style="position: relative; float:left" >
          <asp:Button Text="Ajout" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server"

              OnClick="Tab2_Click" />
                <div id="t2" runat="server" class="far"></div>
                 </div>
          
          <asp:MultiView ID="MainView" runat="server" >
            <asp:View ID="View1" runat="server">
              <table style="width: 100%; background-color: #fcfcfc; border-top:solid; border-top-width:2px; border-top-color:#07a0a0 ">
                <tr>
                  <td>
                   <div style="min-height:550px">
                       <br /> <br /> 
                     <asp:Button ID="Button1" runat="server" Text="Afficher Liste Des Etats" OnClick="Button1_Click" CssClass="button" />
                     <asp:Button ID="Button5" runat="server" Text="Exporter Vers Excel" OnClick="Button5_Click" CssClass="button" />
                       <br />

                     <div style="float:left; margin-top:30px; border-top:2px solid #a0d6b4; padding-top:20px;   ">
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:myBaseConnectionString %>" SelectCommand="SELECT [ID_RUBRIQUE], [NOM_RUBRIQUE] FROM [RUBRIQUE]"></asp:SqlDataSource>
                         
                         <div id="SearchIcon" class="contain" runat="server">
                            <i class="fa fa-search icon"></i>
                            <asp:TextBox ID="filter" runat="server" AutoCompleteType="Disabled" placeholder="Recherche..."></asp:TextBox> 
                             </div>

              <asp:GridView ID="GridView1" runat="server" PageSize="15" AllowPaging="True" OnPageIndexChanging="onPaging" 
                       style="margin-left: 0px; text-align:center" AutoGenerateColumns="False" OnRowDataBound="GD1_RowDataBound" CellPadding="4" 
                       ForeColor="#333333" GridLines="None" OnRowDeleting="ButSupp" OnRowEditing="ButMod"  OnRowUpdating="ButMaj" 
                       OnRowCancelingEdit="ButAnn"  DataKeyNames="ID_ETAT" >
              <AlternatingRowStyle BackColor="White" />
              <Columns>
                  <asp:boundfield datafield="ID_ETAT" headertext="ID" ReadOnly="true"/>
                  <asp:TemplateField headertext="Rubrique">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDLrubrique" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOM_RUBRIQUE" DataValueField="ID_RUBRIQUE" Width="60px">                           
                        </asp:DropDownList>
                    </EditItemTemplate>
                      <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID_RUBRIQUE") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>

                  <asp:boundfield datafield="NOM_ETAT" headertext="Nom" />
                  <asp:boundfield datafield="DATE_CREAT" headertext="Date de Creation" ReadOnly="true"/>
                  <asp:boundfield datafield="DATE_MODIF" headertext="Date de Modification" ReadOnly="true"/>
                  <asp:boundfield datafield="MAT_USER_CREAT" headertext="Matricule" ReadOnly="true"/>
                  
                  <asp:CommandField ItemStyle-CssClass="commFieCSS" ShowDeleteButton="True" ShowEditButton="True" CausesValidation="false" ControlStyle-ForeColor="Blue" ItemStyle-ForeColor="White" >
                                           <ControlStyle ForeColor="Blue" />
                                           <ItemStyle CssClass="commFieCSS" />
                  </asp:CommandField>
              </Columns>
              <EditRowStyle BackColor="#a0d6b4" CssClass="erw" />
              <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#a0d6b4" ForeColor="White" HorizontalAlign="Center" />
              <RowStyle BackColor="#E3EAEB" />
              <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
              <SortedAscendingCellStyle BackColor="#F8FAFA" />
              <SortedAscendingHeaderStyle BackColor="#246B61" />
              <SortedDescendingCellStyle BackColor="#D4DFE1" />
              <SortedDescendingHeaderStyle BackColor="#15524A" />
              </asp:GridView>
              <asp:GridView ID="GridView2" runat="server"  ClientIDMode="Static"
                       style="margin-left: 0px; text-align:center" AutoGenerateColumns="False" OnRowDataBound="GD1_RowDataBound" CellPadding="4" 
                       ForeColor="#333333" GridLines="None" OnRowDeleting="ButSupp2" OnRowEditing="ButMod2"  OnRowUpdating="ButMaj2" 
                       OnRowCancelingEdit="ButAnn"  DataKeyNames="ID_ETAT">
                  <AlternatingRowStyle BackColor="White" />
              <Columns>
                  <asp:boundfield datafield="ID_ETAT" headertext="ID" ReadOnly="true"/>
                  <asp:TemplateField headertext="Rubrique">
                    <EditItemTemplate>
                        <asp:DropDownList ID="DDLrubrique" runat="server" DataSourceID="SqlDataSource1" DataTextField="NOM_RUBRIQUE" DataValueField="ID_RUBRIQUE" Width="60px">                           
                        </asp:DropDownList>
                    </EditItemTemplate>
                      <ItemTemplate>
                         <asp:Label ID="Label1" runat="server" Text='<%# Bind("ID_RUBRIQUE") %>'></asp:Label>
                      </ItemTemplate>
                  </asp:TemplateField>

                  <asp:boundfield datafield="NOM_ETAT" headertext="Nom" />
                  <asp:boundfield datafield="DATE_CREAT" headertext="Date de Creation" ReadOnly="true"/>
                  <asp:boundfield datafield="DATE_MODIF" headertext="Date de Modification" ReadOnly="true"/>
                  <asp:boundfield datafield="MAT_USER_CREAT" headertext="Matricule" ReadOnly="true"/>
                  
                  <asp:CommandField ItemStyle-CssClass="commFieCSS" ShowDeleteButton="True" ShowEditButton="True" CausesValidation="false" ControlStyle-ForeColor="Blue" ItemStyle-ForeColor="White" >
                                           <ControlStyle ForeColor="Blue" />
                                           <ItemStyle CssClass="commFieCSS" />
                  </asp:CommandField>
              </Columns>
              <EditRowStyle BackColor="#a0d6b4" CssClass="erw" />
              <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
              <PagerStyle BackColor="#a0d6b4" ForeColor="White" HorizontalAlign="Center" />
              <RowStyle BackColor="#E3EAEB" />
              <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
              <SortedAscendingCellStyle BackColor="#F8FAFA" />
              <SortedAscendingHeaderStyle BackColor="#246B61" />
              <SortedDescendingCellStyle BackColor="#D4DFE1" />
              <SortedDescendingHeaderStyle BackColor="#15524A" />

              </asp:GridView>
                         
                          </div>
                  </div>  
                  </td>
                </tr>
              </table>
            </asp:View>
            <asp:View ID="View2" runat="server">
              <table style="width: 100%; background-color: #fcfcfc; border-top:solid; border-top-width:2px; border-top-color:#07a0a0 ">
                <tr>
                  <td>
                      <div style="min-height:550px;">
                        <br />
                        <br />
                       <div style="border:1px solid #07a0a0; padding-left:10px; padding:20px ">
                        <p style="font-family:Consolas"> RUBRIQUE &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </p>
                   <asp:DropDownList ID="DropDownList1" runat="server" DataTextField="NOM_RUBRIQUE" DataValueField="ID_RUBRIQUE" style="font-family:Consolas" Height="22px"></asp:DropDownList>
                         <br />
                         <br />
                          <p style="font-family:Consolas">NOM DE L' ETAT &nbsp;&nbsp;</p>
                          <asp:TextBox ID="TextBox1" runat="server" Height="18px" Width="300px" Font-Names="consolas"></asp:TextBox>                          
                          <asp:Button ID="Button3" runat="server" Text="Ajouter Etat" OnClick="Button3_Click" CssClass="button" />
                          <div style="border-top:1px solid #07a0a0; margin-top:40px;">
                           <p style="font-family:Consolas"> DESCRIPTION DE L' ETAT </p>
                          <textarea id="TextArea1" cols="69" rows="10" runat="server"></textarea>
                           </div>
                         </div>
                      </div>
                      
                  </td>
                </tr>
              </table>
            </asp:View>
          </asp:MultiView>
        </td>
      </tr>
    </table> 
        <asp:HiddenField ID="HiddenField1" runat="server" />
           
      </div> 
    </div>
   </div>
  </form>
</div>   
</body>
    
     

</html>
