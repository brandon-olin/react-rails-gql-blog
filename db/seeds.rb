10.times do
  user = User.create(name: Faker::Name.name, email: Faker::Internet.email)
  rand(1..10).times do
    post = user.posts.create(title: Faker::Book.title, content: Faker::Lorem.paragraph(sentence_count: 10))
    rand(1..10).times do
      post.post_votes.create(value: rand(0..1) == 1 ? 1 : -1, post_id: post.id, user_id: user.id)
    end
    rand(1..10).times do |i|
      comment = post.comments.create(content: Faker::TvShows::RickAndMorty.quote, user_id: user.id)
      rand(1..10).times do |i|
        subcomment = comment.subcomments.create(content: Faker::TvShows::RickAndMorty.quote, user_id: user.id)
      end
    end
  end
end