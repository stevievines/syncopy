class List < ActiveRecord::Base
  belongs_to :user
  has_many :list_movies
  has_many :movies, through: :list_movies, source: :movie

  validates :title, presence: true
  validates :user_id, presence: true
end
