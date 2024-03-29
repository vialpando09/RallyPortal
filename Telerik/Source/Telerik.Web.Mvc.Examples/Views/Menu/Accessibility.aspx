<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Order>>" %>

<asp:Content contentPlaceHolderID="MainContent" runat="server">

	<% Html.Telerik().Menu()
            .Name("Menu")
            .Items(menu =>
            {
                menu.Add()
                    .Text("ASP.NET MVC")
					.ImageUrl("~/Content/Common/Icons/Suites/mvc.png")
                    .ImageHtmlAttributes(new { alt = "ASP.NET MVC suite logo" })
                    .Items(item =>
                    {
                        item.Add().Text("Grid")
                            .ImageUrl("~/Content/Common/Icons/Mvc/Grid.png")
                            .ImageHtmlAttributes(new { alt = "ASP.NET MVC Grid logo" });
                        
                        item.Add().Text("Menu")
                            .ImageUrl("~/Content/Common/Icons/Mvc/Menu.png")
                            .ImageHtmlAttributes(new { alt = "ASP.NET MVC Menu logo" });
                        
                        item.Add().Text("PanelBar")
                            .ImageUrl("~/Content/Common/Icons/Mvc/PanelBar.png")
                            .ImageHtmlAttributes(new { alt = "ASP.NET MVC PanelBar logo" });
                        
                        item.Add().Text("TabStrip")
                            .ImageUrl("~/Content/Common/Icons/Mvc/TabStrip.png")
                            .ImageHtmlAttributes(new { alt = "ASP.NET MVC TabStrip logo" });
                    });

                menu.Add()
                    .Text("Silverlight")
                    .ImageUrl("~/Content/Common/Icons/Suites/sl.png")
                    .ImageHtmlAttributes(new { alt = "Silverlight suite logo" })
                    .Items(item =>
                    {
                        item.Add().Text("GridView")
                            .ImageUrl("~/Content/Common/Icons/Sl/GridView.gif")
                            .ImageHtmlAttributes(new { alt = "Silverlight GridView logo" });
                        
                        item.Add().Text("Scheduler")
                            .ImageUrl("~/Content/Common/Icons/Sl/Scheduler.gif")
                            .ImageHtmlAttributes(new { alt = "Silverlight Scheduler logo" });
                        
                        item.Add().Text("Docking")
                            .ImageUrl("~/Content/Common/Icons/Sl/Docking.gif")
                            .ImageHtmlAttributes(new { alt = "Silverlight Docking logo" });
                        
                        item.Add().Text("Chart")
                            .ImageUrl("~/Content/Common/Icons/Sl/Chart.gif")
                            .ImageHtmlAttributes(new { alt = "Silverlight Chart logo" });
                        
                        item.Add().Text("... and 28 more!").Url("http://www.telerik.com/products/silverlight.aspx");
                    });

                menu.Add()
                    .Text("ASP.NET AJAX")
                    .ImageUrl("~/Content/Common/Icons/Suites/ajax.png")
                    .ImageHtmlAttributes(new { alt = "ASP.NET AJAX suite logo" })
                    .Items(item =>
                    {
                        item.Add().Text("Grid")
                            .ImageUrl("~/Content/Common/Icons/Ajax/Grid.png")
                            .ImageHtmlAttributes(new { alt = "ASP.NET AJAX Grid logo" });
                        
                        item.Add().Text("Editor")
                            .ImageUrl("~/Content/Common/Icons/Ajax/Editor.png")
                            .ImageHtmlAttributes(new { alt = "ASP.NET AJAX Editor logo" });
                        
                        item.Add().Text("Scheduler")
                            .ImageUrl("~/Content/Common/Icons/Ajax/Scheduler.png")
                            .ImageHtmlAttributes(new { alt = "ASP.NET AJAX Scheduler logo" });
                        
                        item.Add().Text("... and 28 more!").Url("http://www.telerik.com/products/aspnet-ajax.aspx");

                    });

                menu.Add()
                    .Text("Reporting")
					.ImageUrl("~/Content/Common/Icons/Suites/rep.png")
                    .ImageHtmlAttributes(new { alt = "Reporting suite logo" });

                menu.Add()
                    .Text("Sitefinity ASP.NET CMS")
                    .ImageUrl("~/Content/Common/Icons/Suites/sitefinity.png")
                    .ImageHtmlAttributes(new { alt = "Sitefinity CMS logo" });

                menu.Add()
					.HtmlAttributes(new { style = "border-right: 0;" })
                    .Text("Other products")
                    .Items(item =>
                    {
                        item.Add().Text("Web Testing Tools")
                            .ImageUrl("~/Content/Common/Icons/Suites/test.png")
                            .ImageHtmlAttributes(new { alt = "Testing tools logo" });
                        
                        item.Add().Text("WinForms UI Controls")
                            .ImageUrl("~/Content/Common/Icons/Suites/win.png")
                            .ImageHtmlAttributes(new { alt = "Windows Forms suite logo" });

                        item.Add().Text("WPF UI Controls")
                            .ImageUrl("~/Content/Common/Icons/Suites/wpf.png")
                            .ImageHtmlAttributes(new { alt = "WPF suite logo" });
                    });
            })
            .Render();
	%>

    <noscript>
        <p>Your browsing experience on this page will be better if you visit it with a JavaScript-enabled browser / if you enable JavaScript.</p>

	    <style type="text/css">
	        .t-menu .t-item:hover > .t-group
	        {
	            display: block;
	        }
	    </style>
    </noscript>

    <% Html.RenderPartial("AccessibilityValidation"); %>
</asp:Content>