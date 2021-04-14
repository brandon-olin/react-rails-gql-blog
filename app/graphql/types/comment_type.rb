module Types
  class CommentType < Types::BaseObject
    field :id, ID, null: false
    field :content, String, null: true
    field :user, Types::UserType, null: true
    field :post, Types::PostType, null: true
    field :created_at, GraphQL::Types::ISO8601DateTime, null: false
    field :updated_at, GraphQL::Types::ISO8601DateTime, null: false
  end
end
