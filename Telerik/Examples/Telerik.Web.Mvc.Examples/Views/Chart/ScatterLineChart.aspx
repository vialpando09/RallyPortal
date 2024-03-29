<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<EngineDataPoint>>" %>

<asp:Content contentPlaceHolderID="MainContent" runat="server">
    <%= Html.Telerik().Chart(Model)
            .Name("chart")
            .Theme(Html.GetCurrentTheme())
            .Legend(legend => legend.Position(ChartLegendPosition.Top))
            .SeriesDefaults(series => series.ScatterLine().Width(2))
            .Series(series => {
                series
                    .ScatterLine(d => d.RPM, d => d.Power)
                    .Name("Power")
                    .Tooltip(tooltip => tooltip.Format("{1} bhp @ {0:N0} rpm"));
                
                series
                    .ScatterLine(d => d.RPM, d => d.Torque)
                    .Name("Torque")
                    .YAxis("torque")
                    .Tooltip(tooltip => tooltip.Format("{1} lb-ft @ {0:N0} rpm"));
            })
            .XAxis(x => x
                .Title("Engine rpm")
                // Align torque axis to the right by specifying
                // a crossing value greater than or equal to the axis maximum.
                .AxisCrossingValue(0, 10000)
                .Labels(l => l.Format("{0:N0}"))
            )
            .YAxis(y => y.Numeric().Title("Power (bhp)"))
            .YAxis(y => y.Numeric("torque").Title("Torque (lb-ft)"))
            .Tooltip(true)
            .HtmlAttributes(new { style = "width: 600px; height: 400px; margin: auto;" })
    %>
</asp:Content>

<asp:Content contentPlaceHolderID="HeadContent" runat="server">
</asp:Content>