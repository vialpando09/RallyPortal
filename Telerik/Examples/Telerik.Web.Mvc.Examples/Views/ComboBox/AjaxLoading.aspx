<%@ Page Title="" Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<asp:content contentPlaceHolderID="MainContent" runat="server">
     <div class="panel">
        <h3>ComboBox</h3>
        <h4>Ajax</h4>

        <%= Html.Telerik().ComboBox()
                .Name("AjaxComboBox")
                .AutoFill(true)
                .DataBinding(binding => binding.Ajax().Select("_AjaxLoading", "ComboBox"))
                .Filterable(filtering =>
                {
                    filtering.FilterMode(AutoCompleteFilterMode.StartsWith);
                })
                .HighlightFirstMatch(true)
        %>

        <h4>ASMX Web Service</h4>

        <%= Html.Telerik().ComboBox()
                .Name("AsmxComboBox")
                .AutoFill(true)
                .DataBinding(dataBinding => dataBinding.WebService().Select("~/Models/Products.asmx/GetDropDownItemsWithParams"))
                .Filterable(filtering =>
                {
                    filtering.FilterMode(AutoCompleteFilterMode.StartsWith);
                })
                .HighlightFirstMatch(true)
        %>

        <h4>WCF Web Service</h4>
    
        <%= Html.Telerik().ComboBox()
                .Name("WcfComboBox")
                .AutoFill(true)
                .DataBinding(dataBinding => dataBinding.WebService().Select("~/Models/Products.svc/GetDropDownItemsWithParams"))
                .Filterable(filtering =>
                {
                    filtering.FilterMode(AutoCompleteFilterMode.StartsWith);
                })
                .HighlightFirstMatch(true)
        %>
    </div>

    <div class="panel">
        <h3>DropDownList</h3>
        <h4>Ajax</h4>

        <%= Html.Telerik().DropDownList()
                .Name("AjaxDropDownList")
                .DataBinding(binding => binding.Ajax().Select("_AjaxLoading", "ComboBox"))
        %>

        <h4>ASMX Web Service</h4>

        <%= Html.Telerik().DropDownList()
                .Name("AsmxDropDownList")
                .DataBinding(dataBinding => dataBinding
                .WebService().Select("~/Models/Products.asmx/GetDropDownItems"))
        %>

        <h4>WCF Web Service</h4>

        <%= Html.Telerik().DropDownList()
                .Name("WcfDropDownList")
                .DataBinding(dataBinding => dataBinding
                .WebService().Select("~/Models/Products.svc/GetDropDownItems"))
        %>
    </div>

    <div class="panel">
        <h3>AutoComplete</h3>
        <h4>Ajax</h4>

        <%= Html.Telerik().AutoComplete()
                .Name("AjaxAutoComplete")
                .DataBinding(binding => binding.Ajax().Select("_AutoCompleteAjaxLoading", "ComboBox"))
                .HighlightFirstMatch(true)
                .AutoFill(true)
        %>

        <h4>ASMX Web Service</h4>

        <%= Html.Telerik().AutoComplete()
                .Name("AsmxAutoComplete")
                .DataBinding(binding => binding.WebService().Select("~/Models/Products.asmx/GetProductNames"))
                .HighlightFirstMatch(true)
                .AutoFill(true)
        %>

        <h4>WCF Web Service</h4>

        <%= Html.Telerik().AutoComplete()
                .Name("WcfAutoComplete")
                .DataBinding(binding => binding.WebService().Select("~/Models/Products.svc/GetProductNames"))
                .HighlightFirstMatch(true)
                .AutoFill(true)
        %>

   </div>
</asp:content>

<asp:Content runat="server" ContentPlaceHolderID="HeadContent">

    <style type="text/css">
        .panel 
        {
             float:left;
             width:30%;
             padding-bottom: 3em;
        }
        
        .panel h4
        {
            font-weight: normal;
        }
        
        .panel .t-autocomplete
        {
            margin-top: 2px;
        }
    </style>
</asp:Content>