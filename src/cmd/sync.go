package cmd

import (
	"fmt"

	"github.com/spf13/cobra"
)

var (
	Only    []string
	syncCmd = &cobra.Command{
		Use:   "sync",
		Short: "Sync files [(ne)dots] with remote",
		Long: `Sync files [(ne)dots] with remote.
    Fastforward and push latest changes to remote.`,
		Run: func(cmd *cobra.Command, args []string) {
			fmt.Println("Hello sync!")
		},
	}
)

func init() {
	syncCmd.PersistentFlags().StringSliceVarP(
		&Only,
		"only",
		"o",
		[]string{},
		"only sync these entries (must match config)",
	)
}
