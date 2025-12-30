# frozen_string_literal: true

module LrCommonStyles
  MAJOR = 2
  MINOR = 4
  PATCH = 0
  SUFFIX = 'beta' # nil or 'rc' or 'beta' or 'alpha' for pre-release versions
  VERSION = "#{MAJOR}.#{MINOR}.#{PATCH}#{SUFFIX && ".#{SUFFIX}"}".freeze
end
