module ServiceDataEngine
  class ApiBase

    def request(resource_path, id=nil)
      response = HTTParty.get(format_url(resource_path, id), basic_auth: auth)
      respond(response, id)
    end

    def post_request(resource_path, payload)
      response =
        HTTParty.post \
          format_url(resource_path),
          body:       payload.to_json,
          basic_auth: auth,
          headers:    post_headers

      respond(response)
    end

    def respond(response, single=nil)
      if response.code == 200
        JSON.parse(response.body)
      else
        single.present? ? nil : []
      end
    end

    def format_url(resource_path, id=nil)
      url = base_url + resource_path
      url+= "/#{id}" if id.present?
      url
    end

    def base_url
      ENV['ENGINE_BASE_URL']
    end

    def auth
      {
        username: ENV['ENGINE_API_TOKEN'],
        password: ENV['ENGINE_API_SECRET'],
      }
    end

    def post_headers
      { 'Content-Type' => 'application/json' }
    end

  end
end

