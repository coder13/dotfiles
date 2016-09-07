#!/usr/bin/env ruby

require 'rubygems'
require 'barr'

@manager = Barr::Manager.new

@manager.add_block Barr::Blocks::I3.new(interval: 1)

# Add a 'Clock' block.
# Clocks can be formatted in the type strftime fashion. This example outputs the current Hour and Minute
# It will update every second.
# By default, the background text colour will be deferred to the Lemonbar config
# If FontAwesome font is available to lemonbar, it will be prepended with a clock icon.
@manager.add_block Barr::Blocks::Clock.new(icon: "\uf017", format: "%H:%M", align: :c, interval: 1)

@manager.add_block Barr::Blocks::Rhythmbox.new(bgcolor: '#466B41', icon: "\uf028", title: false, buttons: false)

@manager.add_block Barr::Blocks::Rhythmbox.new(bgcolor: '#1E6614', buttons: false, artist: false)

@manager.add_block Barr::Blocks::Rhythmbox.new(bgcolor: '#0A4D02', artist: false, title: false, align: :r)

@manager.add_block Barr::Blocks::Temperature.new(bgcolor: '#4A072B', align: :l, location: '2471217', icon: "\uf0c2 Philadelphia: ", interval: 1500)

# Tell the manager to run the loop. This will continue indefinitely, outputing the data ready to be piped in to lemonbar.
@manager.run
