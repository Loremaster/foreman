# encoding: UTF-8
class Country < ActiveRecord::Base
  attr_accessible :name

  has_many :teams

  validates :name,
              :presence => { :message => "Поле не должно быть пустым" },
              :length   => { :maximum => 250, :message => "Поле должно содержать не более %{count} символов" }
end
