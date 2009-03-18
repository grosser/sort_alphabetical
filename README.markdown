Adds .sort_alphabetical and .sort_alphabetical_by to enumberable, which
sort a Enumberable (Array/Hash...) of UTF8 Strings alphabetical.
    ['b','á'].sort_alphabetical == ['á','b']
    [['b',1],['á',2]].sort_alphabetical_by(&:first) == [['á',2],['b',1]]

Setup
=====
    sudo gem install active_support
    sudo gem install grosser-sort_alphabetical -s http://gems.github.com/

Authors
=======
The basic unified UTF8 sorting idead comes from [Marc-Andre](http://marc-andre.ca/).

[Michael Grosser](http://pragmatig.wordpress.com)  
grosser.michael@gmail.com  
Hereby placed under public domain, do what you want, just do not hold me accountable...  