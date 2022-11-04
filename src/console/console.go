package console

import (
	"github.com/fatih/color"
)

var (
	Err    = color.New(color.FgRed, color.Bold)
	Affirm = color.New(color.FgGreen, color.Bold)
	Notify = color.New(color.FgYellow)
)
