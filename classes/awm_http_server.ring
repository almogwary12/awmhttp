package AWM.HTTP 
	class AwmHttpServer from Server
		func init
			flash.add(:server, ref(self))
		func httpGet path, callback 
			cCode = processEvent(callback)
			return wGet(path, cCode)
		func httpPost path,callback
			cCode = processEvent(callback)
	        return wpost(path, cCode)
		func response 
			pTempObj = new AwmHttpResponse("text/html")
			pTempObj.pObject = HTTPLib_Server_response(pObject)
			return pTempObj
	
		func request 
			pTempObj = new AwmHttpRequest()
			pTempObj.pObject = HTTPLib_Server_request(pObject)
			pTempObj.server = ref(self)
			return pTempObj
	
		func setError  value
			error = value
		func use url, cRouter
			cRouter.server = self 
			for m in cRouter.aObjs
				cFunc  = m.callback
				if lower(m.method) = "post"
					cRouter.httpPost(url + m.path, cFunc)
				else
					cRouter.httpGet(url + m.path, cFunc)
				ok
			next
	
			
		func set_Cookie key, value
	      	setCookie(key + "=" + value)
	    func cookie key 
	        return Cookies()[key]
	
	
