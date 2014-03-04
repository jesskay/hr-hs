hr in Haskell
=============

Inspired by LuRsT_'s hr_, but written in Haskell instead, because why not?

.. _LuRsT: https://github.com/LuRsT
.. _hr: https://github.com/LuRsT/hr

Installation
------------

Clone the repository, or obtain ``hr.hs`` by whatever other means, then in
the directory it's in, run

::

    $ ghc --make hr.hs  # you will, of course, require GHC for this
    $ cp hr ~/bin       # ~/bin should be in your $PATH

Usage
-----

To get a plain and simple line (repeats until terminal width, or 80 characters
if your system lacks ``tput``)::

    $ hr
    ################################

For more interesting lines, you can give ``hr`` arguments, each of which is
used as a repeating pattern for one line::

    $ hr -
    ---------------------------------

    $ hr - '#' -
    ---------------------------------
    ################################
    ---------------------------------

    $ hr '-#-'
    -#--#--#--#--#--#--#--#--#--#--#-

    $ hr '.^._'
    .^._.^._.^._.^._.^._.^._.^._.^._.

And so on.
