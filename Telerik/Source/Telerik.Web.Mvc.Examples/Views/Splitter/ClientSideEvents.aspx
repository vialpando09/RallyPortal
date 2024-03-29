<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content contentPlaceHolderID="MainContent" runat="server">

	<script type="text/javascript">
        function onLoad(e) {
            $console.log('#' + this.id + ' loaded');
        }

        function onResize(e) {
            $console.log('OnResize :: Splitter #' + this.id);
        }

        function onExpand(e) {
            $console.log('OnExpand :: Pane #' + e.pane.id + ' from splitter #' + this.id + ' expanded');
        }

        function onCollapse(e) {
            $console.log('OnCollapse :: Pane #' + e.pane.id + ' from splitter #' + this.id + ' collapsed');
        }

        function onContentLoad(e) {
            $console.log('OnContentLoad :: Pane #' + e.pane.id + ' from splitter #' + this.id + ' collapsed');
        }
	</script>

    <%  Html.Telerik().Splitter().Name("Splitter1")
            .HtmlAttributes(new { style = "height: 300px; margin-bottom: 2em;" })
            .Orientation(SplitterOrientation.Vertical)
            .ClientEvents(events => events
                .OnLoad("onLoad")
                .OnResize("onResize")
                .OnExpand("onExpand")
                .OnCollapse("onCollapse")
                .OnContentLoad("onContentLoad")
            )
            .Panes(vPanes =>
            {
                vPanes.Add()
                    .Size("100px")
                    .MinSize("40px")
                    .MaxSize("150px")
                    .HtmlAttributes(new { id = "outer_top_pane" })
                    .Collapsible(true)
                    .Content(() =>
                    {%>
                        <p>Outer splitter : top pane</p>
                    <%});

                vPanes.Add()
                    .Scrollable(false)
                    .Content(() =>
                    {%><% Html.Telerik().Splitter()
                            .Name("Splitter2")
                            .HtmlAttributes(new { style = "height: 100%; width: 100%; border: 0; overflow: hidden;" })
                            .ClientEvents(events => events
                                .OnLoad("onLoad")
                                .OnResize("onResize")
                                .OnExpand("onExpand")
                                .OnCollapse("onCollapse")
                                .OnContentLoad("onContentLoad")
                            )
                            .Orientation(SplitterOrientation.Horizontal)
                            .Panes(hPanes =>
                            {
                                hPanes.Add()
                                    .Size("150px")
                                    .Collapsible(true)
                                    .HtmlAttributes(new { id = "inner_left_pane" })
                                    .Content(() =>
                                    {%>
                                        <p>Inner splitter :: left pane</p>
                                    <%});

                                hPanes.Add()
                                    .Content(() =>
                                    {%>
                                        <p>Inner splitter :: center pane</p>
                                    <%});

                                hPanes.Add()
                                    .Collapsible(true)
                                    .Size("20%")
                                    .HtmlAttributes(new { id = "ajax_pane_1" })
                                    .LoadContentFrom("AjaxView_BasedOnJQuery", "PanelBar");
                            })
                            .Render();
                    %><%});

                vPanes.Add()
                    .Collapsible(true)
                    .Size("25%")
                    .HtmlAttributes(new { id = "ajax_pane_0" })
                    .LoadContentFrom("AjaxView_BasedOnJQuery", "PanelBar");
            })
            .Render();
    %>
    
    <% Html.RenderPartial("EventLog"); %>

</asp:Content>
