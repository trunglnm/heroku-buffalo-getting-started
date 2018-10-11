package actions

import "github.com/gobuffalo/buffalo"

// HelloHandler default implementation.
func HelloHandler(c buffalo.Context) error {
	// return c.Render(200, r.HTML("hello/hello_handler.html"))
	msg := "hello " + c.Param("name")
	return c.Render(200, r.JSON(map[string]string{"message": msg}))
}
