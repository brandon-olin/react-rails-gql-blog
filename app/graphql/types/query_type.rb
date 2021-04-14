module Types
  class QueryType < Types::BaseObject
    # Add `node(id: ID!) and `nodes(ids: [ID!]!)`
    include GraphQL::Types::Relay::HasNodeField
    include GraphQL::Types::Relay::HasNodesField

    # User Queries
    
    # Get all users
    field :users, [Types::UserType], null: false

    def users
      User.all
    end

    # Get a specific user
    field :user, Types::UserType, null: false do
      argument :id, ID, required: true
    end

    def user(id:)
      User.find(id)
    end

    # Post Queries

    # Get all posts
    field :posts, [Types::PostType], null: false

    def posts
      Post.all
    end

    # Get a specific post
    field :post, Types::PostType, null: false do
      argument :id, ID, required: true
    end

    def post(id:)
      Post.find(id)
    end

    # Get posts for a specific user
    field :user_posts, [Types::PostType], null: false do
      argument :user_id, ID, required: true
    end

    def user_posts(user_id:)
      Post.where("user_id = #{user_id}")
    end

    # Comment Queries

    # Get all comments
    field :comments, [Types::CommentType], null: false

    def comments
      puts "Getting comments!"
      Comment.all
    end

    # Get a specific comment
    field :comment, Types::CommentType, null: false do
      argument :id, ID, required: true
    end

    def comment(id:)
      Comment.find(id)
    end

    # Get comments for a specific post
    field :post_comments, [Types::CommentType], null: false do
      argument :post_id, ID, required: true
    end

    def post_comments(post_id:)
      Comment.where("post_id = #{post_id}")
    end
  end
end
