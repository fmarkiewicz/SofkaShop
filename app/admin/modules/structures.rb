module Modules
  module Structures
    def self.yes_no_select
      { I18n.t('global.yes') => true, I18n.t('global.no') => false }
    end
  end
end