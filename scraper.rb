#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'

names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/belgium-represenatives-wikipedia', column: 'wikiname__nl')
EveryPolitician::Wikidata.scrape_wikidata(names: { nl: names }, output: false)
