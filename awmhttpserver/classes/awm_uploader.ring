package AWM.UTILS
	class Uploader
		cUploadFodder
		req 
		func init cFolder, req 
			cUploadFolder = cFolder
			self.req = req
		func upload cFile
			? "upload"
			Func getUploadedFile cFile, cUploadFolder
			cNewFileName = self.req.getfilename(cFile)
			
			if cNewFileName = NULL return ok
			cNewFileContent = self.req.getFileContent(cFile)
			
			cFileName = cUploadFolder + cNewFileName
			write(cFileName,cNewFileContent)
			if isLinux()
				system("chmod a+x "+cFileName)
			ok
