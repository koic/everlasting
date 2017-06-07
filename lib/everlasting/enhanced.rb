module Everlasting
  module Enhanced
    HASH_INSTANCE = {}

    def method_missing(method_name, *args, &block)
      unless HASH_INSTANCE.respond_to?(method_name)
        raise NoMethodError.new("undefined method `#{method_name}' for #{self.class}")
      end

      hash = self.to_h

      Rails.logger.try!(:error, <<-EOS.strip_heredoc)
        ActionController::Parameters does not inherit Hash since Rails 5.0.
        Use `params.to_h.#{method_name}' instead of `params.#{method_name}'.

        #{caller.join("\n")}
      EOS

      hash.send(method_name, *args, &block)
    end
  end
end
