class Movie

attr_reader :actors, 
            :awards, 
            :country, 
            :director,
            :genre,
            :imdb_id, 
            :imdb_rating,
            :imdb_votes,
            :language,
            :ratings,
            :metascore,
            :plot,
            :poster,
            :rated,
            :released,
            :runtime,
            :title,
            :type,
            :writer,
            :year,
            :error,
            :dvd,
            :box_office,
            :production,
            :website,
            :response

      def initialize(params)     
        params.each_pair do |k, v|
          instance_variable_get("@#{k}")
          instance_variable_set("@#{k}", v)
        end
      end

class << self
    def __format_data(data)
        keys = data.keys.map{|k| k.underscore.to_sym }
        keys.zip(data.values).to_h
    end 
    def connection(args)
        url = "#{OMDB_API_URL}&#{args}"
        resp = HTTParty.get(url)
        return resp.parsed_response
    end

    def find(*args)
        find_with_ids(*args)
    end

    def find_with_ids(*ids)
      
        expects_array = ids.first.kind_of?(Array)
        return ids.first if expects_array && ids.first.empty?
      
        ids = ids.flatten.compact.uniq
      
        case ids.size
        when 0
          raise RecordNotFound, "Couldn't find #{@klass.name} without an ID"
        when 1
          result = find_one(ids.first)
          expects_array ? [ result ] : result
        else
          find_some(ids)
        end
      rescue RangeError
        raise RecordNotFound, "Couldn't find #{@klass.name} with an out of range ID"
      end
    
      def find_one(id)
        return  self.new(__format_data(connection("i=#{id}")))
      end

    def find_some(ids)
        result = []
        ids.each do |id| 
            tmp = find_one(id)
            result << tmp if result_found(tmp)
        end
        return result
    end

    def where(options = {})
        url = []
        result = []
        options.each do |k,v|
            case k
            when :title
                url << "s=#{v}"
            when :year
                url << "y=#{v}"
            when :plot
                url << "plot=#{v}"
            when :type
                url << "type=#{v}"
            when :page
                url << "page=#{v}"
            else
            end
        end
        tmp = connection( url.join('&') )
        if !tmp.blank? and tmp.has_key?("Search")
          puts tmp
          tmp["Search"].each do |r| 
              result << self.new( __format_data(r) ) 
          end
        else 
          return []
        end
        return result      
    end

    def all(options = {})
        result = []
       return result if options.blank? 
    end
    
    def result_found(result)
        return result["Response"] == "True"
    end
 end 
end
