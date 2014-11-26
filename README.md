Homebrew-devel
=================
These formulae are only available as pre-release versions, and have no stable tarballs.

How do I install these formulae?
--------------------------------
Just `brew tap domt4/devel` and then `brew install <formula>`.

If the formula conflicts with one from Homebrew/homebrew or another tap, you can `brew install domt4/devel/<formula>`.

You can also install via URL:

```
brew install https://raw.githubusercontent.com/domt4/homebrew-devel/master/<formula>.rb
```

Why is “devel” bad?
-----------------------

Devel is great! Developmental releases are the egg that gives life to exciting new ideas and projects, but…

* Since there's no stable release, the software is liable to change at any moment. We can't guarantee that developmental software will build reliably or be compatible with other software which builds against it, and that increases our support burden.

What can I do to get x formula into Homebrew core?
------------------------------------------------

Contact the software's developer and ask them to tag a stable release. If the software has a stable release and works reliably, feel free to submit a pull request at the main Homebrew repository.

Docs
----
`brew help`, `man brew`, or the Homebrew [documentation](https://github.com/Homebrew/homebrew/tree/master/share/doc/homebrew).