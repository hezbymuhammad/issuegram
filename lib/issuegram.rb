# frozen_string_literal: true

require 'zeitwerk'
require 'forwardable'

loader = Zeitwerk::Loader.for_gem
loader.setup

class Issuegram
  class << self
    extend Forwardable

    def_delegators :instance, :config, :setup

    def instance
      @instance ||= new
    end
  end

  def initialize(options = nil)
    @config = Issuegram::Config.new(options) if options
  end

  def config(&block)
    if block
      instance_eval(&block)
    else
      @config ||= Issuegram::Config.new
    end
  end

  alias setup config
end
