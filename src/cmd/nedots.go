package cmd

import (
	"fmt"
	"os"

	"git.sr.ht/~nedia/nedots/config"
	"github.com/spf13/cobra"
)

var (
	/* Command options/flags */
	Verbosity  int
	ConfigFile string
	RootDir    string

	rootCmd = &cobra.Command{
		Use:   "nedots",
		Short: "Manage configuration files [(ne)dots] - collect & sync dotfiles.",
		Run: func(cmd *cobra.Command, args []string) {
			cmd.Help()
		},
	}
)

func init() {
	cobra.OnInitialize(configure)
	flags()
	commands()
}

func configure() {
	config.Configure(ConfigFile, RootDir)
}

func flags() {
	rootCmd.PersistentFlags().CountVarP(
		&Verbosity,
		"verbosity",
		"v",
		"usage: -vv (none: regular, 1: more verbose, 2: debug)",
	)
	rootCmd.PersistentFlags().StringVarP(
		&ConfigFile,
		"config",
		"c",
		"",
		"config file (default: ~/"+config.DEFAULT_CONFIG+")",
	)
	rootCmd.PersistentFlags().StringVarP(
		&RootDir,
		"directory",
		"d",
		"",
		"nedots directory (default: ~/"+config.DEFAULT_DIR+")",
	)
}

func commands() {
	rootCmd.AddCommand(parseCmd)
	rootCmd.AddCommand(syncCmd)
	rootCmd.AddCommand(copyCmd)
}

func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}
