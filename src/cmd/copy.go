package cmd

import (
	"git.sr.ht/~nedia/nedots/config"
	ops "git.sr.ht/~nedia/nedots/ops"
	"github.com/spf13/cobra"
)

var copyCmd = &cobra.Command{
	Use:   "copy",
	Short: "Copy files & directories to nedots root directory",

	Run: func(cmd *cobra.Command, args []string) {
		Copy()
	},
}

func Copy() {
	config.Validate(Verbosity)
	for _, path := range config.Config.Sources {
		ops.Copy(path, config.Config.DotsDir, Verbosity)
	}
}
