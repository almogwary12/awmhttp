import AWM.HTML
package AWM.HTTP
	class AwmHttpResponse from response
		header = ""
		data
		func init header
		func send data 
			set_Content(data, self.header)
		func json data
			if !isList(data)
				raise("Error : bad parameter type "+ type(data))
			ok
			set_Content(list2json(data), "application/json;"+self.header)
		    func html file
			data = read(file)
			set_Content(data, "text/html;"+self.header)
		    func render file, config, data, methods
			cPage = new AwmTemplagetPage("views/"+file, config, data, methods)
			set_Content(cPage.oPage.output(), "text/html;"+self.header)
		    func redirect url
			set_redirect(url)
		    func setHTMLPage oPage
			set_content(oPage.Output(),"text/html")
		
