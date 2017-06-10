# frozen-string-literal: true

require 'everlasting/version'
require 'everlasting/enhanced'
require 'everlasting/hooks'

if defined?(Rails)
  require 'everlasting/railtie'
end
