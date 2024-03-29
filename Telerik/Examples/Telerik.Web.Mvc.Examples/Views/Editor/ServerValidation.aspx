﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<EmployeeDto>" %>

<asp:content contentplaceholderid="MainContent" runat="server">

    <% using (Html.Configurator("Validation summary").Begin()) { %>
        <%= Html.ValidationSummary() %>
    <% } %>
    
    <% using ( Html.BeginForm() ) { %>
        <div class="editing-section">
            <div class="section-title">Edit Customer</div>

            <ul id="field-list">
                <li>
                    <%= Html.LabelFor(e => e.FirstName) %>
                    <%= Html.TextBoxFor(e => e.FirstName) %>
                    <div class="error"><%= Html.ValidationMessageFor(e => e.FirstName, "The FirstName field is required.")%></div>
                </li>
                <li>
                    <%= Html.LabelFor(e => e.LastName) %>
                    <%= Html.TextBoxFor(e => e.LastName) %>
                    <div class="error"><%= Html.ValidationMessageFor(e => e.LastName, "The LastName field is required.")%></div>
                </li>
                <li>
                    <%= Html.LabelFor(e => e.Notes)%>
                    <%= Html.Telerik().Editor()
                            .Name("Notes")
                            .Encode(false)
                            .HtmlAttributes(new { style = "float: left; width: 345px;" })
                            .Tools(tools => tools
                                .Clear()
                                .Bold().Italic().Underline()
                                .Separator()
                                .CreateLink().Unlink()
                            )
                    %>
                    <div class="error"><%= Html.ValidationMessageFor(e => e.Notes, "The Notes field is required.")%></div>
                </li>
                <li class="action-row">
                    <button class="t-button" type="submit">Save</button>
                </li>
            </ul>
        </div>
    <% } %> 

    <% if (ViewData["notes"] != null)
       { %>
       <p><strong>FirstName : <%: ViewData["FirstName"]%></strong></p>
       <p><strong>LastName : <%: ViewData["LastName"]%></strong></p>
       <p><strong>Notes : <%: ViewData["Notes"] %></strong></p>
    <% } %>

</asp:content>

<asp:content contentplaceholderid="HeadContent" runat="server">

    <style type="text/css">
        .editing-section
        {
            width: 700px;
            margin: 0 auto;
        }
        
        .section-title
        {
            font: 24px Arial,Helvetica,sans-serif;
            border-bottom: 1px solid #989898;
        }
        
        #field-list
        {
            border-top: 1px solid #d1d1d1;
            list-style-type: none;
            margin-top: 0;
            padding: 40px 0 0;
        }
        
        #field-list .field
        {
            list-style-type: none;
            overflow: hidden;
            white-space: nowrap;
        }
        
        #field-list label
        {
            float: left;
            width: 120px; text-align: right; padding-right: 5px;
            vertical-align: top;
            padding-top: 2px;
        }
        
        #field-list input,
        #field-list textarea
        {
            font: normal 12px Tahoma;
        }
        
        #field-list .error
        {
            color: red;
            clear: both;
            margin-left: 125px;
            font: 10px Arial,Helvetica,sans-serif;
            height: 15px;
        }
        
        #field-list .action-row { width: 470px; padding-top: 1.5em; height: 2em; }
        #field-list .action-row .t-button { float:right; width:60px; }
    </style>

</asp:content>