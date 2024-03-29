﻿// (c) Copyright 2002-2010 Telerik 
// This source is subject to the GNU General Public License, version 2
// See http://www.gnu.org/licenses/gpl-2.0.html. 
// All other rights reserved.

namespace Telerik.Web.Mvc.UI.Fluent
{
    using System;
    using System.ComponentModel;
    using Telerik.Web.Mvc.Infrastructure;
    using Telerik.Web.Mvc.UI;

    /// <summary>
    /// Defines the fluent interface for configuring scatter series.
    /// </summary>
    /// <typeparam name="T">The type of the data item</typeparam>
    public abstract class ChartScatterSeriesBuilderBase<TSeries, TBuilder> : ChartSeriesBuilderBase<TSeries, TBuilder>
        where TSeries : IChartScatterSeries
        where TBuilder : ChartScatterSeriesBuilderBase<TSeries, TBuilder>
    {
        /// <summary>
        /// Initializes a new instance of the <see cref="ChartScatterSeriesBuilderBase{T}"/> class.
        /// </summary>
        /// <param name="series">The series.</param>
        public ChartScatterSeriesBuilderBase(TSeries series)
            : base(series)
        {
        }

        /// <summary>
        /// Configures the scatter chart labels.
        /// </summary>
        /// <param name="configurator">The configuration action.</param>
        /// <example>
        /// <code lang="CS">
        ///  &lt;%= Html.Telerik().Chart()
        ///             .Name("Chart")
        ///             .Series(series => series
        ///                 .Scatter(s => s.x, s => s.y)
        ///                 .Labels(labels => labels
        ///                     .Position(ChartBarLabelsPosition.Above)
        ///                     .Visible(true)
        ///                 );
        ///              )
        /// %&gt;
        /// </code>
        /// </example>
        public TBuilder Labels(Action<ChartPointLabelsBuilder> configurator)
        {
            Guard.IsNotNull(configurator, "configurator");

            configurator(new ChartPointLabelsBuilder(Series.Labels));

            return this as TBuilder;
        }

        /// <summary>
        /// Sets the visibility of scatter chart labels.
        /// </summary>
        /// <param name="visible">The visibility. The default value is false.</param>
        /// <example>
        /// <code lang="CS">
        ///  &lt;%= Html.Telerik().Chart()
        ///             .Name("Chart")
        ///             .Series(series => series
        ///                 .Scatter(s => s.x, s => s.y)
        ///                 .Labels(true);
        ///              )
        /// %&gt;
        /// </code>
        /// </example>
        public TBuilder Labels(bool visible)
        {
            Series.Labels.Visible = visible;

            return this as TBuilder;
        }

        /// <summary>
        /// Configures the scatter chart markers.
        /// </summary>
        /// <param name="configurator">The configuration action.</param>
        /// <example>
        /// <code lang="CS">
        ///  &lt;%= Html.Telerik().Chart()
        ///             .Name("Chart")
        ///             .Series(series => series
        ///                 .Scatter(s => s.x, s => s.y)
        ///                 .Markers(markers => markers
        ///                     .Type(ChartMarkerShape.Triangle)
        ///                 );
        ///              )
        /// %&gt;
        /// </code>
        /// </example>
        public TBuilder Markers(Action<ChartMarkersBuilder> configurator)
        {
            Guard.IsNotNull(configurator, "configurator");

            configurator(new ChartMarkersBuilder(Series.Markers));

            return this as TBuilder;
        }

        /// <summary>
        /// Sets the visibility of scatter chart markers.
        /// </summary>
        /// <param name="visible">The visibility. The default value is true.</param>
        /// <example>
        /// <code lang="CS">
        ///  &lt;%= Html.Telerik().Chart()
        ///             .Name("Chart")
        ///             .Series(series => series
        ///                 .Scatter(s => s.x, s => s.y)
        ///                 .Markers(true);
        ///              )
        /// %&gt;
        /// </code>
        /// </example>
        public TBuilder Markers(bool visible)
        {
            Series.Markers.Visible = visible;

            return this as TBuilder;
        }

        /// <summary>
        /// Sets the axis name to use for this series.
        /// </summary>
        /// <param name="axis">The axis name for this series.</param>
        /// <example>
        /// <code lang="CS">
        ///  &lt;%= Html.Telerik().Chart(Model)
        ///             .Name("Chart")
        ///             .Series(series => series.Scatter(s => s.X, s => s.Y).Name("Scatter").XAxis("secondary"))
        ///             .XAxis(axis => axis.Numeric())
        ///             .XAxis(axis => axis.Numeric("secondary"))
        /// %&gt;
        /// </code>
        /// </example>
        public virtual TBuilder XAxis(string axis)
        {
            Series.XAxis = axis;

            return this as TBuilder;
        }

        /// <summary>
        /// Sets the axis name to use for this series.
        /// </summary>
        /// <param name="axis">The axis name for this series.</param>
        /// <example>
        /// <code lang="CS">
        ///  &lt;%= Html.Telerik().Chart(Model)
        ///             .Name("Chart")
        ///             .Series(series => series.Scatter(s => s.Sales).Name("Sales").YAxis("secondary"))
        ///             .YAxis(axis => axis.Numeric())
        ///             .YAxis(axis => axis.Numeric("secondary"))
        /// %&gt;
        /// </code>
        /// </example>
        public virtual TBuilder YAxis(string axis)
        {
            Series.YAxis = axis;

            return this as TBuilder;
        }

        /// <summary>
        /// Not applicable to scatter series
        /// </summary>
        [EditorBrowsable(EditorBrowsableState.Never)]
        public override TBuilder Axis(string axis)
        {
            return base.Axis(axis);
        }
    }
}