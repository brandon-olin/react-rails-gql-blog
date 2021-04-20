5.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email)
  5.times do
    post = user.posts.create(title: Faker::Book.title, content: Faker::Lorem.paragraph(sentence_count: 10), karma: 0)
    5.times do |i|
      comment = post.comments.create(content: Faker::TvShows::RickAndMorty.quote, user_id: user.id)
      5.times do |i|
        subcomment = comment.subcomments.create(content: Faker::TvShows::RickAndMorty.quote, user_id: user.id)
      end
    end
  end
end