<%@ Page Language="vb" AutoEventWireup="false" CodeBehind="PartyDetails.aspx.vb" Inherits="MultiproData.PartyDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" href="css/StyleSheetEdit.css" />
     <script type="text/javascript" src="js/gridfile.js"></script>
    <style type="text/css">
        .auto-style1 {
            text-transform: uppercase;
            border-radius: 100px;
            resize: both;
            margin-top: 0px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <asp:TextBox ID="TextBoxSearch" runat="server" CssClass="auto-style1" Height="40px" Width="265px"></asp:TextBox>
            <asp:Button ID="ButtonSearch" runat="server" Text="Search" CssClass="submitbtn" />
            <asp:Button ID="ButtonClose" runat="server" Text="Close" CssClass="submitbtn" />
        </div>
        <div class="grid_scroll">
            <asp:GridView ID="GridView1" runat="server"  BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" CellPadding="0" ForeColor="Black" GridLines="Horizontal" Width="100%" Height="187px" Style="text-align:center" EmptyDataText="No Records Found" DataKeyNames="Id" AutoGenerateColumns="False">
                <Columns>
                    <asp:TemplateField HeaderText="Party Name" ItemStyle-Width="450">
                    <ItemTemplate>
                        <asp:Label ID="lblPName" runat="server" Text='<%# Eval("PartyName") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtPName" runat="server" Text='<%# Eval("PartyName") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                     </asp:TemplateField>
                <asp:TemplateField HeaderText="Contact Number" ItemStyle-Width="350">
                    <ItemTemplate>
                        <asp:Label ID="lblCNo" runat="server" Text='<%# Eval("ContactNumber") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtCNo" runat="server" Text='<%# Eval("ContactNumber") %>' Width="140"></asp:TextBox>
                    </EditItemTemplate>
                </asp:TemplateField>
                     <asp:TemplateField HeaderText="Station" ItemStyle-Width="350">
                    <ItemTemplate>
                        <asp:Label ID="lblStation" runat="server" Text='<%# Eval("Station") %>'></asp:Label>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtStation" runat="server" Text='<%# Eval("Station") %>' Width="140"></asp:TextBox>
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
    </form>
</body>
</html>
