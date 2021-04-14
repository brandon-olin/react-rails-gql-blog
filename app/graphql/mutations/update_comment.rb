module Mutations
  class UpdateComment < BaseMutation
    argument :content, String, required: true
    argument :comment_id, ID, required: true

    field :comment, Types::CommentType, null: false
    field :errors, [String], null: false

    def resolve(content:, comment_id:)
      comment = Comment.find(comment_id)

      if comment.update(content: content)
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
