require File.expand_path(File.dirname(__FILE__) + "/init")

# Can't run more than one controller at a time this way
RespondToController.run!
StandaloneController.run!

