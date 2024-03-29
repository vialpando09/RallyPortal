﻿<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
<%= Html.Telerik().Grid<EmployeeViewModel>()
        .Name("Employees")
        .Columns(columns =>
        {
            columns.Bound(e => e.FirstName).Width(140);
            columns.Bound(e => e.LastName).Width(140);
            columns.Bound(e => e.Title).Width(200);
            columns.Bound(e => e.Country).Width(200);
            columns.Bound(e => e.City);
        })
        .ClientEvents(events => events.OnRowDataBound("employees_onRowDataBound"))
        .DetailView(details => details.ClientTemplate(
                Html.Telerik().TabStrip()
                    .Name("TabStrip_<#= EmployeeID #>")
                    .SelectedIndex(0)
                    .Items(items =>
                    {
                        items.Add().Text("Orders").Content(
                                Html.Telerik().Grid<OrderViewModel>()
                                    .Name("Orders_<#= EmployeeID #>")
                                    .Columns(columns =>
                                    {
                                        columns.Bound(o => o.OrderID).Width(101);
                                        columns.Bound(o => o.ShipCountry).Width(140);
                                        columns.Bound(o => o.ShipAddress).Width(200);
                                        columns.Bound(o => o.ShipName).Width(200);
                                        columns.Bound(o => o.ShippedDate).Format("{0:d}");
                                    })
                                    .DataBinding(dataBinding => dataBinding.Ajax()
                                        .Select("_OrdersForEmployeeDetailsAjax", "Grid", new { employeeID = "<#= EmployeeID #>" }))
                                    .Pageable()
                                    .Sortable()
                                    .Filterable()
                                    .ToHtmlString());
                        items.Add().Text("Contact Information").Content(
                            "<div class='employee-details'>" +
                                "<img src='" + Url.Content("~/Content/Grid/Employees/") +
                                    "<#= EmployeeID#>.jpg' alt='<#= FirstName #> <#= LastName #>' />" +
                                "<ul>" +
                                    "<li><label>Birth Date:</label><#= $.telerik.formatString('{0:d}', BirthDate) #></li>" +
                                    "<li><label>Country:</label><#= Country #></li>" +
                                    "<li><label>City:</label><#= City #></li>" +
                                    "<li><label>Address:</label><#= Address #></li>" +
                                    "<li><label>Home Phone:</label><#= HomePhone #></li>" +
                                "</ul>" +
                            "</div>"
                            );
                    })
                    .ToHtmlString()
        ))
        .DataBinding(dataBinding => dataBinding.Ajax().Select("_EmployeesDetailsAjax", "Grid"))
        .Pageable(paging => paging.PageSize(5))
        .Scrollable(scrolling => scrolling.Height(555))
        .Sortable()
    %>
    <script type="text/javascript">
    
    function expandFirstRow(grid, row) {
        if (grid.$rows().index(row) == 0) {
            grid.expandRow(row);
        }
    }
    
    function employees_onRowDataBound(e) {
        var grid = $(this).data('tGrid');
        expandFirstRow(grid, e.row);
    }
    </script>
</asp:Content>
<asp:Content ID="Content2" contentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
	    .employee-details ul
	    {
	        list-style:none;
            font-style:italic;
            margin-left:80px;
            margin-bottom: 20px;
	    }
	    .employee-details img
	    {
	        border: 1px solid #05679D;
	        float: left;
	    }
	    
	    .employee-details label
	    {
	        display:inline-block;
	        width:90px;
	        font-style:normal;
	        font-weight:bold;
	    }
    </style>
</asp:Content>