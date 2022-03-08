 <%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm5.aspx.cs" Inherits="WebApplication2.WebForm51" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<%@ Import Namespace="System.Web.UI.HtmlControls" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.4/jquery.min.js"></script>
       
    <script>
        $(function () {
            $(document).ready(function() {
                if ($('#Existence2').text() == "Record Doesn't Exist") {
                    $('#Label1').show();
                    $('#Button1')[0].type = 'button'
                    $('#Button1').css("opacity", "0.5");
                    $('#Button1').css("cursor", "default");
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

.info {
            position: absolute; 
            width:300px; 
            height: 300px; 
            border: 2px solid #1C5E55;
            right:5%;
            margin-top:10px;
            background-color:#a0d6b4;
        }
.capo2 {
    margin: 0;
    padding: 0;
    color: white;
    background-color: #07a0a0;
    text-indent: 15px;
    width: 90%;
    border:1px solid #07a0a0;
    border-top-left-radius:7px;
    border-top-right-radius:7px;
    line-height: 2;
    display:inline-block;
    font-size: 14px;
    background-image: url(../Images/titre-coin.gif);
    background-repeat: no-repeat;
    background-position: top left;
    font-family: sans-serif;
    font-weight: 100;
    }
#cboxlist {
    font-family: 'roboto', sans-serif;
    border-top: 2px solid #a0d6b4;
        }
#cboxlist tr td h3 {
    color:#a0d6b4;
    font-size:1em;
    font-stretch:condensed;
        }
.check {
   border-top:2px solid #a0d6b4;
   width:200px;
   overflow:hidden;
       }
.check tbody tr td label {
    font-size:0.9em;
    margin:0;
    padding:0;
    font-stretch: ultra-condensed;
    display:inline-block;
       }
.check tbody tr td  input[type=checkbox] {
     height: 12px;
     width: 12px;
     -webkit-appearance: none;
     -moz-appearance: none;
     background: lightgray;
     border: 1px solid white;
     padding: 0;
     margin:0;
     margin-right:3px;
       }
.check tbody tr td  input[type=checkbox]:checked {
  background: #2fa988;
}

.check tbody tr td  input[type=checkbox]:hover {
    filter: brightness(90%);
}

.button {
    background-color: #1C5E55;
    color: white;
    text-align: center;
    padding: 11px 20px;
    display: inline-block;
    font-size: 12px;
    border: 2px solid;
    margin-left: 81px;
    transition-duration: 0.4s;
    border-radius:4px;
    cursor:pointer;
           }

.button:hover {
  opacity:0.5;
  }

 #Button1, #Button2 {
     margin-left: -2px;
        }

#Button3 {
    margin-left: 135px;
        }

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

             <div id="op" runat="server" style="width:100vw; height:100vh; opacity:0.5; background-color:black; z-index:40;top:50%;
                       left:50%; position:fixed; transform:translate(-50%,-50%); display:none"></div>

            <div id="confirm" runat="server">
           <asp:Panel ID="Panel1" runat="server" Font-Bold="False" Font-Names="Microsoft YaHei" Font-Size="12px" HorizontalAlign="Left" 
                      Style="margin-right:20px; margin-left:12px; margin-top:5px; padding-bottom:15px;">Voulez Vous Vraiment Supprimer Cet Employé? </asp:Panel>
            <div style="width:100%; height:0px; border:1px solid grey"></div>
            <br />
             <div style="float:right; margin-right:5px;">
            <asp:Button ID="Oui" runat="server" Text="Oui" OnClick="Oui_Click" Height="30px" ForeColor="White" Width="40px" Font-Size="13px" Font-Bold="true" 
                        style=" background-color:#507CD1; text-align:center; border:1px solid grey; font-family:sans-serif; border-radius:3px"   />
            
            <asp:Button ID="Non" runat="server" Text ="Non" OnClick = "Non_Click" Height="30px" ForeColor="black" Width="40px" Font-Size="13px" Font-Bold="true" 
                        style="background-color:#fcfcfc; text-align:center; border:1px solid grey; font-family:sans-serif; border-radius:3px"   />
              </div>
          </div>

            <div id="entete">
                <img src="..\Images\Ban.jpg" height="80" />
            </div>
            <div id="contenu">
                <div class="sidenav">
                    <h3>&nbsp;&nbsp;&nbsp;Menu Principal</h3>
                    <a href="acceuil.aspx">Accueil</a>
                    <a href="WebForm2.aspx" id="GE" runat="server">Gestion Des Etats</a>
                    <a href="WebForm3.aspx" id="GP" runat="server">Gestion Des Profils</a>
                    <a href="WebForm4.aspx" id="GEP" runat="server">Gestion Mapping</a>
                    <a href="WebForm5.aspx" id="GD" runat="server" class="Actif">Gestion Droits D'Accès</a>
                    <a href="notif.aspx" id="GN" runat="server">Gestion Des Notifications</a>

                </div>

                <div class="main">
                    <h2 class="capo">Gestion Droits D'Accès</h2>
                    <div class="final">
                       
                         <div >
                             <div style="margin-top:20px; text-align:center; ">
                              <h5 class="capo2">Employé</h5>
                            <div style="display:inline-block; margin-bottom:20px; padding-top:20px; text-align:center; border:1px solid #07a0a0; padding-bottom:20px; width:90%">
                                <asp:Label ID="Matricule" runat="server" Text="Employé : "></asp:Label>
                                &nbsp;&nbsp;&nbsp;    
                      <asp:DropDownList ID="MAT" runat="server" Style="font-family: Consolas" AutoPostBack="true" OnSelectedIndexChanged="MATIndexChanged"></asp:DropDownList>
                                &nbsp;&nbsp;&nbsp;    
                      <asp:Label ID="Agence" runat="server" Text="Agence : "></asp:Label>
                                &nbsp;&nbsp;&nbsp; 
                      <asp:DropDownList ID="AGC" runat="server" Style="font-family: Consolas; min-width:265px" OnSelectedIndexChanged="AGCIndexChanged" AutoPostBack="true"></asp:DropDownList>
                            </div>
                             </div>

                            <div>
                                <table style="width: 100%">
                                    <tr>
                                        <td>
                                            <div style="position: relative; float:left">
                                            <asp:Button Text="Ajout/Supp Profil" BorderStyle="None" ID="Tab1" CssClass="Initial" runat="server"
                                                OnClick="Tab1_Click" />
                                            <div  id="t1" runat="server" class="far"></div>
                                            </div>
                                            <div style="position: relative; float:left">
                                            <asp:Button Text="Ajout/Supp Employé" BorderStyle="None" ID="Tab2" CssClass="Initial" runat="server"
                                                OnClick="Tab2_Click" />
                                            <div  id="t2" runat="server" class="far"></div>
                                            </div>
                                            <div style="position: relative; float:left">
                                            <asp:Button Text="Etat Spécial" BorderStyle="None" ID="Tab3" CssClass="Initial" runat="server"
                                                OnClick="Tab3_Click" />
                                            <div  id="t3" runat="server" class="far"></div>
                                            </div>
                                            <asp:MultiView ID="MainView" runat="server">
                                                <asp:View ID="View1" runat="server">
                                                    <table style="width: 100%; background-color: #fcfcfc; border-top: solid; border-top-width: 2px; border-top-color: #07a0a0">
                                                        <tr>
                                                            <td>
                                                                <div style="min-height: 550px">
                                                                    <div id="info" runat="server" class="info">

                                                                        <h4 style="text-align: center; font-family: Consolas; color:#1C5E55">INFORMATIONS:</h4>
                                                                        <p><strong>Nom et Prénom :</strong>
                                                                            <asp:Label ID="Nom" runat="server"></asp:Label>
                                                                        </p>
                                                                        <p><strong>Email :</strong>
                                                                            <asp:Label ID="Email" runat="server"></asp:Label></p>
                                                                        <p><strong>Matricule :</strong>
                                                                            <asp:Label ID="Matric" runat="server"></asp:Label></p>
                                                                         <p><strong>Fonction :</strong>
                                                                            <asp:Label ID="Fonct" runat="server"></asp:Label></p>
                                                                         <p><strong>Structure :</strong>
                                                                            <asp:Label ID="Struct" runat="server"></asp:Label></p>
                                                                        <p style="text-align: center">
                                                                            <asp:Label ID="Existence" runat="server"></asp:Label></p>
                                                                        <p style="text-align: center">
                                                                            <asp:Label ID="ExistProfil" runat="server"></asp:Label></p>
                                                                        <p style="text-align: center"></p>
                                                                    </div>
                                                    <div style="padding-top:40px; padding-bottom:20px;">
                                                   <asp:Label ID="Profil" runat="server" Font-Names="Consolas" Text="PROFIL : "  Visible="false"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                   <asp:DropDownList ID="PRFL" runat="server" Style="font-family: Consolas; min-width:200px" Visible="false"></asp:DropDownList>
                                                                    <br />
                                                                    <br />
                                                   <asp:Button ID="AJT" runat="server" Text="Ajouter" OnClick="AJTOnClick" Visible="false" CssClass="button" />
                                                                    <br />
                                                                    <br />
                                                                    <asp:Label ID="Avert" runat="server" Text="Voulez Vouz Ecraser Les Etats Existants?" Visible="false"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;
                                                   <asp:LinkButton ID="Y" runat="server" Text="Oui" Visible="false" OnClick="onClickOui" />
                                                                    &nbsp;
                                                   <asp:LinkButton ID="N" runat="server" Text="Non" Visible="false" OnClick="onClickNon" />
                                                     </div>

                                                     <div runat="server" id="upDiv" style="padding-top:40px; border-top:1px solid #07a0a0; width:350px">
                                                   <asp:Label ID="Profil2" runat="server" Font-Names="Consolas" Text="PROFIL : " Visible="false"></asp:Label>
                                                                    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                                   <asp:DropDownList ID="PRFL2" runat="server" Style="font-family: Consolas; min-width:200px" Visible="false"></asp:DropDownList>
                                                                    <br />
                                                                    <br />
                                                   <asp:Button ID="SUPP" runat="server" Text="Supprimer" OnClick="SUPPOnClick" Visible="false" CssClass="button" />
                                                                    <br />
                                                                    <br />
                                                      </div>
                                                                    <asp:HiddenField ID="HF1" runat="server" />
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:View>
                                                <asp:View ID="View2" runat="server">
                                                    <table style="width: 100%; background-color: #fcfcfc; border-top: solid; border-top-width: 2px; border-top-color: #07a0a0">
                                                        <tr>
                                                            <td>
                                                                <div style="min-height: 550px;">
                                                                    <div id="info2" runat="server" class="info">

                                                                        <h4 style="text-align: center; font-family: Consolas; color:#1C5E55">INFORMATIONS:</h4>
                                                                        <p><strong>Nom et Prénom :</strong> 
                                                                            <asp:Label ID="Nom2" runat="server"></asp:Label>
                                                                        </p>
                                                                        <p><strong>Email :</strong> 
                                                                            <asp:Label ID="Email2" runat="server"></asp:Label></p>
                                                                        <p><strong>Matricule :</strong>
                                                                            <asp:Label ID="Matric2" runat="server"></asp:Label></p>
                                                                         <p><strong>Fonction :</strong>
                                                                            <asp:Label ID="Fonct2" runat="server"></asp:Label></p>
                                                                        <p><strong>Structure :</strong>
                                                                            <asp:Label ID="Struct2" runat="server"></asp:Label></p>
                                                                        <p style="text-align: center">
                                                                            <asp:Label ID="Existence2" runat="server"></asp:Label></p>
                                                                        <p style="text-align: center">
                                                                            <asp:Label ID="ExistProfil2" runat="server"></asp:Label></p>
                                                                        
                                                                    </div>
                                                                    
                                                                    <div id="upDiv2" runat="server" style="padding-top:40px" visible="false">
                                                                    <asp:Button ID="Button1" runat="server" Text="Supprimer Cet Employé" CssClass="button" OnClick="Button1_Click"/>
                                                                    <br />
                                                                        <asp:Label ID="Label1" runat="server" Text="Employé n'existe pas dans WebUser" Style="display:none; color:red"></asp:Label>
                                                                    <br /><br /><br /><br /><br /><br />
                                                                    <asp:DropDownList ID="AGC2" runat="server" Font-Names="consolas"></asp:DropDownList>
                                                                    <br /><br />
                                                                    <asp:Button ID="Button2" runat="server" Text="Ajouter L'employé avec Cette Agence" CssClass="button" OnClick="Button2_Click" />
                                                                        <br />
                                                                        <asp:Label ID="Label2" runat="server" Text="Employé existe déja" Style="display:none; color:red"></asp:Label>
                                                                    </div>
                                                                </div>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </asp:View>
                                                <asp:View ID="View3" runat="server">
                                                    <table style="width: 100%; background-color: #fcfcfc; border-top: solid; border-top-width: 2px; border-top-color: #07a0a0">
                                                        <tr>
                                                            <td>
                                                                <div style="min-height: 350px;">
                                                                    
                                                                    <div id="info3" runat="server" class="info">

                                                                        <h4 style="text-align: center; font-family: Consolas; color:#1C5E55">INFORMATIONS:</h4>
                                                                        <p><strong>Nom et Prénom :</strong> 
                                                                            <asp:Label ID="Nom3" runat="server"></asp:Label>
                                                                        </p>
                                                                        <p><strong>Email :</strong> 
                                                                            <asp:Label ID="Email3" runat="server"></asp:Label></p>
                                                                        <p><strong>Matricule :</strong>
                                                                            <asp:Label ID="Matric3" runat="server"></asp:Label></p>
                                                                        <p><strong>Fonction :</strong>
                                                                            <asp:Label ID="Fonct3" runat="server"></asp:Label></p>
                                                                        <p><strong>Structure :</strong>
                                                                            <asp:Label ID="Struct3" runat="server"></asp:Label></p>
                                                                        <p style="text-align: center">
                                                                            <asp:Label ID="Existence3" runat="server"></asp:Label></p>
                                                                        <p style="text-align: center">
                                                                            <asp:Label ID="ExistProfil3" runat="server"></asp:Label></p>

                                                                    </div>
                                                                    <div id="upDiv3" runat="server" visible="false">
                                                                        <br /><br /><br />
                                                                    <p style="font-family:Tahoma; font-size:14px">Sélectionnez/Désélectionnez les états qui vouz voulez<br /> ajouter/supprimer, et appuyez sur
                                                                    "Mettre à Jour"</p>
                                                                    <br /><br /><br /><br /><br />
                                                                    
                                                                    <asp:Button ID="Button3" runat="server" Text="Mettre à Jour" CssClass="button" OnClick="Button3_Click" />
                                                                    </div>

                                                                   
                                                                <table id="cboxlist" style="margin-top:120px">
                                                                    <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>
                                                                </table>
                                                                     
                                                                    
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
            </div>
        


        </div>
    </form>

</body>
</html>
