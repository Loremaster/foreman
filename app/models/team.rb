# encoding: UTF-8
class Team < ActiveRecord::Base
  acts_as_taggable

  attr_accessible :country_id, :name, :people_count, :price, :tag_list

  belongs_to :country

  validates :name,
            :presence => { :message => "Поле не должно быть пустым" },
            :length   => { :maximum => 250, :message => "Поле должно содержать не более %{count} символов" }

  validates :people_count,
            :presence => { :message => "Поле не должно быть пустым" },
            :numericality => { :only_integer => true,
                               :greater_than => 0,
                               :less_than_or_equal_to => 100,
                               :message => "Значение должно быть целым числом от 1 до 100."  }

  validates :price,
            :presence => { :message => "Поле не должно быть пустым" },
            :numericality => { :only_integer => true,
                               :greater_than => 0,
                               :less_than_or_equal_to => 100_000_000,
                               :message => "Значение должно быть целым числом от 1 до 100 миллионов" }

  validates :country_id,
            :presence => { :message => "Страна должна быть выбрана" }

  validates :tag_list,
            :length => { :minimum => 1, :message => "Укажите хотя бы 1 тег" }
end
