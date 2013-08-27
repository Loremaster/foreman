# encoding: UTF-8
class Country < ActiveRecord::Base
  attr_accessible :name

  validates :name,
              :presence => { :message => "Поле не должно быть пустым" },
              :length   => { :maximum => 250, :message => "Поле должно содержать не более %{count} символов" }
end
