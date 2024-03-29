<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<asp:Content contentPlaceHolderID="MainContent" runat="server">

<% Html.Telerik().Window()
		.Name("Window")
        .Effects(fx =>
        {
            if (ViewData["animation"].ToString() == "expand")
            {
                fx.Expand();
            }
            else if (ViewData["animation"].ToString() == "zoom")
            {
                fx.Zoom();
            }
            else
            {
                fx.Toggle();
            }

            if ((bool)ViewData["enableOpacityAnimation"])
                fx.Opacity();

            fx.OpenDuration((int)ViewData["openDuration"])
              .CloseDuration((int)ViewData["closeDuration"]);
        })
        .Content(() => {
            %>
                <p style="text-align: center">
                    <img src="<%= Url.Content("~/Content/Window/window.png")%>"
                         alt="Window for ASP.NET MVC logo" style="display:block;margin:0 auto 10px;" />
                            
                    The Telerik Window for ASP.NET MVC is<br /> the right choice for creating Window dialogs<br />
                    and alert/prompt/confirm boxes<br /> in your ASP.NET MVC applications.
                </p>
            <%
        })
        .Width(300)
        .Height(220)
        .Render(); %>

<% using (Html.Configurator("Animate with...")
              .PostTo("AnimationEffects", "Window")
              .Begin())
   { %>
   <ul>
         <li>
            <%= Html.RadioButton("animation", "zoom", new { id = "zoom" })%>
            <label for="zoom"><strong>zoom</strong> animation</label>
            <br />
            <%= Html.RadioButton("animation", "toggle", new { id = "toggle" }) %>
            <label for="toggle"><strong>toggle</strong> animation</label>
            <br />
            <%= Html.RadioButton("animation", "expand", new { id = "expand" })%>
            <label for="expand"><strong>expand</strong> animation</label>
            <br />
            <%= Html.CheckBox(
                    "enableOpacityAnimation",
                    (bool)ViewData["enableOpacityAnimation"],
                    "&nbsp;<strong>opacity</strong> animation")%>
        </li>
        <li>
            <ul>
                <li>
                    <label for="openDuration">open for</label>
                    <%= Html.Telerik().NumericTextBox()
                            .Name("openDuration")
                            .DecimalDigits(0)
                            .NumberGroupSeparator("")
                            .MinValue(0).MaxValue(10000)
                            .Value(Convert.ToDouble(ViewData["openDuration"]))
                    %> ms
                </li>
                <li>
                    <label for="closeDuration">close for</label>
                    <%= Html.Telerik().NumericTextBox()
                            .Name("closeDuration")
                            .DecimalDigits(0)
                            .NumberGroupSeparator("")
                            .MinValue(0).MaxValue(10000)
                            .Value(Convert.ToDouble(ViewData["closeDuration"]))
                    %> ms
                </li>
            </ul>
        </li>
    </ul>
    
    <button class="t-button" type="submit">Apply</button>
<% } %>

    <% Html.Telerik().ScriptRegistrar().OnDocumentReady(() => {%>
        /* button for close undo */
        var tWindow = $('#Window');
        var undoButton = $('#undo');
        undoButton
            .bind('click', function(e) {
                tWindow.data('tWindow').open();
                undoButton.hide();
            })
            .toggle(!tWindow.is(':visible'));
                
        tWindow.bind('close', function() {
            undoButton.show();
        });

	    /* client-side validation */
        $('.configurator button').click(function(e) {
            $('.configurator :text').each(function () {
                if ($(this).hasClass('t-state-error')) {
                    alert("TextBox `" + this.name + "` has an invalid param!");
                    e.preventDefault();
                }
            });
        });
    <%}); %>
           
    <span id="undo">Click here to open the window.</span>
	
</asp:Content>


<asp:Content contentPlaceHolderID="HeadContent" runat="server">
	<style type="text/css">
        
        #undo
        {
            text-align: center;
            position: absolute;
            white-space: nowrap;
            border: 1px solid #ccc;
            padding: 2em;
            background: #f1f1f1;
            cursor: pointer;
        }
        
	    .example .configurator
	    {
            width: 400px;
            padding-bottom: 2em;
	        float: right;
	    }
	    
	    .configurator li
		{
		    padding: 3px 0;
		}
		
		.configurator ul ul
		{
		    padding-left: 24px;
		    margin: 0;
		}
		
		.configurator ul ul label
		{
		    width: 48px;
		    margin: 0;
		}
	</style>
</asp:Content>