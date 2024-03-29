<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>
<p>This content was loaded from partial view at <%= DateTime.Now.ToLongTimeString() %></p>
<p>Click refresh button from the configurator to reload the content of the window.</p>
<p>You can also maximize/restore window size.</p>
<p>
    <button onclick="maximizeWindow()">Maximize</button> / <button onclick="restoreWindow()">Restore</button> / <button onclick="centerWindow()">Center</button>
</p>
