# Load the MarsHobbit application.
require File.expand_path('../application', __FILE__)

require 'securerandom'

# Initialize the MarsHobbit application.
module MarsHobbit
  class Application < Hobbit::Base
    use Rack::Reloader, 0

    Dir.glob(File.expand_path('config/initializers/**/*.rb', MarsHobbit.root)).each { |file| p file; require file }
    Dir.glob(File.expand_path('app/{models,helpers,controllers}/**/*.rb', MarsHobbit.root)).each { |file| p file; require file }

    if MarsHobbit.env.development?
      use BetterErrors::Middleware
      BetterErrors.application_root = MarsHobbit.root
    end

    class ::Logger;
      alias_method :write, :<<;
    end

    log_path = File.expand_path('log', MarsHobbit.root)
    Dir.mkdir(log_path) unless Dir.exist?(log_path)

    file = File.new(File.expand_path("log/#{MarsHobbit.env}.log", MarsHobbit.root), 'a+')
    file.sync = true
    use Rack::CommonLogger, file

    require File.expand_path('../routes', __FILE__)
  end
end
