class Movie < ApplicationRecord
  has_many :bookmarks, truebefore_destroy: :check
  has_many :lists, through: :bookmarks
  validates :title, uniqueness: true, presence: true
  validates :overview, uniqueness: true, presence: truebefore_destroy :check
end
def check
  # will always be true since all grandchildren have already been destroyed at this stage
  return self.grandchildren.still_there.empty?
 end
