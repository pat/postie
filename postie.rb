require './lib/locality'
require './lib/localities'

class Postie < Sinatra::Base
  collection = Localities.new

  get '/' do
    haml :index
  end

  get %r[/(\d\d\d\d)(\.(.+))?] do |postcode, path, extension|
    @context    = 'Postcode'
    @localities = collection.by_postcode(postcode)

    handle_extension extension
  end

  get %r[/([^\.]+)(\.(.+))?] do |suburb, path, extension|
    @context    = 'Suburb'
    @localities = collection.by_suburb suburb.gsub("%20", " ")

    handle_extension extension
  end

  private

  def handle_extension(extension)
    case extension
    when 'js', 'json'
      handle_js
    when 'xml'
      content_type :xml
      @localities.to_xml
    else
      haml :localities,
        :locals => {:context => @context, :localities => @localities}
    end
  end

  def handle_js
    callback = params.delete('callback')
    if callback
      content_type :js
      "#{callback}(#{localities_as_json})"
    else
      content_type :json
      localities_as_json
    end
  end

  def localities_as_json
    @localities.collect { |locality| locality.serializable_hash }.to_json
  end
end
