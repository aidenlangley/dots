package cmd

import (
	"errors"
	"fmt"
	"io/fs"
	"os"
	"os/exec"
	"strings"

	"git.sr.ht/~nedia/nedots/config"
	"git.sr.ht/~nedia/nedots/console"
	"github.com/spf13/cobra"
)

const DEFAULT_DOTS_DIR = "dots"

var copyCmd = &cobra.Command{
	Use:   "copy",
	Short: "Copy files & directories to nedots root directory",
	Run: func(cmd *cobra.Command, args []string) {
		config.Validate(Verbosity)
		for _, path := range config.Config.Sources {
			cp(path, config.Config.DotsDir)
		}
	},
}

func mkdir(path string) {
	cmd := exec.Command("mkdir", "-vp", path)

	_, err := os.Stat(path)
	if !errors.Is(err, fs.ErrNotExist) {
		// Directory exists, we don't need to do anything else.
		if Verbosity >= 2 {
			console.Notify.Printf("Path exists, skipping: %s\n", path)
			return
		}
	}

	out, err := cmd.Output()
	if err != nil {
		console.Err.Printf("FAILED")
		fmt.Printf(" `%s` failed, %s\n", strings.Join(cmd.Args, " "), err)
		os.Exit(1)
	}

	if Verbosity >= 1 {
		if Verbosity >= 2 {
			fmt.Printf(string(out))
		}
		console.Affirm.Printf("OK")
		fmt.Printf(" Made %s\n", path)
	}
}

func cp(src, dst string) {
	args := []string{"-u"}

	// Sources are validated prior to this in regular runtime, but we'll double
	// check that src exists here.
	info, err := os.Stat(src)
	if errors.Is(err, fs.ErrNotExist) {
		console.Err.Printf("FAILED")
		fmt.Printf(" Cannot copy: %s, src does not exist\n", src)
		os.Exit(1)
	}

	if info.IsDir() {
		// When src is a directory, we'll recursively copy. We also pass -T - this
		// tells `cp` to treat the target directory like a regular file. The source
		// directory will overwrite the target directory this way.
		args = append(args, "-rT")

		// We'll also recreate the source directory structure under `dots_dir` with
		// `mkdir`, so we'll set `dst` here.
		dst = dst + src
	} else {
		// When dealing with a file, we'll remove the final part of the path, i.e.
		// the filename portion.
		srcParts := strings.Split(src, "/")
		dst = dst + strings.Replace(src, srcParts[len(srcParts)-1], "", 1)
	}

	mkdir(dst)
	args = append(args, src, dst)
	cmd := exec.Command("cp", args...)
	out, err := cmd.Output()
	if err != nil {
		console.Err.Printf("FAILED")
		fmt.Printf(" `%s` failed, %s\n", strings.Join(cmd.Args, " "), err)
		os.Exit(1)
	}

	if Verbosity >= 1 {
		if Verbosity >= 2 {
			fmt.Printf(string(out))
		}
		console.Affirm.Printf("OK")
		fmt.Printf(" Copied %s -> %s\n", src, dst)
	}
}
