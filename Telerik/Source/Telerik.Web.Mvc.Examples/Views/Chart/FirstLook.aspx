<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<SalesData>>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    <%= Html.Telerik().Chart(Model)
            .Name("chart")
            .Theme(Html.GetCurrentTheme())
            .Title(title => title
                .Text("Representative Sales vs. Total Sales")
                .Visible(ViewBag.ShowTitle)
            )
            .Legend(legend => legend
                .Position(ViewBag.LegendPosition)
                .Visible(ViewBag.ShowLegend)
            )
            .SeriesDefaults(series => {
                series.Bar().Stack(ViewBag.Stack);
                series.Column().Stack(ViewBag.Stack);
                series.Line()
                      .Labels(labels => labels.Format("${0:#,##0}").Visible(true))
                      .Stack(ViewBag.Stack);
                series.VerticalLine()
                      .Labels(labels => labels.Format("${0:#,##0}").Position(ChartLineLabelsPosition.Right).Visible(true))
                      .Stack(ViewBag.Stack);
                series.Area().Stack(ViewBag.Stack);
                series.VerticalArea().Stack(ViewBag.Stack);
            })
            .Series(series => {
                if (ViewBag.SeriesType == "bar")
                {
                    series.Bar("RepSales").Name("Rep. Sales");
                    series.Bar(s => s.TotalSales).Name("Total Sales");
                }
                else if (ViewBag.SeriesType == "column")
                {
                    series.Column("RepSales").Name("Rep. Sales");
                    series.Column(s => s.TotalSales).Name("Total Sales");
                }
                else if (ViewBag.SeriesType == "line")
                {
                    series.Line("RepSales").Name("Rep. Sales")
                        .Markers(markers => markers.Type(ChartMarkerShape.Circle));
                    series.Line(s => s.TotalSales).Name("Total Sales");
                }
                else if (ViewBag.SeriesType == "area")
                {
                    series.Area(s => s.TotalSales).Name("Total Sales");
                    series.Area("RepSales").Name("Rep. Sales");
                }
                else if (ViewBag.SeriesType == "verticalLine")
                {
                    series.VerticalLine("RepSales").Name("Rep. Sales")
                        .Markers(markers => markers.Type(ChartMarkerShape.Circle));
                    series.VerticalLine(s => s.TotalSales).Name("Total Sales");
                }
                else if (ViewBag.SeriesType == "verticalArea")
                {
                    series.VerticalArea(s => s.TotalSales).Name("Total Sales");
                    series.VerticalArea("RepSales").Name("Rep. Sales");
                }
            })
            .CategoryAxis(axis => axis
                .Categories(s => s.DateString)
            )
            .ValueAxis(axis => axis
                .Numeric().Labels(labels => labels.Format("${0:#,##0}"))
            )
            .Tooltip(tooltip => tooltip
                .Visible(true)
                .Format("${0:#,##0}")
            )
            .HtmlAttributes(new { style = "width: 600px; height: 400px;" })
    %>
    <% using (Html.Configurator("The chart should show...")
                  .PostTo("FirstLook", "Chart")
                  .Begin())
       { %>
    <ul id="chart-options">
        <li>
            <%= Html.Telerik().DropDownList()
                        .Name("seriesType")
                        .HtmlAttributes(new { style = "width: 90px; vertical-align: middle" })
                        .Items(items => {
                            items.Add().Text("bar").Value("bar").Selected(true);
                            items.Add().Text("column").Value("column");
                            items.Add().Text("line").Value("line");
                            items.Add().Text("vertical line").Value("verticalLine");
                            items.Add().Text("area").Value("area");
                            items.Add().Text("vertical area").Value("verticalArea");
                        })
            %>
            <label for="seriesType">
                series</label>
        </li>
        <li>
            <%= Html.CheckBox("stack", (bool) ViewBag.Stack) %>
            <label for="stack">
                stacked series</label>
        </li>
        <li>
            <%= Html.CheckBox("showTitle", (bool) ViewBag.ShowTitle) %>
            <label for="showTitle">
                a title</label>
        </li>
        <li>
            <%= Html.CheckBox("showLegend", (bool) ViewBag.ShowLegend) %>
            <label for="showLegend">
                a legend</label><label for="legendPosition">on the</label>
            <%= Html.Telerik().DropDownList()
                        .Name("legendPosition")
                        .HtmlAttributes(new { style = "width: 100px; vertical-align: middle" })
                        .Items(items =>
                        {
                            items.Add().Text("top")
                                .Value(ChartLegendPosition.Top.ToString())
                                .Selected(ViewBag.LegendPosition == ChartLegendPosition.Top);

                            items.Add().Text("right")
                                .Value(ChartLegendPosition.Right.ToString())
                                .Selected(ViewBag.LegendPosition == ChartLegendPosition.Right);

                            items.Add().Text("bottom")
                                .Value(ChartLegendPosition.Bottom.ToString())
                                .Selected(ViewBag.LegendPosition == ChartLegendPosition.Bottom);
                            
                            items.Add().Text("left")
                                .Value(ChartLegendPosition.Left.ToString())
                                .Selected(ViewBag.LegendPosition == ChartLegendPosition.Left);
                        })
            %>
        </li>
    </ul>
    <button type="submit" class="t-button">
        Apply</button>
    <% } %>
</asp:Content>
<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .example .configurator
        {
            float: right;
            margin: 0 0 0 0;
            display: inline;
        }
        
        .t-chart
        {
            float: left;
        }
    </style>
</asp:Content>
