<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Order>>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <%Html.Telerik().Grid(Model)
        .Name("Grid")
        .ToolBar(toolBar => toolBar.Template(grid =>
                                    { %>
    <label class="customer-label" for="Customers-input">
        Show orders for customer:</label>
        <% Html.Telerik().ComboBox()
                    .Name("Customers")
                    .DataBinding(binding => binding.Ajax().Select("_GetCustomers", "Grid"))                                        
                    .AutoFill(true)
                    .Filterable(filtering =>
                    {
                        filtering.FilterMode(AutoCompleteFilterMode.StartsWith);
                    })                    
                    .HtmlAttributes(new { style = "width: 300px" })
                    .HighlightFirstMatch(true)
                    .ClientEvents(events => events.OnChange("customerChange").OnLoad("onComboBoxLoad"))
                    .SelectedIndex(0)
                    .Render();
          %>
          <%=grid.CustomCommandToolBarButton("viewDetails", "Customer Details", "ViewCustomerDetails", "Grid", null, true, GridButtonType.Text)%>
    <% }))
        .Columns(columns =>
        {
            columns.Bound(o => o.OrderID).Width(100);
            columns.Bound(o => o.Customer.CompanyName);
            columns.Bound(o => o.ShipAddress);
            columns.Bound(o => o.OrderDate).Format("{0:MM/dd/yyyy}").Width(100);
        })
        .ClientEvents(clientEvents => clientEvents.OnDataBinding("dataBinding")
                                        .OnComplete("onComplete")
                                        .OnCommand("onCommand"))
        .DataBinding(dataBinding => dataBinding.Ajax().Select("_CustomToolBar", "Grid"))
        .Pageable()
        .Sortable()
        .Render();
    %>
    <% Html.Telerik().Window()
        .Name("Details")
        .Visible(false)
        .Title("Customer Details")
        .Modal(true)
        .Width(500)
        .Height(200)
        .Content(() =>
            {
    %>
    <div id="customer-details">
        <img />
        <h2>
        </h2>
        <em></em>
        <address>
        </address>
        <dl>
            <dt>Phone:</dt>
            <dd>
            </dd>
        </dl>
    </div>
    <%
            })
        .Render();
    %>
    <script type="text/javascript">       

        function customerChange() {
            $("#Grid").data("tGrid").rebind();
        }

        function dataBinding(args) {
            args.data = $.extend(args.data, { customerID: selectedCustomer() });
        }
        
        function selectedCustomer() {
            return $("#Customers").data("tComboBox").value();
        }

        function onComboBoxLoad() {
            $(this).data("tComboBox").fill();
        }

        function onCommand(e) {
            if (e.name == "viewDetails") {
                //send the selected customerID to the server
                var customerID = selectedCustomer();
                if (!customerID) {
                    e.preventDefault();
                    alert("Please select a customer!");
                    return;
                }
                e.data = $.extend(e.data, { customerID: selectedCustomer() });
            }
        }

        function onComplete(e) {
            if (e.name == "viewDetails") {
                //show the customer's details 
                var detailWindow = $("#Details").data("tWindow");
                var customer = e.response.customer;
                $("#customer-details")
                    .find("img")
                    .attr("src", '<%= Url.Content("~/Content/Grid/Customers/") %>' +
                        customer.CustomerID + ".jpg")
                    .end()
                    .find("h2")
                    .text(customer.ContactName)
                    .end()
                    .find("em")
                    .text(customer.ContactTitle + ", " + customer.CompanyName)
                    .end()
                    .find("address")
                    .text(customer.Address + ", " + customer.City + ", " + customer.Country)
                    .end()
                    .find("dd")
                    .text(customer.Phone);
                        detailWindow.center().open();
            }
        }
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .customer-label
        {
            vertical-align: middle;
            padding-right: .4em;
        }
        #Customers
        {
            vertical-align: middle;
        }
        #customer-details
        {
            padding: 10px;
            margin: 25px auto;
            width: 300px;
        }
        
        #customer-details h2
        {
            margin: 0;
        }
        
        #customer-details em
        {
            font-style: normal;
            color: #8c8c8c;
        }
        #customer-details address
        {
            margin: 10px 0 0 0;
        }
        
        #customer-details dl
        {
            float: left;
        }
        
        #customer-details dt, #customer-details dd
        {
            margin: 0;
            display: inline;
        }
        
        #customer-details dd
        {
            font-weight: bold;
        }
        
        #customer-details img
        {
            float: left;
            margin: 0 10px 10px 0;
        }
    </style>
</asp:Content>
