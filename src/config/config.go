package config

import (
	"fmt"
	"os"

	"git.sr.ht/~nedia/nedots/console"
	"git.sr.ht/~nedia/nedots/env"
	"github.com/spf13/viper"
)

const (
	ENV_PREFIX     = "NEDOTS"
	DEFAULT_DIR    = ".nedots"
	CFG_FILENAME   = ".nedots"
	CFG_EXTENSION  = "yml"
	DEFAULT_CONFIG = DEFAULT_DIR + "/" + CFG_FILENAME + "." + CFG_EXTENSION
)

type config struct {
	Root    string
	DotsDir string `mapstructure:"dots_dir"`
	Remote  string
	Symlink bool
	Sources []string

	Submodules []struct {
		Remote string
		Path   string
	}

	Systemd struct {
		Services []string
	}
}

var Config config

func Configure(configFile, rootDir string) {
	if configFile != "" {
		// We've been passed a configuration file so no need to find it ourselves
		viper.SetConfigFile(configFile)
	} else {
		if rootDir != "" {
			// We've been passed a directory that is different to the default
			viper.AddConfigPath(rootDir)
		} else {
			viper.AddConfigPath(env.Home + "/" + DEFAULT_DIR)
		}

		viper.SetConfigName(CFG_FILENAME)
	}

	// Environment variables prefixed with this will be bound to config values
	// with the same key. Config keys are automically uppercased.
	viper.SetEnvPrefix(ENV_PREFIX)
	viper.AutomaticEnv()

	read()
	unmarshal()
	setRootDir(rootDir)
}

func read() {
	if err := viper.ReadInConfig(); err != nil {
		console.Err.Printf("FAILED")
		fmt.Printf(" Failed to read config: %s\n", err)
		os.Exit(1)
	}
}

func unmarshal() {
	// Unmarshal config to struct - better this way as we can easily manipulate
	// the data after the fact.
	if err := viper.Unmarshal(&Config); err != nil {
		console.Err.Printf("FAILED ")
		fmt.Printf(" Cannot unmarshal config: %s\n", err)
		os.Exit(1)
	}
}

func setRootDir(dir string) {
	if dir != "" {
		Config.Root = dir
	}
}
