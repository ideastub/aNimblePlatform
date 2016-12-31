<%

def test = "wow'"
        	println test
			println "<br>"
        	println !test.matches("[^\'\"]")
			println "<br>"
        	println test.matches("[^\'\"]")
			println "<br>"
        	println test.contains("\'")
			println "<br>"
        	println test.contains("\"")

println "<br>"

test = "wow"
        	println test
			println "<br>"
        	println !test.matches("[^\'\"]")
			println "<br>"
        	println test.matches("[^\'\"]")

println "<br>"

test = "wow\'\""
        	println test
			println "<br>"
        	println !test.matches("[^\'\"]")
			println "<br>"
        	println test.matches("[^\'\"]")
			println "<br>"
        	println test.contains("\'")
			println "<br>"
        	println test.contains("\"")

%>