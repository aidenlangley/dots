package ops

import (
	"errors"
	"fmt"
	"io/fs"
	"os"
	"os/exec"
	"strings"

	"git.sr.ht/~nedia/nedots/console"
)

func MakeDirectory(path string, verbosity int) {
	cmd := exec.Command("mkdir", "-vp", path)

	_, err := os.Stat(path)
	if !errors.Is(err, fs.ErrNotExist) {
		// Directory exists, we don't need to do anything else.
		if verbosity >= 2 {
			console.Notify.Printf("Path exists, skipping: %s\n", path)
		}
		return
	}

	out, err := cmd.Output()
	if err != nil {
		console.Err.Printf("FAILED")
		fmt.Printf(" `%s` failed, %s\n", strings.Join(cmd.Args, " "), err)
		os.Exit(1)
	}

	if verbosity >= 1 {
		if verbosity >= 2 {
			fmt.Printf(string(out))
		}
		console.Affirm.Printf("OK")
		fmt.Printf(" Made %s\n", path)
	}
}

func Copy(src, dst string, verbosity int) {
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
		// the filename portion, so that we can create the holding directories of
		// the file.
		srcParts := strings.Split(src, "/")
		dst = dst + strings.Replace(src, srcParts[len(srcParts)-1], "", 1)
	}

	// Make the directories.
	MakeDirectory(dst, (verbosity - 1))

	// We've now collected our args.
	args = append(args, src, dst)
	cmd := exec.Command("cp", args...)

	// Run the `cp` operation.
	out, err := cmd.Output()
	if err != nil {
		console.Err.Printf("FAILED")
		fmt.Printf(" `%s` failed, %s\n", strings.Join(cmd.Args, " "), err)
		os.Exit(1)
	}

	if verbosity >= 1 {
		if verbosity >= 2 {
			fmt.Printf(string(out))
		}
		console.Affirm.Printf("OK")
		fmt.Printf(" Copied %s -> %s\n", src, dst)
	}
}
