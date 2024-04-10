package main

import (
	"errors"
	"fmt"
	"math/rand"
)

func main() {
	msg, err := greetings("User")
	if err == nil {
		fmt.Println(msg)
	} else {
		fmt.Println(err)
	}

}

func greetings(name string) (string, error) {
	if name == "" {
		return name, errors.New("empty name")
	}

	return fmt.Sprintf(randomFormat(), name), nil
}

func randomFormat() string {
	formats := []string{
		"Hi, %v. Welcome!",
		"Great to see you, %v!",
		"Hail, %v! Well met!",
	}
	return formats[rand.Intn(len(formats))]
}
