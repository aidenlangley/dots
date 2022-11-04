package cmd

import (
	"git.sr.ht/~nedia/nedots/config"
	"github.com/spf13/cobra"
)

var parseCmd = &cobra.Command{
	Use:   "parse",
	Short: "Parse config file",
	Long: `Parse config file. Ensures config behaves as expected by performing a
  dry run, parsing the contents and printing the operations to stdout.`,

	Run: func(cmd *cobra.Command, args []string) {
		config.Validate(Verbosity | 1)
	},
}
