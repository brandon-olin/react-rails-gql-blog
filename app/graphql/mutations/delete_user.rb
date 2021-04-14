module Mutations
  class DeleteUser < BaseMutation
    argument :user_id, ID, required: true

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(user_id:)
      user = User.find(user_id)
      user_posts = Post.where(user_id: user_id)
      user_comments = Comment.where(user_id: user_id)
      if user_comments.destroy_all && user_posts.destroy_all && user.destroy
        {
          user: user,
          errors: []  
        }
      else
        {
          user: user,
          errors: user.errors.full_messages
        }
      end
    end
  end
end
