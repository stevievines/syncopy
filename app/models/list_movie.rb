class ListMovie < ActiveRecord::Base
  belongs_to :list

  validates :title, presence: true
  validates :tmdb_id, presence: true
  validates :list_id, presence: true
end

