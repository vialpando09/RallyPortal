<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Order>>" %>

<asp:Content contentPlaceHolderID="MainContent" runat="server">
<%= Html.Telerik().Grid(Model)
        .Name("Grid")
        .TableHtmlAttributes(new {
            summary = "Listing of all orders in the Northwind database. Each row contains order details for a specific order."
        })
        .Columns(columns =>
		{
			columns.Bound(o => o.OrderID).Width(100);
            columns.Bound(o => o.Customer.ContactName).Width(200);
            columns.Bound(o => o.ShipAddress);
            columns.Bound(o => o.OrderDate).Format("{0:MM/dd/yyyy}").Width(120);
        })
        .Sortable()
        .Pageable()
%>

<noscript>
    <p>Your browsing experience on this page will be better if you visit it with a JavaScript-enabled browser / if you enable JavaScript.</p>
</noscript>

<% Html.RenderPartial("AccessibilityValidation"); %>
</asp:Content>