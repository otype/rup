##############################################################
# LibSCM
#
# Interface to the SCM tools on OS-level (low-level interface)
#
##############################################################
class LibSCM

  def self.repo_status
    repos = LibConfig.list_repos.to_a
    repos.each do |r|
      puts "[ Status for repository => \'#{r.chomp}\']"
      puts status(r.chomp)
      puts "\n"
    end
  end

  def self.update_repos
    repos = LibConfig.list_repos.to_a
    repos.each do |r|
      puts "[ Updating repository => \'#{r.chomp}\']"
      puts update(r.chomp)
      puts "\n"
    end
  end

  def self.scm_type(repopath)
    scmtype = "SVN" if File.exist?(repopath + "/.svn")
    scmtype = "GIT" if File.exist?(repopath + "/.git")
    scmtype = "REPO" if File.exist?(repopath + "/.repo")
    scmtype
  end
  
  def self.valid_scm?(repopath)
    not scm_type(repopath).nil?
  end
  
  private

  def self.status(entity)
    scm = load_scm(entity)
    Dir.chdir(entity)
    %x{#{scm['COMMAND']} #{scm['STATUS']} }
  end

  def self.update(entity)
    scm = load_scm(entity)
    Dir.chdir(entity)
    %x{#{scm['COMMAND']} #{scm['UPDATE']} }
  end

  def self.load_scm(entity)    
    load_hash(scm_type(entity))
  end

  def self.load_hash(scmtype)
    case scmtype
    when /GIT/
      $GIT
    when /SVN/
      $SVN
    when /REPO/
      $REPO
    end
  end
end