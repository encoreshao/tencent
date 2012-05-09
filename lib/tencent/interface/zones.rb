# encoding: utf-8
module Tencent
  module Interface
    
    class Zones < Base
      
      def show(opts={})
        get "user/get_user_info", :params => opts
      end
      
      def share(title, url, query={})
        get "t/add_t", :body => { title: title, url: url }.merge(query)
      end

      def check_fans(page_id)
        get "user/check_page_fans", query: { page_id: page_id }
      end
      
    end
  end
end
