class Post < ApplicationRecord

  belongs_to :user

  validates :text,    present: true
end
