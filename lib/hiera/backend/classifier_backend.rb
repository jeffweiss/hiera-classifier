require 'sequel'

class Hiera
  module Backend
    class Classifier_backend
      def initialize
        Hiera.debug("Hiera Classifier backend starting")
        @conf = Config[:classifier]
      end
      
      def lookup(key, scope, order_override, resolution_type)
        answer = Backend.empty_answer(resolution_type)

        Hiera.debug("Looking up #{key} in Classifier backend")

        Backend.datasources(scope, order_override) do |source|
          Hiera.debug("Looking up #{key} in Classifier backend source: #{source}")

          if key == 'classes'
            connect
            data = @db[:sources_classes].filter(:source_name => source).map(:class_name)
          else
            next
          end
          
          next if ! data
          next if data.nil?
          new_answer = Backend.parse_answer(data, scope)

          case resolution_type
          when :array
            unless new_answer.kind_of? Array or new_answer.kind_of? String
              raise Exception, "Hiera type mismatch: expected Array and got #{new_answer.class}"
            end
            answer << new_answer
          else
            answer = new_answer
            break
          end
        end

        return answer
      end

      def connect
        unless connected?
          @db = Sequel.connect(@conf[:database])
          @connected = true
        end
      end

      def connected?
        @connected || false
      end
    end
  end
end

