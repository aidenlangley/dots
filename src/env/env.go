package env

import (
	"os"

	"git.sr.ht/~nedia/nedots/console"
	homedir "github.com/mitchellh/go-homedir"
)

var Home string

func init() {
	home, err := homedir.Dir()
	if err != nil {
		console.Err.Println(err)
		os.Exit(1)
	}

	Home = home
}
