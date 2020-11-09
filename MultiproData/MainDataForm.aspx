<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="MainDataForm.aspx.vb" Inherits="MultiproData.MainDataForm" EnableEventValidation="false" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>
    <script type="text/javascript" src="js/gridfile.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.jquery.min.js"></script>
    <script type="text/javascript" src="js/gridsearch.js"></script>
    <script type="text/javascript" src="js/datee.js"></script>
    <%--<link rel="stylesheet" href="css/StyleSheetPartyInfo.css" />--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/chosen/1.8.7/chosen.min.css"/>
    <link rel="stylesheet" href="css/StyleSheetData.css" />
    <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/smoothness/jquery-ui.css" />
    <style type="text/css">
        .auto-style1 {
            width: 100%;
        }
        .auto-style2 {
            width: 447px;
        }
         .auto-style21 {
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
<asp:Panel ID="Panel1" runat="server">
        <div class="mainbox">
           
            <table class="auto-style1">
               
                <thead colspan="2">
                    <tr>
                        <th id="head"><%--<asp:Image ID="Image1" runat="server" ImageUrl="~/images/download.jpg" Height="50px" Style="border-radius:5px;text-align:center" />--%>
                            <h2>Party Details</h2>
                        </th>
                    </tr>
                </thead>
                    
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="Label1" runat="server" Text="Party Name" CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxParty" runat="server" CssClass="textbox"></asp:TextBox>
                    </td>
                    <td>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ErrorMessage="Required Field" ControlToValidate="TextBoxParty"></asp:RequiredFieldValidator>
                        </td>
                </tr>
                <tr>
                    <td class="auto-style3">
                        <asp:Label ID="LabelContact" runat="server" Text="Contact Number"  CssClass="label"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxContact" runat="server" CssClass="textbox"></asp:TextBox>
                        <td>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ErrorMessage="Wrong Contact Number" ControlToValidate="TextBoxContact" ValidationExpression="[0-9]{10}"></asp:RegularExpressionValidator>
                   </td>
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
                <caption>
                    <br>
                    <tr>
                        <td class="auto-style21" colspan="2">
                            <br>
                            <asp:Button ID="ButtonAddp" runat="server" cssclass="submit" Text="Add" />
                            <asp:Button ID="ButtonClosep" runat="server" CssClass="submit" Text="Close" />
                            <br></br>
                            </br>
                        </td>
                        <caption>
                            <br></br>
                        </caption>
                    </tr>
                    <tr>
                        <td class="auto-style21">&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    </br>
                </caption>
            </table>

        </div>
     </asp:Panel>
        <asp:Panel ID="Panel2" runat="server">
        <div class="allbox">
           
            <table class="auto-style1" >
                <tr>
                    <td>
                        <asp:Label ID="LabelDate" runat="server" class="uslabel" Text="Date"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxDate" runat="server" class="usinput" AutoPostBack="false"  TabIndex="1" Font-Bold="True" Font-Size="X-Large" onclick="datepic()" ></asp:TextBox>
                        <%--onkeyup="Search_Gridview(this)"--%>
                        <asp:Button ID="ButtonSearch" runat="server" CssClass="searchbtn" Text="Search" CausesValidation="False" TabIndex="2" />
                    <%--  <asp:RegularExpressionValidator runat="server" ForeColor = "Red" ControlToValidate="TextBoxDate"
            ValidationExpression="(((0|1)[0-9]|2[0-9]|3[0-1])\-(0[1-9]|1[0-2])\-((19|20)\d\d))$"
            ErrorMessage="Invalid date format."/>--%>
                    </td>
               
                    <td>
                        <asp:Label ID="LabelParty" runat="server" Text="Party" class="uslabel"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:DropDownList ID="DropDownListParty" runat="server" CssClass="usinput" DataSourceID="SqlDataSource1" DataTextField="PartyName" DataValueField="PartyName" TabIndex="3">
                            <asp:ListItem Value="0">AddNew</asp:ListItem>
                        </asp:DropDownList>
                        <asp:Button ID="ButtonNewParty" runat="server" CssClass="newpartybtn" Text="AddNew" AutoPostBack="true" CausesValidation="False" TabIndex="4" />
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:MultiproDataConnectionString %>" SelectCommand="SELECT [PartyName] FROM [PartyInfo]"></asp:SqlDataSource>
                    </td>
                    <td>
                        <asp:Button ID="ButtonSave" runat="server" Text="Save" AutoPostBack="true" CssClass="submitClose" TabIndex="7"   />
                        
                    </td>
                </tr>
                <tr>
                    <td>
                        <asp:Label ID="LabelProblem" runat="server" Text="Problem" class="uslabel"></asp:Label>
                    </td>
                    <td>
                        <asp:TextBox ID="TextBoxProblem" runat="server" class="usinput" CausesValidation="True" TabIndex="5"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ForeColor = "Red" ControlToValidate="TextBoxProblem" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                        </td>
               
                    <td>
                        <asp:Label ID="LabelRemarks" runat="server" Text="Remarks" class="uslabel"></asp:Label>
                    </td>
                    <td class="auto-style2">
                        <asp:TextBox ID="TextBoxRemarks" runat="server" class="usinput" CausesValidation="True" TabIndex="6"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ForeColor = "Red" ControlToValidate="TextBoxRemarks" ErrorMessage="Required Field"></asp:RequiredFieldValidator>
                        </td>
                   
                     <td>
                        <asp:Button ID="ButtonEdit" runat="server" Text="Edit" CssClass="submitClose" CausesValidation="false" TabIndex="8" />
                    </td>
                </tr>
                <tr>
                    <td colspan="4"><br>
                        
                        <br />
                    </td>
                     <td>
                        <asp:Button ID="ButtonClose" runat="server"  Class="submitClose" Text="LogOut" AutoPostBack="true"  CausesValidation="False" TabIndex="9" />
                        </td>
                   
                    <td>&nbsp;</td>
                </tr>
            </table><br>
            <div class="grid_scroll">
            <asp:GridView ID="GridView1" runat="server" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="1" ForeColor="Black" GridLines="Horizontal" Width="100%" Height="180px" Style="text-align:left" EmptyDataText="No Records Found" HorizontalAlign="Center" SelectedRow="">
                <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"></HeaderStyle>

                <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>

                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White" ></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#F7F7F7" ></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
            </asp:GridView>
                </div>
            <%--<asp:SqlDataSource runat="server" ID="SqlDataSource2" ConnectionString='<%$ ConnectionStrings:MultiproDataConnectionString %>' SelectCommand="SELECT * FROM [CmpnyInfo]"></asp:SqlDataSource>--%>
            <script>
    $('#<%=DropDownListParty.ClientID%>').chosen();
</script>
        </div>
             </asp:Panel>
    </form>
</body>
</html>
