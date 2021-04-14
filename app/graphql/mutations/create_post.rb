module Mutations
  class CreatePost < BaseMutation
    argument :title, String, required: true
    argument :user_id, ID, required: true
    argument :content, String, required: false

    field :post, Types::PostType, null: false
    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(title:, user_id:, content: "")
      user = User.find(user_id)
      post = user.posts.new(title: title, content: content, user_id: user_id)
      
      if post.save
        {
          post: post,
          user: user,
          errors: []
        }
      else
        {
          post: nil,
          user: nil,
          errors: post.errors.full_messages
        }
      end
    end
  end
end
