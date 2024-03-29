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
    
<% using (Html.Configurator("Client API").Begin()) { %>
    <p>
        <button onclick="ExpandPane()" class="t-button">Expand 1<sup>st</sup> pane</button> /
        <button onclick="CollpasePane()" class="t-button">Collapse 1<sup>st</sup> pane</button><br />
        <button onclick="TogglePane()" class="t-button">Toggle 1<sup>st</sup> pane</button>
    </p>

    <label for="paneSize">Pane size:</label>
    <%= Html.Telerik().NumericTextBox()
            .Name("paneSize")
            .DecimalDigits(0)
            .HtmlAttributes(new { style = "margin-right: 1em;" })
            .InputHtmlAttributes(new { style = "width: 40px;" })
            .Value(100)
            .MinValue(50)
            .MaxValue(200)
    %>

    <button onclick="SetPaneSize()" class="t-button">Set 3<sup>rd</sup> pane size</button>
<% } %>
        
	<script type="text/javascript">
		
	    function ExpandPane() {
	        var splitter = $("#Splitter").data("tSplitter");

	        splitter.expand(".t-pane:first");
	    }

	    function CollpasePane() {
	        var splitter = $("#Splitter").data("tSplitter");

	        splitter.collapse(".t-pane:first");
	    }

	    function TogglePane() {
	        var splitter = $("#Splitter").data("tSplitter");

	        splitter.toggle(".t-pane:first");
	    }

        function SetPaneSize() {
	        var splitter = $("#Splitter").data("tSplitter");

	        splitter.size(".t-pane:last", $("[name='paneSize']").val() + "px");
        }
	</script>
			
</asp:content>

<asp:Content ID="Content1" contentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
		
	    .example .configurator
	    {
	        width: 300px;
	        float: right;
	        display: inline;
	    }
	    
	    .configurator p
	    {
	        margin: 0;
	        padding: .4em 0;
	    }
	    
	    .configurator .t-button
	    {
	    	display:inline-block;
	    	width:auto;
	    }
	    
    </style>
</asp:Content>
