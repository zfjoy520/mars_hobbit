module MarsHobbit
  class Application
    map('/') { run RootController.new }
  end
end