{ gitUsername, gitEmail, ... }:

{
  programs.git = {
    enable = true;
    userName = gitUsername;
    userEmail = gitEmail;
    # extraConfig = {
    #   init.defaultBranch = "main";
    #   safe.directory = [ ("/home/" + userSettings.username + "/.dotfiles")
    #                      ("/home/" + userSettings.username + "/.dotfiles/.git") ];
    # };
  };
}
