module Ecm
  module Translations
    class Routing
      def self.routes(_router, options = {})
        options.reverse_merge!({})

        # router.resources :posts, :controller => 'ecm/translations/posts'
      end
    end
  end
end
