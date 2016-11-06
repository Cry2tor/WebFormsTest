<%@ Page Language="C#" AutoEventWireup="true"  MasterPageFile="~/Site.Master" CodeBehind="MainView.aspx.cs" Inherits="WebFormsTest.Site.MainView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <asp:Label ID="title" runat="server" CssClass="title" Font-Size="XX-Large"> 
        Witamy w Agencji Nieruchomości.
    </asp:Label>

    <div class="comboBoxes">
        <asp:Label ID="search" runat="server" CssClass="searchLabel" > Wyszukaj nieruchomość: </asp:Label>
        <div class="comboBox">
            <asp:Label ID="minimalPriceLabel" runat="server" CssClass="comboBoxLabel">Cena minimalna: </asp:Label>
            <asp:TextBox ID="minimalPriceTextBox" CssClass="form-control" runat="server" Width="200" Height="30"></asp:TextBox>
        </div>
        <div class="comboBox">
            <asp:Label ID="maximalPriceLabel" runat="server" CssClass="comboBoxLabel">Cena maksymalna: </asp:Label>
            <asp:TextBox ID="maximalPriceTextBox" CssClass="form-control" runat="server" Width="200" Height="30"></asp:TextBox>
        </div>
        <div class="comboBox">
            <asp:Label ID="bathRoomAmountLabel" runat="server" CssClass="comboBoxLabel">Ilość łazienek: </asp:Label>
            <asp:TextBox ID="bathRoomAmount" CssClass="form-control" runat="server" Width="200" Height="30"></asp:TextBox>
        </div>
        <div class="comboBox">
            <asp:Label ID="bedRoomAmountLabel" runat="server" CssClass="comboBoxLabel">Ilość sypialni: </asp:Label>
            <asp:TextBox ID="bedRoomsAmount" CssClass="form-control" runat="server" Width="200" Height="30"></asp:TextBox>
        </div>
        <div class="comboBox">
            <asp:Label ID="streetLabel" runat="server" CssClass="comboBoxLabel">Ulica: </asp:Label>
            <asp:DropDownList ID="streetComboBox" runat="server" CssClass="form-control" Width="200" Height="30"></asp:DropDownList>
        </div>
        <div class="searchButton">
            <asp:Button ID="searchButton" runat="server" CssClass="btn btn-default" Text="Szukaj" OnClick="searchButton_Click" />
        </div>
    </div>
    <div class="mainViewPictures">
        <asp:Image ID="picture1" runat="server" CssClass="picture1" ImageUrl="~/images/home1.jpg" />
        <asp:Image ID="picture2" runat="server" CssClass="picture2" ImageUrl="~/images/home2.jpg" />
        <asp:Image ID="picture3" runat="server" CssClass="picture3" ImageUrl="~/images/home3.jpg" />
        <asp:Image ID="picture4" runat="server" CssClass="picture4" ImageUrl="~/images/home4.jpg" />
        <asp:Image ID="picture5" runat="server" CssClass="picture5" ImageUrl="~/images/home5.jpg" />
        <asp:Image ID="picture6" runat="server" CssClass="picture6" ImageUrl="~/images/home6.jpg" />
        <asp:Image ID="picture7" runat="server" CssClass="picture7" ImageUrl="~/images/home7.jpg" />
<%--        <asp:Image ID="picture8" runat="server" CssClass="picture8" ImageUrl="~/images/home8.jpg" />
        <asp:Image ID="picture9" runat="server" CssClass="picture9" ImageUrl="~/images/home9.jpg" />--%>
        <%--<div class="picture1"></div>
        <asp:Label ID="picture1" runat="server" CssClass="picture1"></asp:Label>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="false" ShowHeader="false">
                <Columns>
                    <asp:ImageField DataImageUrlField="Value" ControlStyle-Height="200" ControlStyle-Width="200" />
                </Columns>
            </asp:GridView>--%>
    </div>
</asp:Content>
