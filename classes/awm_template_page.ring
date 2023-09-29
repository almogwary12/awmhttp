load "weblib.ring"
import System.Web

package AWM.HTML
	class AwmPage 
		cOutput = ""
		func html cHtml 
			cOutput += cHtml 
		func output 
			return self.cOutput
	class AwmTemplagetPage
		config = []
		oPage
		func init file, config, data, methods
			self.config = config
			for a in data
				addAttribute(self, a[1])
				setAttribute(self, a[1], a[2])
			end
			for m in methods
				addMethod(self, m[1], m[2])
			end
			
			cTemp = Template(file, self)
	
			oPage = new AwmPage
			{		
					//self.lBootstrap = this.config[:bootstrap]
					//UseLocalFiles()
					html(cTemp)
			}
		func include page
			cTemp = Template(page, self)
			return cTemp
	
	
