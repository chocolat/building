# Chocolat Building Glue

This nothing less than an attempt to create a unified interface to all programming language implementations on earth! Nah, I'm kidding, the goal of this repo is to collect shell scripts that take a source file as input, and pass it through a compiler/interpreter/linter/etc.

## Script Types

The project is organized as `<language>/<tool>/<script>.sh`, and there are a limited number of allowed script names:

* **run.sh** should run the file found in the environment variable `$CHOC_FILE`.
* **repl.sh** should load the file found in the environment variable `$CHOC_FILE` into a repl.
* **check.sh** should should perform syntactic (and optionally semantic) checking on the *standard input* passed to it (it's important that it uses *standard input* and not `$CHOC_FILE` since we want to be able to check as the user is typing).
* **build.sh** should build the file found in the environment variable `$CHOC_FILE` and put its result into `$CHOC_BUILD_DIR`.
* **debug.sh** should run the file found in the environment variable `$CHOC_FILE` under an interactive debugger.

If you have ideas for more scripts, please let us know.

## The .chocbuild file

The optional `.chocbuild` file lives in the project's directory and/or user's home directory. It provides options to scripts, such as:

    $CHOC_BUILD_DIR  # Where to put build products
    $JAVASCRIPT_NODE_RUN_ARGUMENTS   # Arguments that javascript/node/run.sh should pass along to node

## Environment Variables

A few other environment variables are provided to scripts:

    $CHOC_FILE           # The path to the file
    $CHOC_FILENAME       # The name of the file
    $CHOC_EXT            # The file's extension
    $CHOC_FILENAME_NOEXT # The name of the file with the extension removed
    
    $CHOC_FILE_DIR       # The directory that contains the file
    $CHOC_PROJECT_DIR    # THe directory of the base project (may not be the same as $CHOC_FILE_DIR)
    
    $CHOC_TEMPFILE_1     # A path to a temporary file in which you can (please don't use mktemp since it uses the wrong location). The file will be deleted after the script exits.
    $CHOC_TEMPFILE_2
    $CHOC_TEMPFILE_3
    $CHOC_TEMPFILE_4
    $CHOC_TEMPFILE_5

## common.sh

The `common.sh` script is prefixed to all scripts.
