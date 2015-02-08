class TodayOrLaterValidator < ActiveModel::Validator
  def validate(record)
    unless record.date >= Date.today
      record.errors[:date] << 'Date should be today or later'
    end
  end
end

class Concert < ActiveRecord::Base
  has_many :comments, :dependent => :delete_all

  validates :band,
    presence: true,
    uniqueness: true
  validates :description, presence: true
  validates :venue, presence: true
  validates :city, presence: true
  validates :date,
    presence: true
  validates :price,
    presence: true,
    numericality: {greater_than_or_equal_to: 0}

  after_initialize :on_new_record
  validates_with TodayOrLaterValidator

  def self.cities_with_concerts
    Concert.select(:city).group(:city).count.sort
  end

  def more_info
    "Where: #{self.venue}, #{self.city}. On: #{self.date}"
  end

  def self.concerts_today
    Concert.where("date = ?",Date.today)
  end

  def self.next_concerts
    # Two options:
    # Date.today.advance({days: 30}) #-> Date
    # 30.day.from_now # -> DateTime
    Concert.where(
      date: (Date.tomorrow..Date.today.advance({days: 30}))).
      order("date")
  end

  private

  def on_new_record
    self.date ||= Date.today
    self.price ||= 0
  end

end
