<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<IEnumerable<Product>>" %>

<asp:Content ContentPlaceHolderID="MainContent" runat="server">
    
    <%= Html.Telerik().ComboBox()
                      .Name("ComboBox")
                      .BindTo(new SelectList(Model, "ProductID", "ProductName"))
                      .HtmlAttributes(new { style = "width: 200px; float: left; margin-bottom: 280px;" })
    %>
    
    <script type="text/javascript">

        function selectItemInComboBox() {
            var comboBox = $("#ComboBox").data("tComboBox");
            
            var index = $("#comboBoxItemIndex").data("tTextBox").value();

            comboBox.select(index);
        }

        function getSelectedFromComboBoxt() {
            var comboBox = $("#ComboBox").data("tComboBox");

            alert("Text: " + comboBox.text() + " Value: " + comboBox.value());
        }

        // ComboBox openDropDown event.
        function openComboBoxDropDown(e) {
            $("#ComboBox").data("tComboBox").open();

            // prevent the click from bubbling, thus, closing the popup
            if (e.stopPropagation) e.stopPropagation();
            e.cancelBubble = true;
        }

        // ComboBox openDropDown event.
        function closeComboBoxDropDown(e) {
            $("#ComboBox").data("tComboBox").close();

            // prevent the click from bubbling, thus, closing the popup
            if (e.stopPropagation) e.stopPropagation();
            e.cancelBubble = true;
        }

        function enableComboBox() {
            $("#ComboBox").data("tComboBox").enable();
            $('#OpenComboBoxDropDown').removeClass('t-state-disabled').removeAttr('disabled');
            $('#CloseComboBoxDropDown').removeClass('t-state-disabled').removeAttr('disabled');
        }

        function disableComboBox() {
            $("#ComboBox").data("tComboBox").disable();
            $('#OpenComboBoxDropDown').addClass('t-state-disabled').attr('disabled', 'disabled');
            $('#CloseComboBoxDropDown').addClass('t-state-disabled').attr('disabled', 'disabled');
        }

    </script>

    <% using ( Html.Configurator("ComboBox client API")
                   .Begin() ) 
       { %>
        <ul>
            <li>
                <label for="comboBoxItemIndex">Item index:</label>
                
                <%= Html.Telerik().IntegerTextBox()
                                  .Name("comboBoxItemIndex")
                                  .Value(0) 
                                  .MinValue(0)
                                  .MaxValue(Model.Count() - 1)
                                  .InputHtmlAttributes(new { style = "width: 60px" })
                %>
                
                <button class="t-button" onclick="selectItemInComboBox()">Select</button>
            </li>
            <li>
                <button class="t-button" onclick="getSelectedFromComboBoxt()" style="width: 100px;">Get Value</button>
            </li>
            <li>
                <button id="OpenComboBoxDropDown" class="t-button" onclick="openComboBoxDropDown(event)">Open</button>
                /
                <button id="CloseComboBoxDropDown" class="t-button" onclick="closeComboBoxDropDown(event)">Close</button>
            </li>
            <li>
                <button class="t-button" onclick="enableComboBox()">Enable</button> /
                <button class="t-button" onclick="disableComboBox()">Disable</button>
            </li>
        </ul>
    <% } %>

    <%= Html.Telerik().DropDownList()
            .Name("DropDownList")
            .BindTo(new SelectList(Model, "ProductID", "ProductName"))
            .HtmlAttributes(new { style = "width: 200px; float: left; clear:both; margin-bottom: 230px;" })
    %>

    <script type="text/javascript">

        function selectItemInDropDownList() {
            var dropDownList = $("#DropDownList").data("tDropDownList");

            var index = $("#dropDownListItemIndex").data("tTextBox").value();

            dropDownList.select(index);
        }

        function getSelectedFromDropDownList() {
            var dropDownList = $("#DropDownList").data("tDropDownList");

            alert("Text: " + dropDownList.text() + " Value: " + dropDownList.value());
        }

        // DropDownList openDropDown event.
        function openDropDownListDropDown(e) {
            $("#DropDownList").data("tDropDownList").open();

            // prevent the click from bubbling, thus, closing the popup
            if (e.stopPropagation) e.stopPropagation();
            e.cancelBubble = true;
        }

        // DropDownList closeDropDown event.
        function closeDropDownListDropDown(e) {
            $("#DropDownList").data("tDropDownList").close();

            // prevent the click from bubbling, thus, closing the popup
            if (e.stopPropagation) e.stopPropagation();
            e.cancelBubble = true;
        }

        function enableDropDownList() {
            $("#DropDownList").data("tDropDownList").enable();
            $('#OpenDropDownListDropDown').removeClass('t-state-disabled').removeAttr('disabled');
            $('#CloseDropDownListDropDown').removeClass('t-state-disabled').removeAttr('disabled');
        }

        function disableDropDownListr() {
            $("#DropDownList").data("tDropDownList").disable();
            $('#OpenDropDownListDropDown').addClass('t-state-disabled').attr('disabled', 'disabled');
            $('#CloseDropDownListDropDown').addClass('t-state-disabled').attr('disabled', 'disabled');
        }

    </script>

    <% using ( Html.Configurator("DropDownList client API")
                   .Begin() ) 
           { %>
            <ul>
                <li>
                    <label>Item index:</label>

                    <%= Html.Telerik().IntegerTextBox()
                                      .Name("dropDownListItemIndex")
                                      .Value(0) 
                                      .MinValue(0)
                                      .MaxValue(Model.Count() - 1)
                                      .InputHtmlAttributes(new { style = "width: 60px" })
                    %>
                
                    <button class="t-button" onclick="selectItemInDropDownList()">Select</button>
                </li>
                <li>
                    <button class="t-button" onclick="getSelectedFromDropDownList()" style="width: 100px;">Get Value</button>
                </li>
                <li>
                    <button id="OpenDropDownListDropDown" class="t-button" onclick="openDropDownListDropDown(event)">
                        Open</button>
                    /
                    <button id="CloseDropDownListDropDown" class="t-button" onclick="closeDropDownListDropDown(event)">
                        Close</button>
                </li>
                <li>
                    <button class="t-button" onclick="enableDropDownList()">Enable</button> /
                    <button class="t-button" onclick="disableDropDownListr()">Disable</button>
                </li>
           </ul>
    <% } %>

</asp:Content>

<asp:Content ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .example .configurator
        {
            width: 300px;
            float: left;
            margin: 0 0 0 10em;
            display: inline;
        }
        
        .configurator p
        {
            margin: 0;
            padding: .4em 0;
        }
        
        .configurator .t-button
        {
            margin: 0 0 1em;
        }
    </style>
</asp:Content>
