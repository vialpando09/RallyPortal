<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content ID="Content1" contentPlaceHolderID="MainContent" runat="server">
<%= Html.Telerik().Grid<EditableCustomer>()
        .Name("Grid")
        .DataKeys(keys => keys.Add(c => c.CustomerID))
        .Columns(columns =>
        {
            columns.Bound(c => c.CustomerID).Title("Picture");
            columns.Bound(c => c.ContactName).Title("Name");
            columns.Bound(c => c.CompanyName);
            columns.Bound(c => c.Country);
            columns.Bound(c => c.Address);
            columns.Bound(c => c.Phone);
        })
        .ClientRowTemplate(grid => "<div class='employee-details'>" +
                                "<img class='t-widget' src='" + Url.Content("~/Content/Grid/Customers/") +
                                    "<#= CustomerID#>.jpg' alt='<#= ContactName #>' title='<#= ContactName #>' />" +
                                "<h3 class='t-widget'><#= ContactName #></h3>" +
                                "<dl>" +
                                    "<dt>Name:</dt><dd><#= ContactName #></dd>" +
                                    "<dt>Company:</dt><dd><#= CompanyName #></dd>" +
                                    "<dt>Country:</dt><dd><#= Country #></dd>" +
                                "</dl><dl class='t-widget'>" +
                                    "<dt>Address:</dt><dd><#= Address #></dd>" +
                                    "<dt>Phone:</dt><dd><#= Phone #></dd>" +
                                "</dl>" +
                            "<div class='commands'>" + grid.EditButton(null) + grid.DeleteButton(null) + "</div>" +
                            "</div>"
        )
        .DataBinding(dataBinding => dataBinding.Ajax()
            .Select("ClientRowTemplate_Select", "Grid")
            .Update("ClientRowTemplate_Update", "Grid")
            .Delete("ClientRowTemplate_Delete", "Grid"))
        .Sortable()
        .Filterable()
        .Editable(editing => editing.Mode(GridEditMode.PopUp))
        .Scrollable(scrolling => scrolling.Height(500))
        .Pageable()
 %>
</asp:Content>
<asp:Content contentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .employee-details
        {
            padding:.8em .6em;
            display:inline-block;
        }
        .employee-details
        {
            display:block;
        }
        
        .employee-details:after
        {
            content:"";
            display:block;
            clear:both;
        }
        
        .employee-details dl,
        .employee-details dt,
        .employee-details dd
        {
            margin:0;
            padding:0;
        }
        
        .employee-details img,
        .employee-details h3,
        .employee-details dl,
        .commands
        {
            float:left;
            clear:none;
            margin:0 14px 0 0;
        }

        .employee-details h3,
        .employee-details dl
        {
            width:200px;
            min-height:115px;
            border-width:0 1px 0 0;
            background-color:transparent;
            color:inherit;
        }
        
        .employee-details h3
        {
            width:90px;
            padding:0;
            font-size:1.5em;
            padding-right:20px;
        }
        
        .employee-details dt
        {
            font-weight:bold;
        }

    .field-validation-error
    {
        position: absolute;
        display: block;
    }
    
    * html .field-validation-error { position: relative; }
    *+html .field-validation-error { position: relative; }
    
    .field-validation-error span
    {
        position: absolute;
        white-space: nowrap;
        color: red;
        padding: 17px 5px 3px;
        background: transparent url('<%= Url.Content("~/Content/Common/validation-error-message.png") %>') no-repeat 0 0;
    }
    
    /* in-form editing */
    .t-edit-form-container
    {
        width: 350px;
        margin: 1em;
    }
    
    .t-edit-form-container .editor-label,
    .t-edit-form-container .editor-field
    {
        padding-bottom: 1em;
        float: left;
    }
    
    .t-edit-form-container .editor-label
    {
        width: 30%;
        text-align: right;
        padding-right: 3%;
        clear: left;
    }
    
    .t-edit-form-container .editor-field
    {
        width: 60%;
    }
    </style>
</asp:Content>