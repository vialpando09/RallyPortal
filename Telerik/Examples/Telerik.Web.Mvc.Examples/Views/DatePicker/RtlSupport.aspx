﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<asp:content contentPlaceHolderID="MainContent" runat="server">
    <div class="t-rtl">
        <h3>DatePicker</h3>
        <%= Html.Telerik().DatePicker()
                .Name("DatePicker")
                .Value(DateTime.Today)
        %>

        <h3>TimePicker</h3>
        <%= Html.Telerik().TimePicker()
                .Name("TimePicker")
                .Value(DateTime.Today)
        %>
        
        <h3>DateTimePicker</h3>
        <%= Html.Telerik().DateTimePicker()
                .Name("DateTimePicker")
                .Value(DateTime.Today)
        %>
    </div>
</asp:content>