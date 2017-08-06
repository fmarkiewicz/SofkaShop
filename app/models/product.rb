class Product < ApplicationRecord
  has_attached_file :product_image, styles: {thumb: "100x100>", medium: "300x300>"}, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :product_image, content_type: /^image\/(jpg|jpeg|pjpeg|png|x-png|gif)$/,
                          message: I18n.t('active_record.product.paperclip.not_allowed')
  has_one :category
end
