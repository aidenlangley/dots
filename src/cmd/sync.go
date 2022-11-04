package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

var (
	Only []string

	syncCmd = &cobra.Command{
		Use:   "sync",
		Short: "Sync files with remote",
		Long: `Sync files with remote.
    Fastforward and push latest changes to remote.`,
		Run: func(cmd *cobra.Command, args []string) {
			fmt.Println("Hello sync!")
		},
	}
)

func init() {
	syncCmd.Flags().StringSliceVarP(
		&Only,
		"only",
		"o",
		[]string{},
		`only sync these entries (must at least match dir or file name in config -
    in other words, the final part of the path must match)`,
	)
}
