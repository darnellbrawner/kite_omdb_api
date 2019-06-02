module ApplicationHelper

    def data_geusser(v)
        if v.is_a?(String)
            puts "its a string"
            if v.ends_with?('.jpg', '.jpeg', '.jpe', '.jif', '.jfif', '.jfi','.png') 
                return image_tag(v)
            elsif v.starts_with?('http://','https://') 
                return link_to(v, v)
            else
                return v
            end
        elsif v.is_a?(Hash)
            puts "its an hash"
            str = ""
            v.each do |k,v|
                str += "<strong>#{k}</strong> #{v} <br />"
            end
            return str
        elsif v.is_a?(Array)
            str = ""
            v.each do |t|
                if t.is_a?(Hash)
                    t.each do |k,v|
                        str += "<strong>#{k}</strong> #{v} <br />"
                    end
                    return str
                elsif t.is_a?(Array)
                    str += t.join(',')
                else
                    str += "#{t} , "
                end
            end
        else
            return v
        end
    end
end
