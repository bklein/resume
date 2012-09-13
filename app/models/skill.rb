class Skill < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_acessible :name
  belongs_to :user
  belongs_to :language
end
