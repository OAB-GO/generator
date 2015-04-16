#!/usr/bin/env ruby

lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'rubygems'
require 'commander/import'
require 'generator'

program :name, 'Scaffold Generator'
program :version, '0.0.1'
program :description, 'This is a simple generator'

command :setup do |c|
  c.syntax = 'setup [options]'
  c.option '--dir DIR', String, 'Directory where files are gonna generated'
  c.option '--username USERNAME', String, 'Username should be printed in file'
  c.option '--author AUTHOR', String, 'Author of a file'

  c.action do |args, options|
    setup = Setup.new options
    setup.save
  end
end

command :migration do |c|
  c.action do |args, options|
    migration = Migration.create(args)
    migration.generate
  end
end

