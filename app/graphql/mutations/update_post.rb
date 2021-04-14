module Mutations
  class UpdatePost < BaseMutation
    argument :post_id, ID, required: true
    argument :title, String, required: false
    argument :content, String, required: false
    
    field :post, Types::PostType, null: false
    field :errors, [String], null: false

    def resolve(post_id:, **attributes)
      post = Post.find(post_id)

      if post.update(attributes)
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
