# encoding: utf-8
module Tencent
  module Interface
    
    class Zones < Base
      
      def show(opts={})
        get "user/get_user_info", :params => base_params.merge(opts)
      end
      
      def share(title, url, opts={})
        post "t/add_t", :body => base_params.merge(opts).merge({ :title => title, :url => url })
      end

      def check_fans(page_id)
        get "user/check_page_fans", :params => base_params.merge({ :page_id => page_id })
      end
      
    end
  end
end
