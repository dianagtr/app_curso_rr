class Course < ActiveRecord::Base
  attr_accessible :description, :name, :active, :start_date, :location
  has_many :editions
  validates :name, :presence => true
  validates :active, :inclusion => [true, false]

  #validates_each :start_date  do |record, attr, value|
  #  record.errors.add attr, "can't be future if active" if value < Date.today && record.active?
  #end

  validates_each :start_date do |record, attr, value|
    error_cond = value && value < Date.today && record.active?
    error_msg = "La fecha no puede estar en el futuro si el curso es active"
    record.errors.add(attr, error_msg) if error_cond
  end
  
end
