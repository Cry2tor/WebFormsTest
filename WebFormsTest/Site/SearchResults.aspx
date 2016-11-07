<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchResults.aspx.cs" MasterPageFile="~/Site.Master" Inherits="WebFormsTest.Site.SearchResults" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="title" runat="server" CssClass="title" Font-Size="XX-Large"> Wyniki wyszukiwania: </asp:Label>

        <div class="comboBoxes">
        <asp:Label ID="search" runat="server" CssClass="searchLabel" > Wyszukaj nieruchomość: </asp:Label>
        <div class="comboBox">
            <asp:Label ID="minimalPriceLabel" runat="server" CssClass="comboBoxLabel">Cena minimalna: </asp:Label>
            <asp:TextBox ID="minimalPriceTextBox" runat="server" CssClass="form-control" Width="200" Height="30"></asp:TextBox>
        </div>
        <div class="comboBox">
            <asp:Label ID="maximalPriceLabel" runat="server" CssClass="comboBoxLabel">Cena maksymalna: </asp:Label>
            <asp:TextBox ID="maximalPriceTextBox" runat="server" CssClass="form-control" Width="200" Height="30"></asp:TextBox>
        </div>
        <div class="comboBox">
            <asp:Label ID="bathRoomAmountLabel" runat="server" CssClass="comboBoxLabel">Ilość łazienek: </asp:Label>
            <asp:TextBox ID="bathRoomAmount" runat="server" CssClass="form-control" Width="200" Height="30"></asp:TextBox>
        </div>
        <div class="comboBox">
            <asp:Label ID="bedRoomAmountLabel" runat="server" CssClass="comboBoxLabel">Ilość sypialni: </asp:Label>
            <asp:TextBox ID="bedRoomsAmount" runat="server" CssClass="form-control" Width="200" Height="30"></asp:TextBox>
        </div>
        <div class="comboBox">
            <asp:Label ID="streetLabel" runat="server" CssClass="comboBoxLabel">Ulica: </asp:Label>
            <asp:DropDownList ID="streetComboBox" runat="server" CssClass="form-control" Width="200" Height="30"></asp:DropDownList>
        </div>
            <div class="searchButton">
                <asp:Button ID="searchButton" runat="server" OnClick="searchButton_Click" class="btn button-default" Text="Szukaj"></asp:Button>
            </div>
    </div>
    <%--SelectMethod="homesGridView_GetData"--%>
    <div class="gridWithHomes">
        <asp:UpdatePanel ID="upGrid1" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:GridView ID="homesGridView" SelectMethod="homesGridView_GetData" runat="server" BorderWidth="3px" BorderColor="LightGray"
                    AutoGenerateColumns="False" DataKeyNames="id">
                    <Columns>
                        <%--<asp:BoundField HeaderText="Id" InsertVisible="False"
                    DataField="id" Visible="false" ItemStyle-BorderWidth="3">
                </asp:BoundField>--%>
                        <asp:BoundField ReadOnly="True" HeaderText="Cena (zł)" InsertVisible="False"
                            DataField="price" SortExpression="price" ItemStyle-BorderWidth="3">
                        <ItemStyle BorderWidth="3px" />
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="True" HeaderText="Ilość łazienek" InsertVisible="False"
                            DataField="bathrooms" ItemStyle-BorderWidth="3">
                        <ItemStyle BorderWidth="3px" />
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="True" HeaderText="Ilość sypialni" InsertVisible="False"
                            DataField="bedrooms" ItemStyle-BorderWidth="3">
                        <ItemStyle BorderWidth="3px" />
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="True" HeaderText="lokacja" InsertVisible="False"
                            DataField="home_location" ItemStyle-BorderWidth="3">
                        <ItemStyle BorderWidth="3px" />
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="True" HeaderText="Imię i nazwisko właściciela" InsertVisible="False"
                            DataField="contact_name" Visible="false" ItemStyle-BorderWidth="3">
                        <ItemStyle BorderWidth="3px" />
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="True" HeaderText="" InsertVisible="False"
                            DataField="email_contact" Visible="false" ItemStyle-BorderWidth="3">
                        <ItemStyle BorderWidth="3px" />
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="True" HeaderText="" InsertVisible="False"
                            DataField="phone" Visible="false" ItemStyle-BorderWidth="3">
                        <ItemStyle BorderWidth="3px" />
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="True" HeaderText="Adres" InsertVisible="False"
                            DataField="home_address" Visible="false" ItemStyle-BorderWidth="3">
                        <ItemStyle BorderWidth="3px" />
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="True" HeaderText="Powierzchnia domu" InsertVisible="False"
                            DataField="square_feet" ItemStyle-BorderWidth="3">
                        <ItemStyle BorderWidth="3px" />
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="True" HeaderText="Rok wybudowania" InsertVisible="False"
                            DataField="year_built" ItemStyle-BorderWidth="3">
                        <ItemStyle BorderWidth="3px" />
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="True" HeaderText="Ilość garaży" InsertVisible="False"
                            DataField="garages" ItemStyle-BorderWidth="3">
                        <ItemStyle BorderWidth="3px" />
                        </asp:BoundField>
                        <asp:BoundField ReadOnly="True" HeaderText="" InsertVisible="False"
                            DataField="notes" Visible="false" ItemStyle-BorderWidth="3">
                        <ItemStyle BorderWidth="3px" />
                        </asp:BoundField>
                        <asp:TemplateField>
                            <ItemTemplate>
                                <asp:Button ID="detailsButton" runat="server" Text="Szczegóły"
                                    BorderWidth="3" BorderColor="LightGray"
                                    CssClass="btn button-default" OnClick="detailsButton_Click"
                                    CommandName="rowIndex"
                                    CommandArgument="<%# ((GridViewRow) Container).RowIndex %>" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
            </ContentTemplate>
            </asp:UpdatePanel>
    </div>
   
</asp:Content>