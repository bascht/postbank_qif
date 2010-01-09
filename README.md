## Simple CSV to QIF converter for the german postbank ##

I recently stumbled upon **iCompta** [http://www.lyricapps.com/iCompta/], 
a neat finance app for Mac OS X. Sadly the importing of the postbank
csv files was a complete f***up 'cause one will end up mapping the
csv header manually for each column. 

Fortunately iCompta also supports the QIF... *...and guess what happened.*

### Usage ###
Straight forward - simply pipe it into your output file:

    ruby postbank_qif.rb path_to_csv_file.csv > postbank.qif

## Copyright ##
  {2010 Bascht}. Licensed under the MIT License:
  http://www.opensource.org/licenses/mit-license.php


