<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PartyInfo.aspx.vb" Inherits="MultiproData.PartyInfo" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/StyleSheetPartyInfo.css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: auto;
        }
        .auto-style3 {
            width: auto;
            text-align: justify;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="allbox">

            <table class="auto-style1">
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="LabelParty" runat="server" Text="Party Name" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxParty" runat="server" CssClass="textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="LabelContact" runat="server" Text="Contact Number"  CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxContact" runat="server" CssClass="textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="LabelStation" runat="server" Text="Station"  CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxStation" runat="server" CssClass="textbox"></asp:TextBox>
                    </td>
                </tr>
                <tr><br>
                    <td class="auto-style2" colspan="2"><br>
                        <asp:Button ID="ButtonAdd" runat="server" Text="Add" cssclass="submit"/>
                  
                        <asp:Button ID="ButtonClose" runat="server" Text="Close" CssClass="submit" />
                    </td>
                </tr>
                <tr>
                    <td class="auto-style2">&nbsp;</td>
                    <td>&nbsp;</td>
                </tr>
            </table>

        </div>
    </form>
</body>
</html>
