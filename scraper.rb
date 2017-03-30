#!/bin/env ruby
# encoding: utf-8

require 'everypolitician'
require 'wikidata/fetcher'

existing = EveryPolitician::Index.new.country("Belgium").lower_house.popolo.persons.map(&:wikidata).compact
names = EveryPolitician::Wikidata.morph_wikinames(source: 'everypolitician-scrapers/belgium-representatives-wikipedia', column: 'wikiname__nl')

# Find all P39s of the 54th Term
query = <<EOS
  SELECT DISTINCT ?item
  WHERE
  {
    BIND(wd:Q15705021 AS ?membership)
    BIND(wd:Q17173094 AS ?term)

    ?item p:P39 ?position_statement .
    ?position_statement ps:P39 ?membership .
    ?position_statement pq:P2937 ?term .
  }
EOS
p39s = EveryPolitician::Wikidata.sparql(query)

EveryPolitician::Wikidata.scrape_wikidata(ids: existing | p39s, names: { nl: names })
