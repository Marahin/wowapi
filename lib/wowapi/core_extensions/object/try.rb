# A simple .try method for Object,
# which mimics the Rails one (probably poorly)

module CoreExtensions
  module Object
    def try(method)
      begin
        self.send(method)
      rescue NoMethodError
        nil
      end
    end
  end
end

Object.include(CoreExtensions::Object) unless Object.methods.include?(:try)