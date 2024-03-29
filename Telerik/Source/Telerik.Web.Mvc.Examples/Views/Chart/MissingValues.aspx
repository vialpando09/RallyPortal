<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<SalesData>>" %>

<asp:Content contentPlaceHolderID="MainContent" runat="server">

    <%= Html.Telerik().Chart(Model)
            .Name("chart")
            .Theme(Html.GetCurrentTheme())
            .Title("Representative Sales vs. Total Sales")
            .Legend(legend => legend
                .Position(ChartLegendPosition.Bottom)
            )
            .Series(series => {
                series.Column(s => s.RepSales).Name("Representative Sales");
                series.Line(s => s.TotalSales).Name("Total Sales")
                    .Labels(true).Labels(labels => labels.Format("${0:#,##0}"))
                    .MissingValues(ViewBag.MissingValues);
            })
            .CategoryAxis(axis => axis
                .Categories(s => s.DateString)
            )        
            .ValueAxis(axis => axis
                .Numeric().Labels(labels => labels.Format("${0:#,##0}"))
            )
            .HtmlAttributes(new { style = "width: 600px; height: 400px;" })
    %>

    <% using (Html.Configurator("The chart should...")
                  .PostTo("MissingValues", "Chart")
                  .Begin())
       { %>
        <ul id="chart-options">
            <li>
                <%= Html.RadioButton("missingValues",
                        ChartLineMissingValues.Gap.ToString(),
                        (ChartLineMissingValues) ViewBag.MissingValues == ChartLineMissingValues.Gap,
                        new { id = "missingValuesGap"}) %>
                <label for="missingValuesGap">leave gap for missing values</label>
            </li>
            <li>
                <%= Html.RadioButton("missingValues",
                        ChartLineMissingValues.Interpolate.ToString(),
                        (ChartLineMissingValues) ViewBag.MissingValues == ChartLineMissingValues.Interpolate,
                        new { id = "missingValuesInterpolate"}) %>
                <label for="missingValuesInterpolate">interpolate missing values</label>
            </li>
            <li>
                <%= Html.RadioButton("missingValues",
                        ChartLineMissingValues.Zero.ToString(),
                        (ChartLineMissingValues) ViewBag.MissingValues == ChartLineMissingValues.Zero,
                        new { id = "missingValuesZero"}) %>
                <label for="missingValuesZero">treat missing values as zero</label>
            </li>
        </ul>

        <button type="submit" class="t-button">Apply</button>
    <% } %>

</asp:Content>

<asp:Content ID="Content1" contentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .example .configurator {
            float: right;
            margin: 0 0 0 0;
            display: inline;
        }
        
        .t-chart {
            float: left;
        }
    </style>
</asp:Content>