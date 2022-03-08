<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PageAcceuil.aspx.cs" Inherits="WebApplication2.WebForm6" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
       <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css" />
    <style type="text/css">
#box {
    width:320px;
    height:480px;
    background-color:#fff;
    top:50%;
    left:50%;
    position:absolute;
    transform:translate(-50%,-50%);
    box-sizing:border-box;
    padding:125px 30px;
    box-shadow:0 4px 8px 0 rgba(0, 0, 0, 0.8);
         }
body, html {
  margin:0;
  width:0;
  background: url(Images/1.jpg) no-repeat center center fixed; 
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  font-family:'RobotoDraft', 'Roboto', sans-serif;

}
#trust {
    height:100px;
    width:100px;
    position:absolute;
    left:50%;
    transform: translateX(-50%);
    top:5%;
        }
h1 {
    text-align:left;
    font-size:20px;
    padding-bottom:18px;
    padding-top:5px;
    color:#0094ff;
    font-weight: 600;
    text-transform: uppercase;
        }
#box p {
    font-size:15px;
    font-weight:bold;
    margin:0;
    padding:0;
        }
#box input {
    margin-bottom:20px;
    height: 38px;
        }
#box input[type="text"], input[type="password"] {
    border:none;
    border-bottom:1px solid gray;
    font-size:14px;
    transition:ease;
    transition-duration: 0.2s;
    width:200px;
        }

#box input[type="text"]:focus, input[type="password"]:focus {
    outline:none;
    border-bottom: 1px solid #0094ff ;
         }

#Button1 {
    width:100%;
    border:none;
    outline:none;
    background-color:#0094ff;
    font-size:16px;
    color:#fff;
    border-radius:15px;
        }
#Button1:hover {
    background-color:#007aff;
    color:#000;
    cursor:pointer;
        }
#avatar {
    border-radius:50%;
    width:65px;
    height:65px;
    position:absolute;
    top:25%;
    right:10%;
        }
.contain {
      display: flexbox;
      width: 100%;
      margin-bottom: 15px;
        }
.icon {
     padding: 10px;
     background: dodgerblue;
     color: white;
     min-width: 10px;
     text-align: center;
     margin:0;
        }
 </style>
</head>
<body style="font-family: tahoma">
   <div id="box">
       <img id="trust" src="Images\2.png" />
      <img id="avatar" src="Images\Avatar.png" />
       <h1>Se Connecter</h1>
    <form id="form1" runat="server">
       <div class="contain">
          <i class="fa fa-user icon"></i>
          <input id="Text1" type="text" placeholder=" Nom Utilisateur" runat="server" /> 
        </div>
        <div class="contain">
          <i class="fa fa-key icon"></i>
          <input id="Password1" type="password" placeholder=" Mot De Passe" runat="server" />
        </div>
         <asp:Button ID="Button1" runat="server" Text="Connexion" OnClick="Button1_Click"   />
         <asp:Label ID="Label1" runat="server" Text="*Nom utilisateur ou mot de passe est  incorrect." Visible="false"
                    Style=" font-size: 16px; line-height: 20px; color: #ff2121"></asp:Label>
    </form>
   </div> 
    
</body>
</html>
