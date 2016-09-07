module CoreExtensions
  module Object
    # Simple shim that adds .try(:symbol)
    # method for Object, mimicing ActiveSupport one
    # (probably poorly, todo: rewrite?)
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