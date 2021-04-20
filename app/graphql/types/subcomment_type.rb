module Types
  class SubcommentType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: true
    field :user_id, Integer, null: true
    field :comment_id, Integer, null: false
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
    field :content, String, null: false
    field :user, Types::UserType, null: false
    field :comment, Types::CommentType, null: false
  end
end
