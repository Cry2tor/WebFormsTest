<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Site.Master" CodeBehind="AddAd.aspx.cs" Inherits="WebFormsTest.Site.AddAd" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="form-horizontal">
        <h1 class="title">Dodaj ogłoszenie: </h1>
        <div class="form-group">
            <asp:Label ID="priceLabel" runat="server" CssClass="col-md-2 control-label"><b>Cena: </b></asp:Label>
            <asp:TextBox ID="priceTextBox" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Label ID="bedLabel" runat="server" CssClass="col-md-2 control-label"><b>Ile Łazienek: </b></asp:Label>
            <asp:TextBox ID="bedTextBox" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Label ID="stretLabel" runat="server" CssClass="col-md-2 control-label" ><b>Ulica: </b></asp:Label>
            <asp:TextBox ID="streetTextBox" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Label ID="buildingAreaLabel" runat="server" CssClass="col-md-2 control-label" ><b>Powierzchnia budowy: </b></asp:Label>
            <asp:TextBox ID="buildingAreaTextBox" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Label ID="garageLabel" runat="server" CssClass="col-md-2 control-label"><b>Ilość garaży: </b></asp:Label>
            <asp:TextBox ID="garageTextBox" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Label ID="phoneLabel" runat="server" CssClass="col-md-2 control-label"><b>Telefon: </b></asp:Label>
            <asp:TextBox ID="phoneTextBox" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Label ID="districtLabel" runat="server" CssClass="col-md-2 control-label"><b>Okręg: </b></asp:Label>
            <asp:TextBox ID="districtTextBox" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Label ID="bathLabel" runat="server" CssClass="col-md-2 control-label"><b>Ilość łazienek: </b></asp:Label>
            <asp:TextBox ID="bathTextBox" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Label ID="buildDateLabel" runat="server" CssClass="col-md-2 control-label"><b>Rok budowy: </b></asp:Label>
            <asp:TextBox ID="buildDateTextBox" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Label ID="contactNameLabel" runat="server" CssClass="col-md-2 control-label"><b>Imię i Nazwisko: </b></asp:Label>
            <asp:TextBox ID="contactNameTextBox" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Label ID="emailLabel" runat="server" CssClass="col-md-2 control-label"><b>Email: </b></asp:Label>
            <asp:TextBox ID="emailTextBox" runat="server" CssClass="form-control" />
        </div>

        <div class="form-group">
            <asp:Label ID="noticesLabel" runat="server" CssClass="col-md-2 control-label"><b>Notatki: </b></asp:Label>
            <asp:TextBox ID="noticesTextBox" runat="server" CssClass="form-control" />
        </div>
        <div class="form-group">
            <asp:Label ID="fileUploadLabel" runat="server" CssClass="col-md-2 control-label"><b>Dodaj Zdjęcie: </b></asp:Label>
            <%--<asp:FileUpload ID="FileUpload1" runat="server" CssClass="btn btn-default" />--%>
            <%--<ajaxToolkit:ToolkitScriptManager runat="server" />--%>
            <ajaxToolkit:AjaxFileUpload ID="AjaxFileUpload1" runat="server" UseAbsoluteHandlerPath="true" AllowedFileTypes="jpg,jpeg,gif,png" OnUploadComplete="AjaxFileUpload1_UploadComplete" />
        </div>
        </div>
    <div>
        <asp:Button ID="uploadAd" runat="server" Text="Dodaj ogłoszenie" OnClick="uploadAd_Click" CssClass="btn btn-default"/>
    </div>
</asp:Content>