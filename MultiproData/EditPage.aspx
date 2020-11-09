<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="EditPage.aspx.vb" Inherits="MultiproData.EditPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/StyleSheetEdit.css" />
     <script type="text/javascript" src="js/gridfile.js"></script>
    <style type="text/css">
        .auto-style1 {
            /*margin-left:150px;*/
    /*margin-right: 50px;*/
        text-align: center;
            border-radius: 100px;
            color: lightcyan; /*background-color: rgb(248, 105, 53);*/;
            background-color: rgb(12, 183, 189);
            font-size: large;
            font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
            resize: both;
            float: right;
        }
    </style>

</head>
<body>
    <form id="form1" runat="server">
        
        <div class="allbox">
         
                <asp:TextBox ID="TextBoxSearch" runat="server" CssClass="usinput"></asp:TextBox>
                <asp:Button ID="ButtonSearch" runat="server" Text="Search" CssClass="submitbtn" />
                <asp:Button ID="ButtonParty" runat="server" Text="EditPartyDetails" CssClass="submitbtn"/>
            <asp:Button ID="ButtonClose" runat="server" Text="Close" CssClass="submitbtn" />
             <div class="grid_scroll">
            <asp:GridView ID="GridView1" runat="server"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="0" ForeColor="Black" GridLines="Horizontal" Width="100%" Height="187px" Style="text-align:center" EmptyDataText="No Records Found" DataKeyNames="Id" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="PDate" ItemStyle-Width="150">
                    <ItemTemplate>
                        <asp:Label ID="lblDate" runat="server" Text='<%# Eval("PDate") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtDate" runat="server" Text='<%# Eval("PDate") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                     </asp:TemplateField>
                <asp:TemplateField HeaderText="Party" ItemStyle-Width="350">
                    <ItemTemplate>
                        <asp:Label ID="lblParty" runat="server" Text='<%# Eval("Party") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtParty" runat="server" Text='<%# Eval("Party") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                     <asp:TemplateField HeaderText="Problems" ItemStyle-Width="350">
                    <ItemTemplate>
                        <asp:Label ID="lblProblem" runat="server" Text='<%# Eval("Problem") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtProblem" runat="server" Text='<%# Eval("Problem") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                     <asp:TemplateField HeaderText="Remarks" ItemStyle-Width="250">
                    <ItemTemplate>
                        <asp:Label ID="lblRemarks" runat="server" Text='<%# Eval("Remarks") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtRemarks" runat="server" Text='<%# Eval("Remarks") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                    
                    
                    
                    <asp:CommandField HeaderText="Edit/Delete"  ShowEditButton="True" ShowDeleteButton="True" ShowHeader="True" />
                
                </Columns>
                <FooterStyle BackColor="#CCCC99" ForeColor="Black"></FooterStyle>

                <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"></HeaderStyle>

                <PagerStyle HorizontalAlign="Right" BackColor="White" ForeColor="Black"></PagerStyle>

                <SelectedRowStyle BackColor="#CC3333" Font-Bold="True" ForeColor="White"></SelectedRowStyle>

                <SortedAscendingCellStyle BackColor="#F7F7F7"></SortedAscendingCellStyle>

                <SortedAscendingHeaderStyle BackColor="#4B4B4B"></SortedAscendingHeaderStyle>

                <SortedDescendingCellStyle BackColor="#E5E5E5"></SortedDescendingCellStyle>

                <SortedDescendingHeaderStyle BackColor="#242121"></SortedDescendingHeaderStyle>
            </asp:GridView>
                </div>
        </div>
<%--        <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
<script type="text/javascript" src="scripts/jquery.blockUI.js"></script>
<script type="text/javascript">
    $(function () {
        BlockUI("GridView1");
        $.blockUI.defaults.css = {};
    });
    function BlockUI(elementID) {
        var prm = Sys.WebForms.PageRequestManager.getInstance();
        prm.add_beginRequest(function () {
            $("#" + elementID).block({ message: '<div align = "center">' + '<img src="images/loadingAnim.gif"/></div>',
                css: {},
                overlayCSS: { backgroundColor: '#000000', opacity: 0.6, border: '3px solid #63B2EB' }
            });
        });
        prm.add_endRequest(function () {
            $("#" + elementID).unblock();
        });
    };
</script>--%>
    </form>
</body>
</html>
