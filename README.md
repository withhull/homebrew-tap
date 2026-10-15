# Hull Code Homebrew Tap

This repository is the Homebrew tap for the Hull CLI.

## Installation

After the first public Hull CLI release is published:

```bash
brew install withhull/tap/hull
```

Then verify the installation:

```bash
hull --version
```

## Updating

```bash
brew update
brew upgrade hull
```

## Release ownership

The Hull Code release workflow generates `hull.rb` from published, checksummed CLI archives and pushes the formula to this repository. Do not add an unverified formula manually.

The formula is intentionally absent until the first approved public release has downloadable macOS and Linux archives. This prevents Homebrew from advertising an installation that cannot succeed.

