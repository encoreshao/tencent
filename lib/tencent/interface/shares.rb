# encoding: utf-8
module Tencent
  module Interface
    
    class Shares < Base
      
      def show(opts={})
        get 'user/get_info', :params => base_params.merge(opts)
      end
      
      def destroy(id)
        post 't/del_t', :body => base_params.merge({:id => id})
      end
      
      def update(status, opts={})
        post '/t/add_t', :body => base_params.merge(opts).merge({:content => status})
      end
      
      def upload(status, pic, opts={})
        post 't/add_pic_t', build_multipart_bodies(base_params.merge(opts).merge({:content => status, :pic => build_image(pic)}))
      end
      
      protected
        def mime_type(file)
          case
            when file =~ /\.jpg/ then 'image/jpg'
            when file =~ /\.gif$/ then 'image/gif'
            when file =~ /\.png$/ then 'image/png'
            else 'application/octet-stream'
          end
        end
      
        CRLF = "\r\n"
        def build_multipart_bodies(parts)
          boundary = Time.now.to_i.to_s(16)
          body = ""
          parts.each do |key, value|
            esc_key = CGI.escape(key.to_s)
            body << "--#{boundary}#{CRLF}"
            if value.respond_to?(:read)
              body << "Content-Disposition: form-data; name=\"#{esc_key}\"; filename=\"#{File.basename(value.path)}\"#{CRLF}"
              body << "Content-Type: #{mime_type(value.path)}#{CRLF*2}"
              body << value.read
            else
              body << "Content-Disposition: form-data; name=\"#{esc_key}\"#{CRLF*2}#{value}"
            end
            body << CRLF
          end
          body << "--#{boundary}--#{CRLF*2}"
          {
            :body => body,
            :headers => {"Content-Type" => "multipart/form-data; boundary=#{boundary}"}
          }
        end
        
        def build_image(file)
          if file.class == String
            File.open(file)
          elsif file.class == File
            file
          end
        end

    end
  end
end
