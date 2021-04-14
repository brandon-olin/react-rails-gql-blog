module Types
  class UserType < Types::BaseObject
    field :id, ID, null: false
    field :email, String, null: false
    field :name, String, null: true
    field :comment_karma, Integer, null: true
    field :post_karma, Integer, null: true
    field :posts, [Types::PostType], null: true
    field :comments, [Types::CommentType], null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
