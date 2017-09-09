module ActiveAdmin::ViewsHelper

  def collection_of_categories
    Product::CATEGORIES.map do |c|
      [I18n.t("activerecord.attributes.product.categories.#{c[0]}"), c[1]]
    end
  end

end