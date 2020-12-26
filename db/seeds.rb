require 'faker'
User.create!(email: 'rik@gmail.com', password: '123456', password_confirmation: '123456')

Category.create!(
  [
    { name: 'cATEGORY 1' },
    { name: 'Sport' },
    { name: 'Other' }
  ]
)

10.times do
  post = Post.create!(
    title: Faker::Movie.title,
    body: Faker::Movie.quote,
    user_id: 1,
    category_id: 1
  )
  begin
    file = URI.parse('https://picsum.photos/300').open
    post.image.attach(io: file, filename: post.title.to_s)
  rescue OpenURI::HTTPError => e
    pp e
  end
end
