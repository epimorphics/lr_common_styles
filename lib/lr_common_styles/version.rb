# frozen-string-literal: true

module LrCommonStyles
  MAJOR = 2
  MINOR = 1
  PATCH = 3
  SUFFIX = nil # nil or 'rc' or 'beta' or 'alpha' for pre-release versions
  VERSION = "#{MAJOR}.#{MINOR}.#{PATCH}#{SUFFIX && "-#{SUFFIX}"}"
end
