class Post < ApplicationRecord
  belongs_to :user
  has_many :comments
  after_initialize :init

  def init
    self.karma = 0
  end
end
