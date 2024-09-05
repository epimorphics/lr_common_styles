# frozen-string-literal: true

module LrCommonStyles
  MAJOR = 1
  MINOR = 9
  PATCH = 8
  SUFFIX = nil # nil or 'rc' or 'beta' or 'alpha' for pre-release versions
  VERSION = "#{MAJOR}.#{MINOR}.#{PATCH}#{SUFFIX && "-#{SUFFIX}"}"
end
