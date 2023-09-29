load "awmhttp.ring"

import AWM.HTTP
$server = new AwmHttpServer()
$server.shareFolder("public/")
test = new Router{
	Route{
		path = "/test"
		method = "GET"

		callback = func req, res{
			req.set_Cookie("name", "mohammed")
			res.send("hello Test "+req[:name])
		}
	}
	Route{
		path = "/test/he"
		method = "GET"

		callback = func req, res{
			? req.cookie("name")
			res.send("hello Test "+req[:name])
		}
	}
	Route{
		path = "/test"
		method = "POST"
		callback = func req, res{
			file = req[:image]
			res.send("hello Test "+req[:name])
		}
	}
}

$server.use("", test)

? "server run at port 8080"
$server.listen("0.0.0.0", 8080)
