load "jsonlib.ring"
load "stdlib.ring"


package AWM.HTTP
	class AwmHttpRequest from request
		body = []
		params = []
		cookie = []
		server
		func init 
		func variable cPara
			if ! isString (cPara)
				raise("Bad parameter type!")
			ok
			if has_param(cPara)
				return self.get_param_value(cPara)
			but has_file(cPara)
				return self.getFileContent(cPara)
			ok
	
		func operator cOperator, cValue
			if cOperator = "[]"
				return Variable(cValue)
			ok

		func getFileContent cFile
			if has_file(cFile)
				return get_multipartformdata_content2( get_file_value(cFile) )
			ok

		func getFileName cFile
			if has_file(cFile)
				return get_multipartformdata_filename( get_file_value(cFile) )
			ok
		func cookie key 
			return server.Cookies()[key]
		func set_cookie key, value
			server.setCookie(key + "=" + value)