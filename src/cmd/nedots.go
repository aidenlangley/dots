// Package cmd ...
package cmd

import (
	"fmt"
	"os"

	"github.com/spf13/cobra"
)

var rootCmd = &cobra.Command{
	Use:   "nedots",
	Short: "Manage (ne)dots - collect & sync dotfiles.",
	Run: func(cmd *cobra.Command, args []string) {
		// Do Stuff Here
	},
}

// Execute Run nedots
func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
