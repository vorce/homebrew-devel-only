# Homebrew Devel-Only
These formulae are only available as pre-release versions and have no stable tarballs.

## Why is "devel-only" bad?
There's a few problems with devel-only software:

* Upstream doesn't consider it stable yet so we shouldn't be recommending it to users.
* Things are more likely to dramatically change or break and that adds to our support burden.

## What can I do to get this back in Homebrew core?
Contact the software's developer and ask them to tag a stable release. If the software has a stable release and works reliably, feel free to submit a pull request at the main Homebrew repository.

## How do I install these formulae?
`brew install --devel homebrew/devel-only/<formula>`

Or `brew tap homebrew/devel-only` and then `brew install --devel <formula>`

Or install via URL (which will not receive updates):

```
brew install --devel https://raw.githubusercontent.com/Homebrew/homebrew-devel-only/master/Formula/<formula>.rb
```

## Documentation
`brew help`, `man brew` or check [Homebrew's documentation](https://github.com/Homebrew/homebrew/tree/master/share/doc/homebrew#readme).
