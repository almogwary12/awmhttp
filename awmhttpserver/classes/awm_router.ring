package AWM.HTTP
	class Router
	    server
	    aObjs = []
	    Route
	    func httpGet cRoute, callback
	        server.httpGet(cRoute, callback)
	    func httpPost cRoute, callback
	        server.httpPost(cRoute, callback)
	    func setCookie key, value
	      	setCookie(key + "=" + value)
	    func cookie key 
	        return Cookies()[key]
	    func getRoute
	        aObjs + new Route
	        return aObjs[len(aObjs)]
	
	
	class Route 
	    method 
	    path
	    callback 
