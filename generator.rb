#!/usr/bin/env ruby

require File.expand_path('lib/base')
require File.expand_path('lib/setup')
require File.expand_path('lib/migration')

require 'rubygems'
require 'commander/import'

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
  	say args.first
  end
end

