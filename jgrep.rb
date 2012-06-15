require 'rubygems'
require 'jgrep'

module MCollective
  module Agent
    class Jgrep<RPC::Agent
      metadata :name => "JGrep Agent",
        :description => "Uses jgrep examine and compare JSON and YAML files",
        :author      => "Pieter Loubser",
        :license     => "ASL2",
        :version     => "0.1",
        :url         => "https://jgrep.org",
        :timeout     => 60

      def read_file
        if request[:file].match(/.+\.yaml/)
          return YAML.load_file(request[:file])
        else
          return File.read(request[:file])
        end
      end

      action :match do
        begin
          json = read_file
          reply[:match] = !JGrep::jgrep(json, request[:expression]).empty?

        rescue Exception
          reply[:match] = false
        end
      end

      action :lookup do
        begin
          json = read_file
          reply[:value] = JGrep::jgrep(json, "", request[:field])
        rescue Exception
          reply[:value] = nil
        end
      end
    end
  end
end

# vi:tabstop=2:expandtab:ai:filetype=ruby
