 #!/usr/bin/env ruby

 # pull in the Barr gem
 require 'rubygems'
 require 'barr'

 # Create a new manager instance.
 # The manager is responsible for organising the blocks and delivering their output to lemonbar
 @manager = Barr::Manager.new

 # Add a 'WhoAmI' block. This just outputs logged in username
 # Give it a peach background, grey text and updates every 10000 seconds
 # It will be aligned to the left of the bar
 @manager.add_block Barr::Blocks::WhoAmI.new(bcolor: "#FFAAAA", fcolor: "#333333", interval: 10000)

 # Add a 'Clock' block.
 # Clocks can be formatted in the type strftime fashion. This example outputs the current Hour and Minute
 # It will update every second.
 # By default, the background text colour will be deferred to the Lemonbar config
 # If FontAwesome font is available to lemonbar, it will be prepended with a clock icon.
 @manager.add_block Barr::Blocks::Clock.new(icon: "\uf017", format: "%H:%M", align: :c, interval: 1)


 # Add a 'Cpu' block. This shows the current CPU usage (averaged across all cores if present)
 # It will be aligned to the right side of of the bar
 # As an interval is not provided, it will update every 5 seconds.
 # It will be prepended with the text 'Cpu:'
 @manager.add_block Barr::Blocks::Cpu.new(icon: "Cpu:", align: :r)


 # Tell the manager to run the loop. This will continue indefinitely, outputing the data ready to be piped in to lemonbar.
 @manager.run
