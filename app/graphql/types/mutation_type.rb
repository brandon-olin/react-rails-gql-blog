module Types
  class MutationType < Types::BaseObject
    field :update_user, mutation: Mutations::UpdateUser
    field :update_post, mutation: Mutations::UpdatePost
    field :update_comment, mutation: Mutations::UpdateComment
    field :delete_user, mutation: Mutations::DeleteUser
    field :delete_comment, mutation: Mutations::DeleteComment
    field :delete_post, mutation: Mutations::DeletePost
    field :create_comment, mutation: Mutations::CreateComment
    field :create_post, mutation: Mutations::CreatePost
    field :create_user, mutation: Mutations::CreateUser
  end
end
