class Product < ApplicationRecord
  has_attached_file :product_image, styles: {thumb: "100x100>", medium: "300x300>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :product_image, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/,
                          message: I18n.t('paperclip.not_allowed')

  CATEGORIES = {
      "Komplety" => 1,
      "Mebloscianki" => 2,
      "Lozka" =>3
  }

end