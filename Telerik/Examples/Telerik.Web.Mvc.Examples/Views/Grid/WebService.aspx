<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Examples.Master" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" contentPlaceHolderID="MainContent" runat="server">
<h3>Bound to ASMX Web Service</h3>

<%= Html.Telerik().Grid<Order>()
        .Name("AsmxGrid")
        .Columns(columns =>
		{
            columns.Bound(o => o.OrderID).Width(100);
            columns.Bound(o => o.Customer.ContactName).Width(200);
            columns.Bound(o => o.ShipAddress);
            columns.Bound(o => o.OrderDate).Format("{0:MM/dd/yyyy}").Width(120);
        })
        .DataBinding(dataBinding => dataBinding.WebService().Select("~/Models/Orders.asmx/GetOrders"))
        .Sortable()
		.Pageable()
        .Groupable()
        .Filterable()
        .Scrollable()
%>

<h3>Bound to WCF Web Service using DTO objects</h3>

<%= Html.Telerik().Grid<OrderDto>()
        .Name("WcfGrid")
        .Columns(columns =>
		{
            columns.Bound(o => o.OrderID).Width(100);
            columns.Bound(o => o.ContactName).Width(200);
            columns.Bound(o => o.ShipAddress);
            columns.Bound(o => o.OrderDate).Format("{0:MM/dd/yyyy}").Width(100);
        })
        .DataBinding(dataBinding => dataBinding.WebService().Select("~/Models/Orders.svc/GetOrders"))
        .Groupable()
        .Sortable()
		.Pageable()
        .Filterable()
        .Scrollable()
%>

</asp:Content>