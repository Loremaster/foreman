class Team < ActiveRecord::Base
  attr_accessible :country_id, :name, :people_count, :price

  belongs_to :country
end
