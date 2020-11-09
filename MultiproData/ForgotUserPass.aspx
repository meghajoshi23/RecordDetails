<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="ForgotUserPass.aspx.vb" Inherits="MultiproData.ForgotUserPass" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/StyleSheetLogin.css" />
    <style type="text/css">
        .auto-style1 {
            text-align: justify;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div >
             <div class="container">
           
         <div class="allbox">
        <div class="box1">
            <table align="center">
                <thead colspan="2">
                    <th id="head">
                        
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/download.jpg" Height="50px" Style="border-radius:5px;" />
                          <h2> Reset Password</h2>
                    </th>
                </thead>
            </table>

        </div>
        <div class="box2">
            <form>
                <table align="center">
                    <tr>
                        <td class="auto-style1">
                            <asp:Label ID="uslabel" runat="server" Text="Username"></asp:Label><br>
                            <asp:TextBox ID="usinput" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style1"><br>
                            <asp:Label ID="passlabel" runat="server" Text="Password"></asp:Label><br>
                            <asp:TextBox ID="passinput" TextMode="Password" runat="server"></asp:TextBox>
                        </td>
                    </tr>
                     <tr>
                        <td class="auto-style1"><br>
                            <asp:Label ID="LabelCpass" runat="server" Text="Confirm Password"></asp:Label><br>
                            <asp:TextBox ID="TextBoxCPass" TextMode="Password" runat="server"></asp:TextBox><br>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Does Not Match" ControlToCompare="passinput" ControlToValidate="TextBoxCPass"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field" ControlToValidate="TextBoxCpass"></asp:RequiredFieldValidator>
                            </td>
                    </tr>
                    <tr>

                        <td>
                            <br><br>

                            <asp:Button ID="submit" runat="server" Text="Reset Password" />
                        </td>
                    </tr>
                    <tr>

                        <td style="text-align: center;">
                            <a href="UserLogin.aspx" style="color:cyan;">Login</a>
                        </td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
            </div>
        </div>
    </form>
</body>
</html>
