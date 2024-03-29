<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>
<asp:content contentPlaceHolderID="MainContent" runat="server">

    <% using (Html.Configurator("The window should...")
                  .PostTo("firstlook", "window")
                  .Begin())
       { %>
        <ul>
            <li><%= Html.CheckBox("modal", false, "be <strong>modal</strong> (no interaction is allowed below it)")%></li>
            <li><%= Html.CheckBox("scrolling", true, "show <strong>scrollbars</strong> when its content overflows")%></li>
            <li><%= Html.CheckBox("resizable", true, "allow to be <strong>resized</strong>")%></li>
            <li><%= Html.CheckBox("movable", true, "allow to be <strong>moved</strong>")%></li>
        </ul>
        <button class="t-button" type="submit">Apply</button>
    <% } %>
    
    <% Html.Telerik().Window()
           .Name("Window")
           .Title("Telerik Window for ASP.NET MVC")
           .Draggable((bool)ViewData["movable"])
           .Resizable(resizing => resizing
               .Enabled((bool)ViewData["resizable"])
               .MinHeight(250)
               .MinWidth(250)
               .MaxHeight(500)
               .MaxWidth(500)
            )
           .Scrollable((bool)ViewData["scrolling"])
           .Modal((bool)ViewData["modal"])
           .Buttons(b => b.Maximize().Close())
           .Content(() =>
           {%>
                <p style="text-align: center">
                    <img src="<%= Url.Content("~/Content/Window/window.png")%>"
                         alt="Window for ASP.NET MVC logo" style="display:block;margin:0 auto 10px;" />
                            
                    The Telerik Window for ASP.NET MVC is<br /> the right choice for creating Window dialogs<br />
                    and alert/prompt/confirm boxes<br /> in your ASP.NET MVC applications.
                </p>
           <%})
           .Width(300)
           .Height(300)
           .Render();
    %>
    
    <% Html.Telerik().ScriptRegistrar()
           .OnDocumentReady(() => {%>
                var windowElement = $('#Window');
                var undoButton = $('#undo');
                undoButton
                    .bind('click', function(e) {
                        windowElement.data('tWindow').open();
                        undoButton.hide();
                    })
                    .toggle(!windowElement.is(':visible'));
                
                windowElement.bind('close', function() {
                    undoButton.show();
                });
           <%}); %>
           
    <span id="undo" class="t-group">Click here to open the window.</span>
           
</asp:content>

<asp:content contentplaceholderid="HeadContent" runat="server">
    <style type="text/css">
        .example form
        {
            margin-bottom: 150px;
            width: 350px;
            float: right;
        }
        
        #undo
        {
            text-align: center;
            position: absolute;
            white-space: nowrap;
            border-width: 1px;
            border-style: solid;
            padding: 2em;
            cursor: pointer;
        }
    </style>
</asp:content>