# fzf-cheatsheets

Use [fzf](https://github.com/junegunn/fzf) to search through "cheatsheets" of
useful commands.

![Demo of the features, showing selecting commands from the cheatsheets in various ways](demo.gif?raw=true "Demo")

## Installation

### [oh-my-zsh](https://github.com/ohmyzsh/ohmyzsh)

This can be used as a plugin, so just

    git clone https://github.com/james-w/fzf-cheatsheets ~/.oh-my-zsh/plugins/fzf-cheatsheets

### zsh

Clone the repo somewhere, and then in your `.zshrc` add

    FZF_CHEATSHEETS_DIR=<directory where you cloned this repo>
    export PATH="$PATH:${FZF_CHEATSHEETS_DIR}/bin"
    source "${FZF_CHEATSHEETS_DIR}/shell/fzf-cheatsheets.zsh

### bash

Clone the repo somewhere, and then in your `.bashrc` add

    FZF_CHEATSHEETS_DIR=<directory where you cloned this repo>
    export PATH="$PATH:${FZF_CHEATSHEETS_DIR}/bin"
    source "${FZF_CHEATSHEETS_DIR}/shell/fzf-cheatsheets.bash"

## Usage

The default binding is `Ctrl-x Ctrl-p` (i.e. hit one then the other).

You will be prompted to select the cheatsheet to use, and then to select
the command that you want.

Hitting `Enter` at the command listing will place that command in to your
prompt for you to change or execute.

Hitting `Ctrl-e` will open your editor to edit the command. There
will be comments to help you understand what the command does, and you
can leave those there. Once you are happy then quit your editor and
your command line will contain the command ready to run.

If you have some text in your prompt already then that will be used to
pre-filter the options.

The first word in the command line will select the cheatsheet, so if you have

    > git 

when you activate the plugin it will immediately offer you the commands from
the cheatsheet for `git`.

If you have

    > git push

when you activate the plugin it will select the `git` cheatsheet, and put
`push` as the query in the command selector, hopefully taking you to the
commands that you are interested in. You can amend the query however you like
at this point.

You can also use the command directly if you prefer:

    fzf-cheatsheets
    fzf-cheatsheets git

In this case the command will be executed when you have finished, it won't be
added to your command line.

## Adding cheatsheets

You can add your own cheatsheets.

You can set `CHEATSHEETS_DIR` environment variable to point to a set of
cheatsheet files, or you can send PRs here.

The files should be named after the command that they should be used for.

The cheatsheet files are pretty simple, with a command per line.

    git status

Comments can be added after the command

    git status # Shows the status of the repo

For more complex commands you can add comments on following lines to expand
further.

    git status # Shows the status of the repo
    # Here is some more information

Everything up to the next command will be considered comments for that
command.

## Inspiration

Reddit user u/techAndLanguage [suggested the idea](https://www.reddit.com/r/vim/comments/g8haqm/question_about_how_to_use_vim_as_a_stream_editor/)

Some of the cheatsheets started from [awesome-cheatsheets](https://github.com/LeCoupa/awesome-cheatsheets)
