# awmhttp
Awmhttp using ringhttplib 

I,ve chanaged the original server code in ring httplib set 

func processEvent cCode 
		if ! substr(cCode,"(")
			cCode += " (request(), response())"
		ok
		return cCode
I call the request and response func instead of passing the response code this to call route function like this oserver.route("/", :Get, func req, res{
  res.set_content("<h1>hello</h1>", "text/html")
})
