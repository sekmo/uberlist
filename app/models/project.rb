class Project < ApplicationRecord
  belongs_to :user
  has_many :tasks, dependent: :destroy
  validates :name, presence: true

  def self.find_by_user(user)
    where(user: user)
  end
end
