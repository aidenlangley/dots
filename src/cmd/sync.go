package cmd

import "github.com/spf13/cobra"

var (
	Only []string

	syncCmd = &cobra.Command{
		Use:   "sync",
		Short: "Sync files with remote",
		Long: `Sync files with remote. Copy sources to dots_dir, fetch from remote,
    fastforward, and if there are no merge conflicts, push latest changes to
    remote.`,

		Run: func(cmd *cobra.Command, args []string) {
			Copy()
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
