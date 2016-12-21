module UsersHelper
  def user_avatar(user, size = 60)
    attributes = {
      'data-name' => user.initials,
      'data-height' => size,
      'data-width' => size,
      'data-seed' => Random.rand(20),
      'data-char-count' => '2',
      'data-font-size' => (size * 0.6).round,
      class: 'profile-img img-circle'
    }

    image_tag '', attributes
  end
end
