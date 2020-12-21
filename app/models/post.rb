# frozen_string_literal: true

class Post < ApplicationRecord
  has_one_attached :image
  has_many_attached :images

  has_many :comments, as: :object
  belongs_to :user

  # зв'язки
  # один
  # багато
  #
  # один до одного
  # один до багатьох
  # багато до одного
  # багато до багатьох
  #
  # строгий(сильний)
  # не строгий(слабкий)
  #
  # https://guides.rubyonrails.org/association_basics.html
  # belongs_to - строгий одинарний
  # belongs_to, optional: true, не строгий одинарний
  # has_one - не строгий одинарний
  # has_one :trought
  # has_many - не строгий багато
  # has_many :trought
  # has_and_belongs_to_many - строгий багато

  # Поліморфізм

  def photo
    if image.attached?
      image
    else
      '/undefind.png'
    end
  end
end
