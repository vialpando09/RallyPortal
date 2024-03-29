<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<asp:content contentPlaceHolderID="MainContent" runat="server">
    <% Html.BeginForm(); %>
        <label for="delay">Delay:</label>
        <%= Html.Telerik().TimePicker()
                .Name("delay")
                .Value(DateTime.Now)
        %>
        <br />
        <label for="deliveryDate">Delivery date:</label>
        <%= Html.Telerik().DatePicker()
                .Name("deliveryDate")
                .Value(DateTime.Now)
        %>
        <br />
        <label for="orderDateTime">Order date time:</label>
        <%= Html.Telerik().DateTimePicker()
                .Name("orderDateTime")
                .Value(DateTime.Now)
        %>
        <p>
            <button class="t-button" type="submit">Save</button>
        </p>

    <% Html.EndForm(); %>
    
    <% if (ViewData["delay"] != null)
       { %>
            <p><strong>Posted value from TimePicker is : <%= Convert.ToDateTime(ViewData["delay"]).TimeOfDay %></strong></p>
    <% } %>

    <% if (ViewData["deliveryDate"] != null)
       { %>
            <p><strong>Posted value from DatePicker is : <%= ViewData["deliveryDate"] %></strong></p>
    <% } %>
    
    <% if (ViewData["orderDateTime"] != null)
       { %>
            <p><strong>Posted value from DateTimePicker is : <%= ViewData["orderDateTime"] %></strong></p>
    <% } %>	

    <noscript>
        <p>Your browsing experience on this page will be better if you visit it with a JavaScript-enabled browser / if you enable JavaScript.</p>
    </noscript>

    <% Html.RenderPartial("AccessibilityValidation"); %>
</asp:content>