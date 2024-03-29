<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<OrderInfo>" %>
<asp:content contentPlaceHolderID="MainContent" runat="server">
    
    <% using (Html.BeginForm())
       { %>
        <div id="field-list" class="t-group">
            <h3>Order information</h3>
            <ul>
                <li>
                    <%= Html.LabelFor(m => m.OrderInfoID)%>
                    <%= Html.EditorFor(m => m.OrderInfoID)%>
                    <%= Html.HiddenFor(m => m.OrderInfoID)%>
                </li>
                <li>
                    <%= Html.LabelFor(m => m.Delay) %>
                    <%= Html.EditorFor(m => m.Delay)%>
                </li>
                <li>
                    <%= Html.LabelFor(m => m.DeliveryDate) %>
                    <%= Html.EditorFor(m => m.DeliveryDate)%>
                </li>
                <li>
                    <%= Html.LabelFor(m => m.OrderDateTime) %>
                    <%= Html.EditorFor(m => m.OrderDateTime)%>
                </li>
            </ul>
            <button type="submit" class="t-button">Save</button>
        </div>
    <% } %>

    <% if (ViewData["orderInfo"] != null) 
       { %>
            <h4>OrderInfo saved</h4>
            <%= Html.DisplayForModel(ViewData["orderInfo"])%>
    <% } %>

</asp:content>

<asp:content contentPlaceHolderId="HeadContent" runat="server">
    <style type="text/css">        
        #field-list
        {
            display: inline-block; *display: inline; zoom: 1;
            overflow: hidden;
            border-width: 1px;
            border-style: solid;
            padding: 0 2em 2em;
        } 
        
        #field-list h3
        {
            border-bottom: 1px solid;
        }
        
        #field-list ul
        {
            margin: 0; padding: 0;
        }
        
        #field-list li
        {
            list-style-type: none;
            padding-bottom: 5px;
        }
        
        #field-list label,
        #field-list .label
        {
            display: inline-block; *display: inline; zoom: 1;
            width: 100px; text-align: right; padding-right: 5px;
            padding-top: 2px;
        }
        
        #field-list .text-box
        {
            font: normal 12px Tahoma;
            width: 112px;
        }
        
        #field-list button
        {
            margin: 1em 0 0 14em;
            width: 5em;
        }
        
        #Delay_wrapper, #DeliveryDate_wrapper
        {
            width: 137px;
        }
        
        #OrderDateTime_wrapper
        {
            width: 156px;
        }
        
        #jsonResult
        {
            width: 230px;    
        }
    </style>
</asp:content>