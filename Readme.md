Adds `sort_alphabetical` and `sort_alphabetical_by` to Enumberable(Array/Hash...),
which sorts UTF8 Strings alphabetical.
This sorting is done by placing variants on the same level as base character (A comes before Ä but ÄA comes before AB).

Setup
=====
 - As Rails plugin: `rails plugin install git://github.com/grosser/sort_alphabetical.git `
 - As gem: ` sudo gem install sort_alphabetical `

Usage
=====
    ['b','á'].sort_alphabetical == ['á','b']
    [['b',1],['á',2]].sort_alphabetical_by(&:first) == [['á',2],['b',1]]

    SortAlphabetical.to_ascii('á') == 'a'

TODO
====
 - fix specs for 1.9
 - Sort non-ascii-convertables like ß(ss), œ(oe) , ﬁ(fi), see [Ligatures](http://en.wikipedia.org/wiki/Typographical_ligature)
 - Integrate natural sorting e.g. `['a11', 'a2'] => ['a2', 'a11']` like [NaturalSort](http://rubyforge.org/projects/naturalsort)

Authors
=======
 - original string_to_ascii: [Marc-Andre](http://marc-andre.ca/).

[Michael Grosser](http://grosser.it)<br/>
michael@grosser.it<br/>
Hereby placed under public domain, do what you want, just do not hold me accountable...
