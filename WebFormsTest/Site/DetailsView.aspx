<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DetailsView.aspx.cs"  MasterPageFile="~/Site.Master" Inherits="WebFormsTest.Site.DetailsView" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <h1 class="title">Szczegóły ogłoszenia: </h1>
    <div class="form-horizontal row">
        <div class="col-xs-8 col-sm-6">
            <div class="form-group">
                <asp:Label ID="priceLabel" runat="server" CssClass="col-md-2 control-label"><b>Cena: </b></asp:Label>
                <asp:TextBox ID="priceTextBox" Enabled="false" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Label ID="bedLabel" runat="server" CssClass="col-md-2 control-label"><b>Ile Łazienek: </b></asp:Label>
                <asp:TextBox ID="bedTextBox" Enabled="false" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Label ID="stretLabel" runat="server" CssClass="col-md-2 control-label"><b>Ulica: </b></asp:Label>
                <asp:TextBox ID="streetTextBox" Enabled="false" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Label ID="buildingAreaLabel" runat="server" CssClass="col-md-2 control-label"><b>Powierzchnia budowy: </b></asp:Label>
                <asp:TextBox ID="buildingAreaTextBox" Enabled="false" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Label ID="garageLabel" runat="server" CssClass="col-md-2 control-label"><b>Ilość garaży: </b></asp:Label>
                <asp:TextBox ID="garageTextBox" Enabled="false" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Label ID="phoneLabel" runat="server" CssClass="col-md-2 control-label"><b>Telefon: </b></asp:Label>
                <asp:TextBox ID="phoneTextBox" Enabled="false" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Label ID="districtLabel" runat="server" CssClass="col-md-2 control-label"><b>Okręg: </b></asp:Label>
                <asp:TextBox ID="districtTextBox" Enabled="false" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Label ID="bathLabel" runat="server" CssClass="col-md-2 control-label"><b>Ilość łazienek: </b></asp:Label>
                <asp:TextBox ID="bathTextBox" Enabled="false" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Label ID="buildDateLabel" runat="server" CssClass="col-md-2 control-label"><b>Rok budowy: </b></asp:Label>
                <asp:TextBox ID="buildDateTextBox" Enabled="false" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Label ID="contactNameLabel" runat="server" CssClass="col-md-2 control-label"><b>Imię i Nazwisko: </b></asp:Label>
                <asp:TextBox ID="contactNameTextBox" Enabled="false" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Label ID="emailLabel" runat="server" CssClass="col-md-2 control-label"><b>Email: </b></asp:Label>
                <asp:TextBox ID="emailTextBox" Enabled="false" runat="server" CssClass="form-control" />
            </div>

            <div class="form-group">
                <asp:Label ID="noticesLabel" runat="server" CssClass="col-md-2 control-label"><b>Notatki: </b></asp:Label>
                <asp:TextBox ID="noticesTextBox" Enabled="false" runat="server" CssClass="form-control" />
            </div>
        </div>
        <div class="col-xs-4 col-sm-6">
            <div class="imagesGrid">
                <asp:GridView ID="imagesGrid" runat="server" AutoGenerateColumns="false" ShowHeader="false">
                    <Columns>
                        <asp:ImageField DataImageUrlField="image_path" ControlStyle-Height="300" ControlStyle-Width="300" />
                    </Columns>
                </asp:GridView>
            </div>
        </div>
    </div>

</asp:Content>