<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="acceuil.aspx.cs" Inherits="WebApplication2.acceuil" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
     <style type="text/css">
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
    <div id="entete">
        <img src="..\Images\Ban.jpg" height="80"/>
    </div>
  <div id="contenu">  
    <div class="sidenav">
        <h3>&nbsp;&nbsp;&nbsp;Menu Principal</h3>
        <a href="acceuil.aspx" class="Actif">Accueil</a>
        <a href="WebForm2.aspx" id="GE" runat="server">Gestion Des Etats</a>
        <a href="WebForm3.aspx" id="GP" runat="server">Gestion Des Profils</a>
        <a href="WebForm4.aspx" id="GEP" runat="server" >Gestion Mapping</a>
        <a href="WebForm5.aspx" id="GD" runat="server">Gestion Droits D'Accès</a>
        <a href="notif.aspx" id="GN" runat="server">Gestion Des Notifications</a>

    </div>

    <div class="main">
        <h2 class="capo">Accueil</h2>
       <div class="final">
           <div style="position: relative;text-align: center" >
           <img src="..\Images\acc.jpg" style="width:100%; z-index:-20"/>
           <p style="z-index:20;  position: absolute;top:2%;left: 5%; font-size:17px; text-align:left; font-family:Consolas">Bienvenue sur l'application de gestion de WEB-IT, vous pouvez naviguer dans l'application en utilisant la barre latérale à gauche</p>
          <h2 style="z-index:20;   font-family:Consolas" >Contact</h2>
               <p style="z-index:20;   font-size:17px;  font-family:Consolas" ><b>Adresse:</b> 70 Chemin Larbi Allik - Hydra</p>
               <p style="z-index:20;   font-size:17px;  font-family:Consolas"><b>Tél:</b> 023 48 92 92/ 023 48 92 85</p>
               <p style="z-index:20;   font-size:17px;  font-family:Consolas"> <b>Fax:</b> 023 48 92 53</p>
           </div>
</div>
</div>
</div>
</div> 
</body>
</html>
