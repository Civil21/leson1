# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :post, optional: true
  belongs_to :comment, optional: true
  # belongs_to :object, polymorphic: true, dependent: :destroy #object_id, object_type
  has_many :comments
end
