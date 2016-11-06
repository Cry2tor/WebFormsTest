<%@ Page Title="Kontakt" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Contact.aspx.cs" Inherits="WebFormsTest.Contact" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <h2><%: Title %>.</h2>
    <h3>Jak się z nami skontaktować:</h3>
    <address>
        Paweł Gawron<br />
        75-453 Koszalin<br />
        <abbr title="Phone">Telefon:</abbr>
        666 999 666
    </address>

    <address>
        <strong>Pomoc:</strong>   <a href="mailto:gawron312@gmail.com">gawron312@gmail.com</a>
    </address>
</asp:Content>
