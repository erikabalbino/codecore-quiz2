class Idea < ApplicationRecord
  has_many :reviews, dependent: :destroy

  validates :title, presence: true, uniqueness: true

  validates :description,
    presence: {message: "must be given"},
    length: {minimum: 50}

  #custom validate:
  validate :no_monkey

  private
  def no_monkey
    if description&.downcase.include?('monkey')
      errors.add(:description,  "must not have a monkey")
    end
  end
end
