module ApplicationHelper
  def images_tag(array_of_images, options = {})
    images = []
    if array_of_images.is_a? Array
      array_of_images.each do |image|
        images << images_tag(image, size: options[:size], class: options[:class])
      end
    end
    content_tag :div, images.join("\n").html_safe, class: "img-circle"
  end
end
