module Mutations
  class CreateComment < BaseMutation
    argument :content, String, required: true
    argument :user_id, ID, required: true
    argument :post_id, ID, required: true

    field :comment, Types::CommentType, null: false
    field :user, Types::UserType, null: false
    field :post, Types::PostType, null: false
    field :errors, [String], null: false

    def resolve(content:, user_id:, post_id:)
      user = User.find(user_id)
      post = Post.find(post_id)
      comment = post.comments.new(content: content, user_id: user_id)
      if comment.save
        {
          comment: comment,
          user: user,
          post: post,
          errors: []
        }
      else
        {
          comment: nil,
          user: nil,
          post: nil,
          errors: comment.errors.full_messages
        }
      end
    end
  end
end
