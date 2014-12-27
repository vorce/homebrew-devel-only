# Homebrew Devel
These formulae are only available as pre-release versions and have no stable tarballs.

## Why is "devel-only" bad?
There's a few problems with devel-only software:

* Upstream doesn't consider it stable yet so we shouldn't be recommending it to users.
* Things are more likely to dramtically change or break and that adds to our support burden.

## What can I do to get this back in Homebrew core?
Contact the software's developer and ask them to tag a stable release. If the software has a stable release and works reliably, feel free to submit a pull request at the main Homebrew repository.

## How do I install these formulae?
`brew install homebrew/devel/<formula>`

Or `brew tap homebrew/devel` and then `brew install <formula>`.

Or install via URL (which will not receive updates):

```
brew install https://raw.githubusercontent.com/Homebrew/homebrew-devel/master/<formula>.rb
```

## Documentation
`brew help`, `man brew` or check [Homebrew's documentation](https://github.com/Homebrew/homebrew/tree/master/share/doc/homebrew#readme).
