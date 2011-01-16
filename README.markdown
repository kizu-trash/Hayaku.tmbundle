# Hayaku Bundle
Oh, hi, there is my humble bundle with some nice features like smart CSS abbreviations expand and some useful general-purpose commands.

Everything there right now is an early alpha status, there are a lot of bugs and flaws, but I hope I could find time to make it better and better. However, you can fork me, change anything you want and request a pull!

## Smart CSS Expand
This bundle uses a [zen-coding](http://code.google.com/p/zen-coding/) like syntax to expand different CSS abbreviations into a full CSS properties with values.

It uses some dictionary with all the CSS properties and values in a hash and when you expand an abbreviation it tries find an appropriate pair and give you just what you want. The dictionary right now is hand-filled, but I plan to fill it automatically by some script from the actual w3 specs and other sources.

The bundle uses an `Enter` key for expand, at first I tried to use Tab for expand, but there are some difficulties in TextMate that make it almost impossible (the tabstops are overlapped by the command and tabstops are essential, so no Tab key expand).

However, of course, the key for expand as everything in TextMate can be replaced with anything you want (for example, for Zen-Coding friendly `CMD+E`), so an `Enter` is just a default.

The full list of expand's features'd be coming soon.

## Changing numbers
The first general-purpose feature is a number-changer.

When you're on any digit, number, or a word, that have a number in it, press `ctrl+↑` or `ctrl+↓` to increment of decrement it.

Add `shift` to this shortcut to change number by 10 or `option/alt` to change it by 0.1

How cool is that? :)

## Multiple carets
The “One Big Thing” I'm up to now is that second general-purpose command.

It's just one idea that I wanted to do some day, but not so long ago I stumbled over something that do almost that I wanted — [Duane Johnson's Bundle](http://inquirylabs.com/blog2009/my-textmate-bundle/) have thing, called “Multiple Arbitrary Simultaneous Carets”. I looked at it, remembered my idea and wanted to make it by myself.

The whole Idea was to use only one key to place a caret — in MASC it's done by placing caret placeholder by one shortcut and using it later for replacement by another shortcut. It besides had some other flaws, but anyway: thanks, Duane for an inspiration!

So, what my variant is.

* Single shortcut (just an `§`) makes an caret (it can be seen now as a `⟨⟩` chars) for placing caret and executing replacement action.
* Any selections are supported: a single caret, simple selection and selection in a column mode. It's framed in the mentioned symbols, like `⟨selection⟩`.
* Before you start typing in a carets you can see everything in selection, and just as you start to type — everything in all carets is replaced to what you type.

So, that's it.

There are some bugs and things that I plan to fix and do, but the command is already working.

I plan to do a lot of things using the code I wrote for this command, so stay tuned.
