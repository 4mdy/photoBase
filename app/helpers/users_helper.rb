module UsersHelper
    def avatar_url(user)
        gravatar_id = Digest::MD5::hexdigest(user.email).downcase
        gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    end
end
