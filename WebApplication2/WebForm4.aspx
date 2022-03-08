<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm4.aspx.cs" Inherits="WebApplication2.WebForm4" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" />
   <style type="text/css">

       /*Interieur Style*/


#cboxlist {
    font-family: 'roboto', sans-serif;
    border-top: 2px solid #a0d6b4;
    display:inline-block;
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
#Button1 {
    background-color: #2fa988;
    color: white;
    text-align: center;
    padding: 11px 20px;
    display: inline-block;
    font-size: 12px;
    border: 2px solid;
    transition-duration: 0.4s;
    border-radius:4px;
           }

#Button1:hover {
  opacity:0.5;

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
    <div id="entete">
         <img src="..\Images\Ban.jpg" height="80"/>    </div>
  <div id="contenu">  
    <div class="sidenav">
        <h3>&nbsp;&nbsp;&nbsp;Menu Principal</h3>
        <a href="acceuil.aspx" >Accueil</a>
        <a href="WebForm2.aspx" id="GE" runat="server" >Gestion Des Etats</a>
        <a href="WebForm3.aspx" id="GP" runat="server">Gestion Des Profils</a>
        <a href="WebForm4.aspx" id="GEP" runat="server" class="Actif" >Gestion Mapping</a>
        <a href="WebForm5.aspx" id="GD" runat="server">Gestion Droits D'Accès</a>
        <a href="notif.aspx" id="GN" runat="server">Gestion Des Notifications</a>

    </div>

    <div class="main">
        <h2 class="capo">Gestion Mapping</h2>
       <div class="final">
        
          <form id="form1" runat="server">
    <div style="min-height:550px">
        <div style="padding-left:10px">
        <br /><br />
        <p style="font-family: Consolas">STRUCTURE&nbsp;&nbsp;</p>
        <div class="box">
        <asp:DropDownList ID="STRCT" runat="server" DataTextField="libelle_structure" DataValueField="id_str" OnSelectedIndexChanged="STRCT_SelectedIndexChanged" AutoPostBack="true" Height="22px" Width="500px"></asp:DropDownList>
        </div>
        <br />
        <br />
        <br />
       <p><asp:Label ID="Label1" runat="server" Text="PROFIL" style="font-family:Consolas" Visible="false"></asp:Label></p>
            <div class="box">
        <asp:DropDownList ID="DropDownList1" runat="server" DataTextField ="NOM_PROFIL" DataValueField="ID_PROFIL" OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true" Height="22px" Width="500px">
         
        </asp:DropDownList>
            </div>
        <br />
        <br />
        <br />
        <asp:Button ID="Button1" runat="server" Text="Mettre à Jour" OnClick="Button1_Click" />
            </div>
        <br />
        <br />
        <br />
        <table id="cboxlist">
            <asp:PlaceHolder ID="PlaceHolder1" runat="server"></asp:PlaceHolder>

        </table>
        
        <br />
        &nbsp; &nbsp;
        <br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        &nbsp;<br />
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:HiddenField ID="HiddenField1" runat="server" />
     </div>
 
    </form>

       </div> 
    </div>
  </div>
</div>   
</body>
    
    

</html>
