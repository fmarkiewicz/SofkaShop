class Product < ApplicationRecord
  # belongs_to :order
  max_paginates_per 10
  has_attached_file :product_image, 
                     styles: {thumb: "100x100>", medium: "300x300>"},
                     default_url: "/images/:style/missing.png"
  validates_attachment_content_type :product_image, 
                                     content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/,
                                     message: I18n.t('paperclip.not_allowed')


  CATEGORIES = {
      "komplety" => 1,
      "mebloscianki" => 2,
      "lozka" =>3
  }

end
