class User < ApplicationRecord
  has_many :posts
  has_many :comments
  after_initialize :init

  def init
    self.comment_karma = 0
    self.post_karma = 0
  end
end
