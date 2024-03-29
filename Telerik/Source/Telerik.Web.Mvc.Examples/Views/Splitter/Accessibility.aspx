<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content contentPlaceHolderID="MainContent" runat="server">

    <%  Html.Telerik().Splitter().Name("Splitter")
            .HtmlAttributes(new { style = "height: 300px; width: 500px; float: left; margin-bottom: 2em;" })
            .Panes(panes =>
            {
                panes.Add()
                    .Collapsible(true)
                    .Content(() =>
                    {%>
                        <p>Left pane</p>
                    <%});

                panes.Add()
                    .Content(() =>
                    {%>
                        <p>Center pane</p>
                    <%});

                panes.Add()
                    .Collapsible(true)
                    .Content(() =>
                    {%>
                        <p>Right pane</p>
                    <%});
            })
            .Render();
    %>

    <noscript>
        <p>Your browsing experience on this page will be better if you visit it with a JavaScript-enabled browser / if you enable JavaScript.</p>
    </noscript>

    <% Html.RenderPartial("AccessibilityValidation"); %>
			
</asp:content>
