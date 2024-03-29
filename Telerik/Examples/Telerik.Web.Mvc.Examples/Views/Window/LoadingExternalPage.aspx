<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<asp:content contentPlaceHolderID="MainContent" runat="server">
    <% Html.Telerik().Window()
            .Name("Window")
            .Title("http://www.telerik.com/products/aspnet-mvc.aspx")
            .Icon(Url.Content("~/Content/Common/Icons/favicon.png"), "favicon")
            .LoadContentFrom("http://www.telerik.com/products/aspnet-mvc.aspx")
            .Draggable(true)
            .Scrollable(false)
            .Resizable()
            .Width(870)
            .Height(260)
            .Render();
    %>
    
    <!-- spacer -->
    <div style="height: 300px;"></div>
</asp:content>