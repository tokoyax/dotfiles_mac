# .pryrc
# frozen_string_literal: true

%w[rubygems awesome_print logger interactive_editor pry-theme].each do |gem|
  require gem
rescue LoadError
end
Pry.config.editor = 'nvim'
Pry.config.pager = 'less'

Pry.config.color = true

Pry.config.prompt = proc do |obj, nest_level, _pry_|
  version = ''
  version += "R#{Rails.version}" if defined? Rails
  version += "\001\e[0;31m\002"
  version += "R#{RUBY_VERSION}"
  version += "\001\e[0m\002"

  "#{version} #{Pry.config.prompt_name}(#{Pry.view_clip(obj)})> "
end

# Reformat Exception
Pry.config.exception_handler = proc do |output, exception, _|
  output.puts "\e[31m#{exception.class}: #{exception.message}"
  output.puts "from #{exception.backtrace.first}\e[0m"
end

# Return only the methods not present on basic objects
class Object
  def ims
    (methods - Object.instance_methods).sort
  end
end

# Display execution timing
def time
  require 'benchmark'
  res = nil
  timing = Benchmark.measure do
    res = yield
  end
  puts 'Using yield, it took:     user       system     total       real'
  puts "                      #{timing}"
  res
end

# Default Command Set, add custom methods here:
default_command_set = Pry::CommandSet.new do
  command 'copy', 'Copy argument to the clip-board' do |str|
    IO.popen('pbcopy', 'w') { |f| f += str.to_s }
  end

  command 'clear' do
    system 'clear'
    if ENV['RAILS_ENV']
      output.puts 'Rails Environment: ' + ENV['RAILS_ENV']
    end
  end

  # command "sql", "Send sql over AR." do |query|
  #   if ENV['RAILS_ENV'] || defined?(Rails)
  #     pp ActiveRecord::Base.connection.select_all(query)
  #   else
  #     pp "Pry did not require the environment, try `pconsole`"
  #   end
  # end
  command 'caller_method' do |depth|
    depth = depth.to_i || 1
    if /^(.+?):(\d+)(?::in `(.*)')?/ =~ caller(depth + 1).first
      file   = Regexp.last_match[1]
      line   = Regexp.last_match[2].to_i
      method = Regexp.last_match[3]
      output.puts [file, line, method]
    end
  end
end

Pry.config.commands.import default_command_set
Pry.config.should_load_plugins = false

begin
  require 'awesome_print'
rescue LoadError
else
  AwesomePrint.pry!
end

# require 'hirb'
#
# Hirb.enable

# old_print = Pry.config.print
# Pry.config.print = proc do |output, value|
#   Hirb::View.view_or_page_output(value) || old_print.call(output, value)
# end

# pry-debuggerのショートカット
# Pry.commands.alias_command 'c', 'continue'
Pry.commands.alias_command 's', 'step'
Pry.commands.alias_command 'n', 'next'
# Pry.commands.alias_command 'f', 'finish'

## Alias
Pry.config.commands.alias_command 'lM', 'ls -M'
# Ever get lost in pryland? try w!
Pry.config.commands.alias_command 'w', 'whereami'
# Clear Screen
Pry.config.commands.alias_command '.clr', '.clear'

# reload rails
def rl
  reload!
end

# Pry.history.instance_eval do
#    @saver = ->(line) { save_to_file (line.force_encoding(STDIN.external_encoding))}
# end

# Hit Enter to repeat last command
Pry::Commands.command /^$/, 'repeat last command' do
  _pry_.run_command Pry.history.to_a.last
end
# Pry.config.theme = "Zenburn"
Pry.config.theme = 'pry-modern-8'

# Show methods defined in .pryrc
# This depends heavily on the format of
# method definitions. A single comment
# line, followed by the method 'def <method>'
# line will include any new methods in this
# method summary.
def pm
  res = []
  save_comment = ''
  data = `cat .pryrc`
  str_arr = data.split("\n")

  puts 'Pry custom commands defined in .pryrc:'
  counter = 0

  until str_arr[counter].nil?
    # Ruby 1.9 returns an ordinal rather than a character, so...
    if str_arr[counter][0] == '#' || str_arr[counter][0] == 35
      save_comment = str_arr[counter]
    elsif str_arr[counter].index('def') == 0
      m = str_arr[counter].gsub('def ', '')
      m.chomp

      # output so columns are aligned
      if m.length < 8
        res += (m + "\t   " + save_comment + "\n")
      else
        res += (m + '   ' + save_comment + "\n")
      end

      m = ''
      save_comment = ''
    end
    counter += 1
  end
  res.sort!
  0.upto(counter) do |x|
    print res[x]
  end
end

pm
