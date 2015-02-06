class CitiesController < ApplicationController
  validates :name, 
    presence: true, 
    uniqueness: true
end
