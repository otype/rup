##############################################################
# SCM
#
# Main class to run the Ruby Updater "rup"
#
##############################################################
class SCM
  attr_reader :options

  def initialize(args)
    initialize_config_directory
    @options = OptParser.parse(args)
    run_command
  end

  private

  def initialize_config_directory
    unless File.exists? $CONFIGDIR
      File.mkdir $CONFIGDIR
      puts "Configuration directory \"{$CONFIGDIR}\" created!"
    end
  end

  def run_command
    case @options.command
    when "addrepo"
      puts LibConfig.add_repo(@options.repo)
    when "removerepo"
      puts LibConfig.remove_repo(@options.repo)
    when "listrepos"
      puts LibConfig.list_repos
    when "importparent"
      puts LibConfig.import_parent(@options.parent)
    when "status"
      LibSCM.repo_status
    when "updateall"
      LibSCM.update_repos
    end

    if @options.command.eql?("")
      puts "Missing parameters! Try #{$COMMAND_NAME} -h!"
      exit
    end
  end
end