<html>
<head>
	
	<title>Sample Dojo / Dijit Page</title>
	
	<!-- a Dijit theme, and Calendar CSS: -->
    <style type="text/css">
        @import "/${grailsApplication.metadata['app.name']}/dojoroot/dijit/themes/tundra/tundra.css";
        @import "/${grailsApplication.metadata['app.name']}/dojoroot/dojo/resources/dojo.css"
    </style>
    <script type="text/javascript" src="/${grailsApplication.metadata['app.name']}/dojoroot/dojo/dojo.js"
        djConfig="parseOnLoad: true"></script>
 
	<!-- all user code -->
	<script type="text/javascript">
		dojo.require("dojox.widget.Calendar");
		dojo.addOnLoad(function(){
			
			// create a new instance of a Calendar
			var calendar = new dojox.widget.Calendar({
				onChange: function(val){
					// when the value changes, hide the popup 
					// and set a value to our input 
					dijit.popup.close(calendar);
					console.log(val, typeof val);
					this._pushChangeTo.value = dojo.date.locale.format(val, { timePattern:"" });
				},
				destroy: function(){
					// avoid leaving a ref in object for IE
					delete this._pushChangeTo;
					this.inherited(arguments);
				}
			});
			
			dojo.extend(dojo.NodeList, {
				// the guts of the "plugin"
				addPicker: function(args){
					// summary: A method to add a popup calendar to some input. Only inputs are
					// supported currently. 
					//
					// args: Object?
					// unused, reserved for object-hash of possible params
					//
					// example:
					// | dojo.query("input.needsCalendar").addPicker().removeClass(".needsCalendar");
					//
					this.forEach(function(n){
						
						// add an image after the input we're targeting for clickage
						var img = dojo.doc.createElement('img');
						dojo.attr(img, {
							// change this to something better:
							src:"/${grailsApplication.metadata['app.name']}/images/date.png", 
							alt:"calendar",
							style:{ cursor:"pointer" }
						})
						dojo.place(img, n, "after");
						
						// in Dojo 1.3 use this instead of above:
						// dojo.create("img", { 
						//		src:"date.png",
						//		alt:"celendar",
						//		style:{ cursor:"pointer" } 
						// }, n, "after");
						
						dojo.connect(img, "onclick", function(e){
							// tell popup which id to send onChange value to
							calendar._pushChangeTo = n; 
							// and open the popup below the targeted input
							dijit.popup.open({ 
								popup: calendar,
								around: n
							});
						})
						
					});
					return this; // dojo.NodeList
				}
			});
			
			// one line of code:
			dojo.query(".datePicker").addPicker();
			
		});
	</script>
 
</head>
<body class="tundra">
	
	<div>
		<label for="foo1">Pick Date:</label>
		<input class="datePicker" id="foo1" name="foo1" value=" Select A Date " /> 
	</div>

	
</body>
</html>