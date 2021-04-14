module Mutations
  class UpdateUser < BaseMutation
    argument :user_id, ID, required: true
    argument :email, String, required: false
    argument :name, String, required: false

    field :user, Types::UserType, null: false
    field :errors, [String], null: false

    def resolve(user_id:, **attributes)
      user = User.find(user_id)

      if user.update(attributes)
        {
          user: user,
          errors: []  
        }
      else
        {
          user: nil,
          errors: user.errors.full_messages  
        }
      end
    end
  end
end
