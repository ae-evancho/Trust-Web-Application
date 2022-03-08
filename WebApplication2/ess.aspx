<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ess.aspx.cs" Inherits="WebApplication2.ess" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>

<style>
body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  position: absolute;
  z-index: 1;
  left: 0;
  background-color: #009788 ;
  overflow-x: hidden;
  padding-top: 20px;
  margin-top:0px;
  width: 180px;
}

.sidenav a {
  padding: 6px 8px 6px 16px;
  text-decoration: none;
  color: #fff;
  display: block;
  padding-top: 10px;
  padding-bottom: 10px;
  font-family: Consolas;
  font-size:14px;
  text-align:left;
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
    background-color:white;
    color:black;
    border-right:solid;
    border-right-color:#ff6a00 ;
    border-right-width:4px;
    }
#entete {
    }
#page {
    position: relative;
    text-align: left;
    margin: 2em auto;
    
    padding: 0;
    width: 900px;
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
  }
.capo {
    margin: 0;
    padding: 0;
    color: white;
    background-color: #009788;
    text-indent: 15px;
    width: 100%;
    line-height: 2;
    display:block;
    font-size: 20px;
    background-image: url(http://www.lria.usthb.dz/plugins/ahuntsic/styles/img/titre-coin.gif);
    background-repeat: no-repeat;
    background-position: top left;
}
.final {
    padding:0.5em;
    clear:both;
    }
    
</style>
 <link href="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/css/select2.min.css?parameter=1" rel="stylesheet" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/select2/4.0.6-rc.0/js/select2.min.js"></script>
    <script src="Scripts/jquery-1.7.1.min.js"></script>
</head>
<body>
<div id="page">  
    <div id="entete">
        <img src="https://www.trustbank.dz/images/banners/qui-sommes-nous.jpg"/>
    </div>
  <div id="contenu">  
    <div class="sidenav">
        <a href="WebForm2.aspx" class="Actif">Gestion Des Etats</a><br /><br />
        <a href="WebForm3.aspx">Gestion Des Profils</a><br /><br />
        <a href="WebForm4.aspx">Gestion Etat_Profil</a><br /><br />
        <a href="#WebForm5.aspx">Gestion Droits D'Accés</a><br /><br />
    </div>

    <div class="main">
        <h2 class="capo">Gestion Des Etats</h2>
       <div class="final">
          
         <p>This sidebar is of full height (100%) and always shown.</p>
        <p>Scroll down the page to see the result.</p>
        <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
        <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
        <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
        <p>Some text to enable scrolling.. Lorem ipsum dolor sit amet, illum definitiones no quo, maluisset concludaturque et eum, altera fabulas ut quo. Atqui causae gloriatur ius te, id agam omnis evertitur eum. Affert laboramus repudiandae nec et. Inciderint efficiantur his ad. Eum no molestiae voluptatibus.</p>
       </div> 
    </div>
  </div>
</div>   
</body>
</html> 