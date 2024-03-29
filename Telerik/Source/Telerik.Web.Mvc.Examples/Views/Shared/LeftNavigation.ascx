<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<%@ Import Namespace="Telerik.Web.Mvc" %>
<% 
    if (ViewData["telerik.web.mvc.products.examples"] != null)
    {
        Html.Telerik().PanelBar()
            .Name("navigation-product-examples")
            .HtmlAttributes(new { @class = "demos-navigation" })
            .BindTo("telerik.web.mvc.products.examples", (item, node) => 
            {
                if (!string.IsNullOrEmpty(node.ControllerName) && !string.IsNullOrEmpty(node.ActionName))
                {
                    item.ControllerName = node.ControllerName.ToLower();
                    item.ActionName = node.ActionName.ToLower();
                }

                item.SpriteCssClasses = "t" + item.Text;
                
                if ("true".Equals(node.Attributes["isNew"]))
                {
                    item.Text += "<span class='isNew'>new</span>";
                    item.Encoded = false;
                }
            })
            .HighlightPath(true)
            .ItemAction(item =>
            {
                if (!item.Items.Any() && !string.IsNullOrEmpty(Request.QueryString["theme"]))
                {
                    item.RouteValues.Add("theme", Request.QueryString["theme"]);
                }

                if (item.Selected)
                {
                    item.HtmlAttributes["class"] = "active-page";
                }

                if (item.Parent != null)
                {
                    item.SpriteCssClasses = "";
                }
            })
            .Render();
    }

    Html.Telerik().PanelBar()
        .Name("navigation-controls")
        .HtmlAttributes(new { @class = "demos-navigation" })
        .BindTo("telerik.web.mvc.products", (item, node) =>
        {
            if (!string.IsNullOrEmpty(node.ControllerName) && !string.IsNullOrEmpty(node.ActionName))
            {
                item.ControllerName = node.ControllerName.ToLower();
                item.ActionName = node.ActionName.ToLower();
            }
            item.SpriteCssClasses = "t" + item.Text;

            if ("true".Equals(node.Attributes["isNew"]))
            {
                item.Text += "<span class='isNew'>new</span>";
                item.Encoded = false;
            }
        })
        .ItemAction(item =>
        {
            if (!item.Items.Any() && !string.IsNullOrEmpty(Request.QueryString["theme"]))
            {
                item.RouteValues.Add("theme", Request.QueryString["theme"]);
            }
        })
        .Render();
%>
