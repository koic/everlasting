# -*- frozen-string-literal: true -*-

module Everlasting
  class Hooks
    def self.init
      ActionController::Parameters.send :include, Everlasting::Enhanced
    end
  end
end
