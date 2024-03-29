<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content contentPlaceHolderID="MainContent" runat="server">

<p>
    Uploaded files
</p>

<% if (TempData.ContainsKey("UploadedAttachments")) { %>
    <div class="t-widget t-upload">
        <ul class="t-upload-files t-reset">
    <% foreach (var attachment in (IEnumerable<string>)TempData["UploadedAttachments"])
       { %>
            <li class="t-file"><span class="t-icon t-success"></span><%= attachment%></li>
    <% } %>
        </ul>
    </div>
<% } else {%>
    -- None --
<% } %>

<p><a href='<%= Url.Action("SyncUpload") %>' class="t-button">Go back</a></p>

</asp:Content>