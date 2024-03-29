<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage" %>

<asp:content contentPlaceHolderID="MainContent" runat="server">

    <script type="text/javascript">

        var red = 204, 
            green = 255, 
            blue = 50;
        
        function onRedSliderEvent (e) {
            red = e.value;
            changeBackgroundColor(red, green, blue)
        }

        function onGreenSliderEvent (e) {
            green = e.value;
            changeBackgroundColor(red, green, blue)
        }

        function onBlueSliderEvent (e) {
            blue = e.value;
            changeBackgroundColor(red, green, blue)
        }

        function changeBackgroundColor(red, green, blue) {
            var color = "rgb(" + red + ", "  + green + ", " + blue + ")";
            $("#colorBox").css("background-color", color);
        }

    </script>

    <div id="colorBox" class="t-widget" style="background-color: rgb(204, 255, 50);"></div>

	<%= Html.Telerik().Slider<int>()
            .Name("RedSlider")
            .Max(255)
            .Value(204)
            .ShowButtons(false)
            .TickPlacement(SliderTickPlacement.None)
            .ClientEvents(events => events
                      .OnSlide("onRedSliderEvent")
                      .OnChange("onRedSliderEvent"))
            .HtmlAttributes(new { @class="RedSlider" })
	%>
    <br />
    
    <%= Html.Telerik().Slider<int>()
            .Name("GreenSlider")
            .Max(255)
            .Value(255)
            .ShowButtons(false)
            .TickPlacement(SliderTickPlacement.None)
            .ClientEvents(events => events
                      .OnSlide("onGreenSliderEvent")
                      .OnChange("onGreenSliderEvent"))
            .HtmlAttributes(new { @class="GreenSlider" })
	%>
    <br />
    
    <%= Html.Telerik().Slider<int>()
            .Name("BlueSlider")
            .Min(0)
            .Max(255)
            .Value(50)
            .ShowButtons(false)
            .TickPlacement(SliderTickPlacement.None)
            .ClientEvents(events => events
                      .OnSlide("onBlueSliderEvent")
                      .OnChange("onBlueSliderEvent"))
            .HtmlAttributes(new { @class="BlueSlider" })
	%>

    <div style="clear:both"><!-- --></div>

</asp:content>

<asp:content ID="Content1" contentPlaceHolderID="HeadContent" runat="server">

    <style type="text/css">

        #colorBox
        {
            float: right;
            margin-top: 8px;
            margin-right: 560px;
            width: 52px;
            height: 52px;
            -moz-border-radius: 8px; 
            -webkit-border-radius: 8px; 
            border-radius: 8px;
        }
        
        .RedSlider .t-slider-selection,
        .GreenSlider .t-slider-selection,
        .BlueSlider .t-slider-selection
        {
            height: 4px;
            border: 1px solid;
        }
        
        .RedSlider .t-slider-selection
        {
            border-color: #d10;
            background: #d10 none;
        }

        .GreenSlider .t-slider-selection
        {
            border-color: #0c0;
            background: #0c0 none;
        }

        .BlueSlider .t-slider-selection
        {
            border-color: #03c;
            background: #03c none;
        }

    </style>

</asp:content>