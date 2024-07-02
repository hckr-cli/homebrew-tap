# homebrew-tap

Easily install the [Hckr CLI](https://github.com/pateash/hckr) using [Homebrew](https://brew.sh/).


[//]: # (Full documentation about installation can be found at:)

[//]: # (* &#40;AWS&#41; https://docs.databricks.com/en/dev-tools/cli/install.html)

[//]: # (* &#40;Azure&#41; https://learn.microsoft.com/en-us/azure/databricks/dev-tools/cli/install)

[//]: # (* &#40;GCP&#41; https://docs.gcp.databricks.com/en/dev-tools/cli/install.html)

## Usage

Initialize tap:

```bash
brew tap hckr-cli/tap
```

To install or upgrade the Hckr CLI, run:

```bash
brew install hckr
```

If this tap has been updated but you don't see it show up locally, you can force an update with:

```bash
brew update --force
```

## Shell completion

As long as you have configured shell completion for Homebrew itself,
shell completion for the Hckr CLI will work out of the box.

You can find documentation for setting this up at https://docs.brew.sh/Shell-Completion.
