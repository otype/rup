##############################################################
# OptParser
#
# Option parser: all shell command options which can be
# triggered.
#
##############################################################

# Required for OptParser class
require 'optparse'
require 'ostruct'

class OptParser
  def self.parse(args)
    options = OpenStruct.new
    options.command = ""
    options.repo = ""
    options.parent = ""

    myopts = OptionParser.new do |opts|
      opts.banner = "Usage: #{$COMMAND_NAME} [options]"

#      opts.separator ""
#      opts.separator "Specific options:"

      opts.on("-a", "--add-repo REPOSITORY", "Add a repository") do |repo|
        options.command = "addrepo"
        options.repo = repo
      end

      opts.on("-r", "--remove-repo REPOSITORY", "Remove a repository") do |repo|
        options.command = "removerepo"
        options.repo = repo
      end

      opts.on("-i", "--import-parent PARENTPATH", "Add all repositories from given parent path") do |parent|
        options.command = "importparent"
        options.parent = parent
      end

      opts.on("-l", "--list-repos", "List all managed repositories") do
        options.command = "listrepos"
      end

      opts.on("-s", "--status", "Show status of all managed repositories") do
        options.command = "status"
      end

      opts.on("-u", "--update-repos", "Update all managed repositories") do
        options.command = "updateall"
      end

      opts.separator ""
      opts.separator "Special options:"

      opts.on_tail("-d", "--debug", "Debugging information") do
        puts options
      end

      opts.on_tail("-h", "--help", "Show this message") do
        puts opts
        exit
      end

      opts.on_tail("-v", "--version", "Show version") do
        puts "#{$COMMAND_NAME} v.#{$VERSION}"
        exit
      end
    end

    myopts.parse!(args)
    options
    rescue
      puts "Uh-oh! Missing parameter."
      exit
  end
end