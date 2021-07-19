module ApplicationHelper
  def show_cover_image(user)
    if user.cover_image.attached?
        image_tag(user.cover_image, alt: user.username, class: 'pr-2')
    else
        image_tag('https://source.unsplash.com/random/800x250', alt: user.username, class: 'pr-2')
    end
  end

  def show_photo(user, extra_class = '')
    if user.photo.attached?
      image_tag(user.photo, alt: user.username, class: "pr-2 rounded profile-img #{extra_class}")
    else
      image_tag('https://source.unsplash.com/random/60x60',
                alt: user.username, class: 'pr-2 rounded profile-img')
    end
  end

  def like_or_dislike_btn(opinion)
    like = Like.find_by(opinion_id: opinion.id, user_id: current_user.id)
    if like
      link_to('Dislike!', like_path(id: like.id, opinion_id: opinion.id), method: :delete)
    else
      link_to('Like!', login_path(opinion_id: opinion.id), method: :post)
    end
  end
end
