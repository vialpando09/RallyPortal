<%@ Control Language="C#" Inherits="System.Web.Mvc.ViewUserControl" %>

<div class="event-log-wrap">
	<h3>Event log</h3>
	
	<a href="#" class="event-log-clear t-link"><span class="t-icon"></span>Clear log</a>
	
	<div class="event-log"></div>
</div>

<script type="text/javascript">
    //<![CDATA[
    (function() {
        var count = 0,
            oldMsg;

	    window.$console = {
		    log: function(msg) {
                if (msg != oldMsg) {
                    oldMsg = msg;
                    count = 1;
                    $('<div />')
				        .css({
					        'margin-top': -24,
					        'background-color': '#ffffd0'
				        })
				        .animate({ marginTop: 0 }, 'fast')
				        .animate({ backgroundColor: '#ffffff' }, 800).html(msg)
                        .prependTo('.event-log');
                } else {
                    count++;
                    var oldDiv = $('.event-log div:first');
                    
                    if (oldDiv.find(".call-count").length != 0) {
                        oldDiv.find(".call-count").html(count);
                    } else {
                        oldDiv.html(oldMsg)
                              .append("<span class='call-count'>" + count + "</span>");
                    }
                }
		    }
	    };
	})();
	//]]>
</script>

<% Html.Telerik().ScriptRegistrar()
	   .OnDocumentReady(() => {%>
			$('.event-log-clear')
				.click(function(e) {
					e.preventDefault();
					$(this).next('.event-log').html('');
				});
	   <%});
%>