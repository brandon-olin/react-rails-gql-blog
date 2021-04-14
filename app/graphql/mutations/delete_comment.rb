module Mutations
  class DeleteComment < BaseMutation
    argument :comment_id, ID, required: true

    field :comment, Types::CommentType, null: false
    field :errors, [String], null: false

    def resolve(comment_id:)
      comment = Comment.find(comment_id)
      
      if comment.delete
        {
          comment: comment,
          errors: []
        }
      else
        {
          comment: comment,
          errors: comment.errors.full_messages
        }
      end
    end
  end
end
