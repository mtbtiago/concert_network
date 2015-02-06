class Comment < ActiveRecord::Base
  belongs_to :concert

  validates :author, presence: true
  validates :when, presence: true
  validates :comment, length: { minimum: 10 }

  after_initialize :on_new_record

  private

  def on_new_record
    self.when ||= DateTime.now
  end
end
