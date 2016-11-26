#!/bin/env ruby
# encoding: utf-8

require 'wikidata/fetcher'
require 'everypolitician'

existing = EveryPolitician::Index.new.country("Belgium").lower_house.popolo.persons.map(&:wikidata).compact

names = EveryPolitician::Wikidata.morph_wikinames(source: 'tmtmtmtm/belgium-represenatives-wikipedia', column: 'wikiname__nl')
EveryPolitician::Wikidata.scrape_wikidata(ids: existing, names: { nl: names })
