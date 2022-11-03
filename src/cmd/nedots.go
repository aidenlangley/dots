// Package cmd ...
package cmd

import (
	"fmt"
	"os"

	homedir "github.com/mitchellh/go-homedir"
	"github.com/spf13/cobra"
	"github.com/spf13/viper"
)

var (
	Verbosity  int
	ConfigFile string
	RootDir    string
	rootCmd    = &cobra.Command{
		Use:   "nedots",
		Short: "Manage (ne)dots - collect & sync dotfiles.",
		Run: func(cmd *cobra.Command, args []string) {
			fmt.Println("Hello nedots!")
		},
	}
)

// Execute Run nedots, print error to stdout?
func Execute() {
	if err := rootCmd.Execute(); err != nil {
		fmt.Println(err)
		os.Exit(1)
	}
}

func init() {
	cobra.OnInitialize(readConfigFile)

	rootCmd.PersistentFlags().CountVarP(
		&Verbosity,
		"verbosity",
		"v",
		"uage: -vv (none: regular, 1: more verbose, 2: debug)",
	)
	rootCmd.PersistentFlags().StringVarP(
		&ConfigFile,
		"config",
		"c",
		"",
		"config file (default: $HOME/.nedots/.nedots.yml)",
	)
	rootCmd.PersistentFlags().StringVarP(
		&RootDir,
		"directory",
		"d",
		"",
		"nedots directory (default: $HOME/.nedots)",
	)

	rootCmd.AddCommand(syncCmd)
}

func readConfigFile() {
	if ConfigFile != "" {
		// We've been passed a configuration file so no need to find it ourselves
		viper.SetConfigFile(ConfigFile)
	} else {
		if RootDir != "" {
			// We've been passed a directory that is different to the default
			viper.AddConfigPath(RootDir)
		} else {
			// Otherwise, we'll find the home directory & check the default location
			// Find home directory
			home, err := homedir.Dir()
			if err != nil {
				fmt.Println(err)
				os.Exit(1)
			}

			viper.AddConfigPath(home + "/.nedots")
		}

		viper.SetConfigName(".nedots")
	}

	if err := viper.ReadInConfig(); err != nil {
		fmt.Println("Can't read config:", err)
		os.Exit(1)
	}
}
