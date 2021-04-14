module Mutations
  class DeletePost < BaseMutation
    argument :post_id, ID, required: true

    field :post, Types::PostType, null: false
    field :errors, [String], null: false

    def resolve(post_id:)
      post = Post.find(post_id)
      post_comments = Comment.where(post_id: post_id)

      if post_comments.destroy_all && post.destroy
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
