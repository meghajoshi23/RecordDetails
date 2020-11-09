<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="NewUser.aspx.vb" Inherits="MultiproData.NewUser" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <link rel="stylesheet" href="css/StyleSheetNewUser.css"
    <title></title>
    </head>
<body>
    <form id="form1" runat="server">
       
                <div class="container">
           
         <div class="allbox">
        <div class="box1">
            <table align="center">
                <thead colspan="2">
                    <th id="head">
                        
                <asp:Image ID="Image1" runat="server" ImageUrl="~/images/download.jpg" Height="50px" Style="border-radius:5px;" />
                          <h2> New User</h2>
                    </th>
                </thead>
            </table>
        </div>
        <div class="box2">
            <form>
                <table align="center">
                    <tr>
                        <td class="box1">
                            <%--<asp:Label ID="uslabel" runat="server" Text="Username"></asp:Label><br>--%>
                            <asp:TextBox ID="usinput" runat="server" placeholder="Username"></asp:TextBox><br>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field" ControlToValidate="usinput"></asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="box1"><br>
                            <%--<asp:Label ID="passlabel" runat="server" Text="Password"></asp:Label><br>--%>
                            <asp:TextBox ID="passinput" TextMode="Password" runat="server" placeholder="Password"></asp:TextBox><br>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ErrorMessage="Required Field" ControlToValidate="passinput"></asp:RequiredFieldValidator>
                            </td>
                    </tr>
                     <tr>
                        <td class="box1"><br>
                            <%--<asp:Label ID="LabelCPass" runat="server" Text="Confirm Password"></asp:Label><br>--%>
                            <asp:TextBox ID="TextBoxCPass" TextMode="Password" runat="server" Placeholder="Confirm Password" ></asp:TextBox><br>
                            <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="Password Not Matched" ControlToCompare="passinput" ControlToValidate="TextBoxCPass"></asp:CompareValidator>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ErrorMessage="Required Field " ControlToValidate="TextBoxCPass"></asp:RequiredFieldValidator>
                             </td>
                    </tr>
                     <tr>
                        <td class="box1" ><br>
                            <%--<asp:Label ID="LabelContact" runat="server" Text="Contact No."></asp:Label><br>--%>
                            <asp:TextBox ID="TextBoxContact"  runat="server" Placeholder="Contact No."></asp:TextBox><br>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Wrong Contact Number" ControlToValidate="TextBoxContact" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="Required Field " ControlToValidate="TextBoxContact"></asp:RequiredFieldValidator>     
                        </td>
                    </tr>
                    <tr>

                        <td>
                            

                            <asp:Button ID="submit" runat="server" Text="Sign In" />
                        </td>
                    </tr>
                    <tr>

                        <td style="text-align: center;">
                            <a href="UserLogin.aspx" style="color:cyan;">Already have an Account!!</a>
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
