<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<asp:Content contentPlaceHolderID="MainContent" runat="server">
    <%= Html.Telerik().Chart()
            .Name("chart")
            .Theme(Html.GetCurrentTheme())
            .Legend(false)
            .Series(series => {
                series.Scatter("Price", "Performance");
            })
            .DataBinding(dataBinding => dataBinding
                .Ajax().Select("_PricePerformance", "Chart")
            )
            .XAxis(x => x
                .Title(title => title.Text("Price"))
                .Labels(labels => labels.Format("${0}")).Max(1000))
            .YAxis(y => y
                .Title(title => title.Text("Performance"))
                .Labels(labels => labels.Format("{0}%")).Min(80).Max(220))
            .Tooltip(tooltip => tooltip
                .Visible(true)
                .Template("<b>$<#= value.x #> / <#= dataItem.Family #> <#= dataItem.Model #>: <#= value.y #>%</b>"))
            .HtmlAttributes(new { style = "width: 500px; height: 400px; margin: auto;" })
    %>
</asp:Content>