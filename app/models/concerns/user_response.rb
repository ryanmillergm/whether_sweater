class UserResponse
    attr_reader :user
              
  def initialize(user)
    @user = user
  end

  def render_response
    { data: {
            type: @user.class.name,
            id: @user.id,
            attributes: {
                email: @user.email,
                api_key: @user.api_key
            }
        }
    }
  end
end