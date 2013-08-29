# encoding: UTF-8

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).

au = Country.find_by_name("Австралия")
as = Country.find_by_name("Американское Самоа")
jp = Country.last

Team.create( name: "Blacksmith", people_count: 4, price: 454, country_id: au.id, tag_list: "покраска, обои, побелка" )
Team.create( name: "White", people_count: 34, price: 2350, country_id: au.id, tag_list: "побелка" )
Team.create( name: "Americano", people_count: 34, price: 4890, country_id: as.id, tag_list: "покраска" )
Team.create( name: "Black", people_count: 34, price: 554890, country_id: au.id, tag_list: "покраска, обои" )
Team.create( name: "Revolvero", people_count: 46, price: 345345, country_id: jp.id, tag_list: "обои, покраска" )
Team.create( name: "Bambuko", people_count: 23, price: 23423423, country_id: as.id, tag_list: "покраска, побелка, мелирование, размелирование" )