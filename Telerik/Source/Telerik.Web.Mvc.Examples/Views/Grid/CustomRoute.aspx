<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Order>>" %>
<asp:Content contentPlaceHolderID="MainContent" runat="server">

<%= Html.Telerik().Grid(Model)
		.Name("Grid")
        .Columns(columns =>
        {
            columns.Bound(o => o.OrderID).Width(100);
            columns.Bound(o => o.Customer.ContactName).Width(200);
            columns.Bound(o => o.ShipAddress);
            columns.Bound(o => o.OrderDate).Format("{0:MM/dd/yyyy}").Width(120);
        })
        .Sortable()
		.PrefixUrlParameters(false)
		.Pageable()
%>
</asp:Content>