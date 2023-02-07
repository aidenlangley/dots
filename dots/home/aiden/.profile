#! /usr/bin/env bash

PATH="$HOME"/bin:"$HOME"/.local/bin:/usr/local/go/bin:"$PATH"
PATH="$HOME"/.npm:"$PATH"

# Add dotnet & csharp-ls to PATH
PATH="$HOME"/.dotnet/tools:"$PATH"
export PATH

EDITOR=$(which nvim)
export EDITOR
