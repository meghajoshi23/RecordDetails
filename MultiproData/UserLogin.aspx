<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="UserLogin.aspx.vb" Inherits="MultiproData.UserLogin" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
 <link rel="stylesheet"  href="css/StyleSheetLogin.css"/>
    
<script>
javascript:window.history.forward(1);
</script>
    <style type="text/css">
        .auto-style1 {
            text-align: left;
        }
        .auto-style2 {
            text-align: justify;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server">
                <div class="container">
           
         <div class="allbox">
        <div class="box1">
            <table align="center" >
                <thead colspan="2">
                    <th id="head">
                        
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/download.jpg" Height="50px" Style="border-radius:5px;" />
                          <h2> Login Form</h2>
                    </th>
                </thead>
            </table>

        </div>
        <div class="box2">
            <form>
                <table align="center">
                    <tr>
                        <td class="auto-style2">
                            <asp:Label ID="uslabel" runat="server" Text="Username"></asp:Label><br>
                            <asp:TextBox ID="usinput" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><br />
                            <asp:Label ID="passlabel" runat="server" Text="Password"></asp:Label><br>
                            <asp:TextBox ID="passinput" TextMode="Password" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>

                        <td>
                            <br><br>

                            <asp:Button ID="submit" runat="server" Text="Login" />
                        </td>
                    </tr>
                    <tr>

                        <td style="text-align: center;">
                            <a href="NewUser.aspx"style="color:cyan;">Create Account!</a>
                        </td>
                    </tr>
                     <tr>

                        <td style="text-align: center;">
                            <a href="ForgotUserPass.aspx" style="color:cyan;">Forgot Password?</a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
            </div>
           </form>
</body>
</html>
