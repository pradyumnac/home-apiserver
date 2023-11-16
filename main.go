package main

import "github.com/gofiber/fiber/v2"

func main() {
	app := fiber.New()

	// healhcheck
	app.Get("/healthcheck", func(c *fiber.Ctx) error {
		return c.SendString("OK")
	})

	// Root
	app.Get("/", func(c *fiber.Ctx) error {
		return c.SendString("Hello, World!")
	})

	app.Listen(":3000")
}

// tests
// Path: main_test.go
