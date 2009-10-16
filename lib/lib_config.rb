##############################################################
# LibConfig
#
# Manages the configuration and triggers all SCM commands
# (high-level interface)
#
##############################################################

class LibConfig
  
  def self.add_repo(path)
    init
    return "Not a valid SCM type." if LibSCM.scm_type(path).nil?
    return "Repo already under RUP control." if repo_exist?(clean_path(path))
    conffile = File.open($CONFIGFILE, "a+")
    conffile.puts(clean_path(path))
    conffile.close
    return "[Added repository => \'#{path}\']"    
  end

  def self.remove_repo(path)
    init
    return "Repository is not under RUP control." if not repo_exist?(path)
    
    oldrepos = (File.open($CONFIGFILE, "r")).readlines
    arr = Array.new
    oldrepos.each { |v| arr << v.chomp if not v.eql?("#{path}\n")}    

    tmpcfg = "#{$CONFIGDIR}/_repos.tmp"
    newrepos = File.new(tmpcfg, "w", 0600)
    arr.each { |v| newrepos.puts(v) }
    newrepos.close
    File.rename(tmpcfg, $CONFIGFILE)
    return "[Removed repository => \'#{path}\']"
  end

  def self.import_parent(path)
    return "No directory." if not File.directory?(path)
    dirs = Dir.entries(path)
    only_valid_directories(dirs)
    dirs = dirs.map { |v| path + "/" + v }
      
    repos = Array.new
    skipped = Array.new
    dirs.each { |d| LibSCM.valid_scm?(d) ? (repos << d) : (skipped << d) }
    repos.each { |r| add_repo(r) }
    
    "[Parent paths imported ]" + "\n\n[ Skipped ]\n" + skipped.join("\n")
  end
  
  def self.list_repos
    init
    repos = (File.open($CONFIGFILE, "r")).readlines
    ans = String.new
    repos.each { |elem| ans += elem }
    ans.empty? ? "No repositories under RUP control." : ans
  end

  private
  
  def self.only_valid_directories(dirs)
    dirs.delete_if { |v| v.eql?(".") or v.eql?("..") or v.eql?(".DS_Store") }
  end
  
  def self.clean_path(path)
    (File.directory?(path) and not path[-1,1].eql?("/")) ? path + "/" : path
  end
  
  def self.repo_exist?(repo)
    repos = (File.open($CONFIGFILE, "r")).readlines
    repos.include?("#{repo}\n")
  end

  def self.init
    create_config_dir
    create_config_file
  end

  def self.create_config_dir
    Dir.mkdir($CONFIGDIR) if not File.exist?($CONFIGDIR)
  end

  def self.create_config_file
    (File.open($CONFIGFILE, "a+", 0600)).close if not File.exist?($CONFIGFILE)
  end
end