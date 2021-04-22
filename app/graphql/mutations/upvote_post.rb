module Mutations
  class UpvotePost < BaseMutation
    argument :post_id, ID, required: true
    argument :user_id, ID, required: true

    field :post, Types::PostType, null: false
    field :errors, [String], null: false

    def resolve(post_id:, user_id:)
      post = Post.find(post_id)
      puts "Pre-upvote karma: #{post.karma}"
      if post.user.id == user_id
        {
          post: post,
          errors: ["You can't upvote your own post, you filthy cheater!"]
        }
      elsif post.increment!(:karma, by = 1)
        puts "Post-upvote karma: #{post.karma}"
        {
          post: post,
          errors: []
        }
      else
        {
          post: post,
          errors: post.errors.full_messages
        }
      end
    end
  end
end
