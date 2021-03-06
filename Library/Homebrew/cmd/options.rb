module Homebrew extend self
  def options
    ARGV.formulae.each do |f|
      f.options rescue next
      if ARGV.include? '--compact'
        puts f.options.collect {|o| o[0]} * " "
      else
        puts f.name
        f.options.each do |o|
          puts o[0]
          puts "\t"+o[1]
        end
        puts
      end
    end
  end
end