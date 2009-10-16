##############################################################
# SCM Hashes
#
# All SCM tools including their parameters are configured
# here. Make sure that these are correct!
#
##############################################################

$SVN = {
  'COMMAND' => `which svn`.chomp,
  'ADD' => "add",
  'CHECKOUT' => "checkout",
  'COMMIT' => "commit",
  'COMMIT_COMM' => "-m",
  'INFO' => "info",
  'INIT' => "",
  'LOG' => "log",
  'MOVE' => "move",
  'REMOVE' => "remove",
  'STATUS' => "status",
  'UPDATE' => "up"
}

$GIT = {
  'COMMAND' => `which git`.chomp,
  'ADD' => "add",
  'CHECKOUT' => "clone",
  'COMMIT' => "commit",
  'COMMIT_COMM' => "-a -m",
  'INFO' => "info",
  'INIT' => "init",
  'LOG' => "log",
  'MOVE' => "move",
  'REMOVE' => "rm",
  'STATUS' => "status",
  'UPDATE' => "pull"
}

$REPO = {
  'COMMAND' => `which repo`.chomp,
  'ADD' => "",
  'CHECKOUT' => "",
  'COMMIT' => "",
  'COMMIT_COMM' => "",
  'INFO' => "",
  'INIT' => "init",
  'LOG' => "",
  'MOVE' => "",
  'REMOVE' => "",
  'STATUS' => "status",
  'UPDATE' => "sync"
}