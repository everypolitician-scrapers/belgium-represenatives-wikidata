#!/bin/env ruby
# encoding: utf-8

require 'everypolitician'
require 'wikidata/fetcher'

existing = EveryPolitician::Index.new.country("Belgium").lower_house.popolo.persons.map(&:wikidata).compact
names = EveryPolitician::Wikidata.morph_wikinames(source: 'everypolitician-scrapers/belgium-representatives-wikipedia', column: 'wikiname__nl')

ids = %w(Q29051908)

EveryPolitician::Wikidata.scrape_wikidata(ids: existing | ids, names: { nl: names })
