<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SearchResults.aspx.cs" MasterPageFile="~/Site.Master" Inherits="WebFormsTest.Site.SearchResults" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

<%--    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.2/jsgrid.min.css" />
    <link type="text/css" rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.2/jsgrid-theme.min.css" />
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jsgrid/1.5.2/jsgrid.min.js"></script>--%>

        <script src="http://code.jquery.com/jquery-1.11.1.min.js" type="text/javascript"></script>

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
            <%--<asp:DropDownList ID="streetComboBox" runat="server" CssClass="form-control" Width="200" Height="30"></asp:DropDownList>--%>
            <ajaxToolkit:ComboBox ID="streetComboBox" runat="server"  ></ajaxToolkit:ComboBox>
            <%--<ajaxToolkit:DropDownExtender ID="streetCombo" runat="server" TargetControlID="streetComboBox"></ajaxToolkit:DropDownExtender>--%>
            <ajaxToolkit:DropDownExtender ID="dropdown" runat="server" TargetControlID="streetComboBox"></ajaxToolkit:DropDownExtender>
            <ajaxToolkit:RoundedCornersExtender ID="roundedCombo" runat="server" TargetControlID="streetComboBox" />
        </div>
            <div class="searchButton">
                <button type="button" onclick="genDivs()" class="btn button-default">Szukaj</button>
            </div>
    </div>
   <%-- <div class="gridWithHomes">
        <asp:GridView ID="homesGridView" runat="server" SelectMethod="homesGridView_GetData" BorderWidth="3" BorderColor="LightGray"
             AutoGenerateColumns="false" >
            <Columns>
                <asp:BoundField ReadOnly="True" HeaderText="Id" InsertVisible="False"
                    DataField="id" Visible="false" ItemStyle-BorderWidth="3">
                </asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Cena (zł)" InsertVisible="False"
                    DataField="price" SortExpression="price" ItemStyle-BorderWidth="3">
                </asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Ilość łazienek" InsertVisible="False"
                    DataField="bathrooms" ItemStyle-BorderWidth="3">
                </asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Ilość sypialni" InsertVisible="False"
                    DataField="bedrooms" ItemStyle-BorderWidth="3">
                </asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="lokacja" InsertVisible="False"
                    DataField="home_location" ItemStyle-BorderWidth="3">
                </asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Imię i nazwisko właściciela" InsertVisible="False"
                    DataField="contact_name" Visible="false" ItemStyle-BorderWidth="3">
                </asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="" InsertVisible="False"
                    DataField="email_contact" Visible="false" ItemStyle-BorderWidth="3">
                </asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="" InsertVisible="False"
                    DataField="phone" Visible="false" ItemStyle-BorderWidth="3">
                </asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Adres" InsertVisible="False"
                    DataField="home_address" Visible="false" ItemStyle-BorderWidth="3">
                </asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Powierzchnia domu" InsertVisible="False"
                    DataField="square_feet" ItemStyle-BorderWidth="3">
                </asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Rok wybudowania" InsertVisible="False"
                    DataField="year_built" ItemStyle-BorderWidth="3">
                </asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="Ilość garaży" InsertVisible="False"
                    DataField="garages" ItemStyle-BorderWidth="3">
                </asp:BoundField>
                <asp:BoundField ReadOnly="True" HeaderText="" InsertVisible="False"
                    DataField="notes" Visible="false" ItemStyle-BorderWidth="3">
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
    </div>--%>
    <div id="grid" class="gridWithHomes">
        <%--<asp:GridView ID="grdDemo" runat="server"></asp:GridView>--%>
    </div>

<script>
    function generateGrid() {
        $.ajax( {
            type: "POST",
            url: "http://localhost/WebFormsTest/Site/SearchResults.aspx/GetData",
            contentType: "application/json;charset=utf-8",
            data: {},
            dataType: "json",
            success: function ( data ) {
                
            }
        } );
    }

    function genDivs( ) {
        var v = 7;
        var e = document.getElementById( "grid" ); // whatever you want to append the rows to: 
        for ( var i = 0; i < v; i++ ) {
            var row = document.createElement( "div" );
            row.className = "row";
            for ( var x = 0; x < v; x++ ) {                
                if ( i == 0 ) {
                    var cell = document.createElement( "div" );
                    cell.className = "firstRow";
                    cell.innerText = "Cena: ";
                    row.appendChild( cell );
                } else {
                    var cell = document.createElement( "div" );
                    cell.className = "gridsquare";
                    cell.innerText = ( i * v ) + x;
                    row.appendChild( cell );
                }
            }
            e.appendChild( row );
        }
        document.getElementById( "code" ).innerText = e.innerHTML;

    };

function BindGridView() {
    $.ajax( {
        type: "POST",
        url: "http://localhost/WebFormsTest/Site/SearchResults.aspx/GetData",
        contentType: "application/json;charset=utf-8",
        data: {},
        dataType: "json",
        success: function ( data ) {
            debugger;
        }
    } );
}
</script>
<%--    <script type="text/javascript">

        $(document).ready(function () {
            BindGridView();

        });

        function BindGridView() {
            debugger;
            $.ajax({
                type: "POST",
                url: "http://localhost/WebFormsTest/Site/SearchResults.aspx/GetData",
                contentType: "application/json;charset=utf-8",
                data: {},
                dataType: "json",
                success: function (data) {
                    debugger;
                    $("#grdDemo").empty();

                    $("#grdDemo").append("<tr><th>Cena</th> <th>Łazienki</th> <th>Lastname</th> <th>EmailID</th></tr>");

                    if ( data.d.length > 0 ) {
                        window.alert( data.d[0].price );
                        for ( var i = 0; i < data.d.length; i++ ) {
                            $( "#grdDemo" ).append( "<tr><th> " +
                                data.d[i].price + " </th><td>" +
                                data.d[i].bathrooms + "</td> <td>" +
                                data.d[i].Username + "</td> <td>" +
                                data.d[i].EmailID + "</td></tr>" );
                        }
                        $("#gridDemo")
                    }
                },
                error: function (result) {
                    //alert("Error login");

                }
            });
        }
    </script>--%>

    <%--<script>
        function loadDoc() {
            var xhttp = new XMLHttpRequest();
            xhttp.onreadystatechange = function () {
                if ( this.readyState == 4 && this.status == 200 ) {
                    document.getElementById( "demo" ).innerHTML =
                    this.responseText;
                }
            };
            xhttp.open( "GET", "http://localhost/WebFormsTest/Site/SearchResults.cs", true );
            xhttp.send();
        }
    </script>--%>

</asp:Content>