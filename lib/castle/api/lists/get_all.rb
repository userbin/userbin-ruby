# frozen_string_literal: true

module Castle
  module API
    module Lists
      # Sends GET /lists request
      module GetAll
        class << self
          # @param options [Hash]
          # @return [Hash]
          def call(options = {})
            options = Castle::Utils::DeepSymbolizeKeys.call(options || {})
            http = options.delete(:http)
            config = options.delete(:config) || Castle.config

            Castle::API.call(Castle::Commands::Lists::GetAll.build, {}, http, config)
          end
        end
      end
    end
  end
end
