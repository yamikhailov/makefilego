package main

import (
	"regexp"
	"testing"
)

func TestGreetings(t *testing.T) {
	first_name := "John"
	want := regexp.MustCompile(`\b` + first_name + `\b`)
	msg, err := greetings(first_name)
	if !want.MatchString(msg) || err != nil {
		t.Fatalf(`greetings("John") = %q, %v, want match for %#q, nil`, msg, err, want)
	}
}
func TestGreetingsEmpty(t *testing.T) {
	msg, err := greetings("")
	if msg != "" || err == nil {
		t.Fatalf(`greetings("") = %q, %v, want "", error`, msg, err)
	}
}
