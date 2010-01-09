#!/usr/bin/env ruby
# -*- coding: utf-8 -*-

require 'csv'
require 'iconv'
require 'parsedate'

filename = ARGV[0]

raise "File %s not found" % ARGV[0] if not File.exist? filename

# Convert LATIN1 File to UTF8
latin_csv = File.open(filename).read 
utf8_csv = Iconv.iconv("UTF-8", "LATIN1", latin_csv).join
reader = CSV::Reader.create(utf8_csv, "\t") 

default_header = ['Datum', 'Wertstellung', 'Art', 'Buchungshinweis', 'Auftraggeber', 'Empfänger', 'Betrag Euro', 'Saldo Euro']

10.times{reader.shift}
header = reader.shift

raise StandardError, "No Header found" if header != default_header

puts "!Type:Bank"

for row in reader do
  date      = ParseDate.parsedate(row[0])
  date      = sprintf("D%s\/%s\/%s", date[1], date[2], date[0])
  category  = sprintf("N%s", row[2])
  memo      = sprintf("M%s", row[3])
  payee     = sprintf("P%s", row[5])
  amount    = sprintf("T%.2f", row[6].gsub(",", "."))
  clearance = 'C*'

  puts date, category, amount, memo, payee, amount, clearance, '^'
end
