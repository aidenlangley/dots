package config

import (
	"errors"
	"fmt"
	"io/fs"
	"os"

	"git.sr.ht/~nedia/nedots/console"
	"git.sr.ht/~nedia/nedots/env"
)

func ParsePath(path *string) (string, error) {
	_, err := os.Stat(*path)
	if !errors.Is(err, fs.ErrNotExist) {
		return *path, nil
	} else {
		homedPath := env.Home + "/" + *path
		_, err = os.Stat(homedPath)
		if !errors.Is(err, fs.ErrNotExist) {
			return homedPath, nil
		}
		return "", fmt.Errorf("%s could not be found", *path)
	}
}

func Validate(verbosity int) {
	path, err := ParsePath(&Config.Root)
	if err == nil && path != "" {
		Config.Root = path
		Config.DotsDir = Config.Root + "/" + Config.DotsDir
	}
	Report("root", Config.Root, err, verbosity)

	path, err = ParsePath(&Config.DotsDir)
	if err == nil && path != "" {
		Config.DotsDir = path
	}
	Report("dots_dir", Config.DotsDir, err, verbosity)

	for index, path := range Config.Sources {
		path, err = ParsePath(&path)
		if err == nil && path != "" {
			Config.Sources[index] = path
		}
		Report(
			fmt.Sprintf("sources[%d]", index),
			Config.Sources[index],
			err,
			verbosity,
		)
	}

	for index, submodule := range Config.Submodules {
		path, err = ParsePath(&submodule.Path)
		if err == nil && path != "" {
			Config.Submodules[index].Path = path
		}
		Report(
			fmt.Sprintf("submodules[%d]", index),
			Config.Submodules[index].Path,
			err,
			verbosity,
		)
	}
}

func Report(key, path string, err error, verbosity int) {
	if verbosity >= 1 {
		if err != nil {
			console.Err.Printf("FAILED")
			fmt.Printf(" %s\n", err)
		} else {
			if verbosity >= 2 {
				console.Affirm.Printf("OK")
				fmt.Printf(" %s: %s\n", key, path)
			}
		}
	}
}
