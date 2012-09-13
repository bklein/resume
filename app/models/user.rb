class User < ActiveRecord::Base
  attr_accessible :name
  has_and_belongs_to_many :languages
  
  def gather_language_string
  	languages = []
  	this.laguages.each do |lan|
  		languages << lan.name
  	end
  	languages.join(', ')
  end
end
