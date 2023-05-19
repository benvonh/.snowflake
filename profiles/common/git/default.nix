{ ... }:
{
  programs = {
    git = {
      enable = true;
      userName = "benvonh";
      userEmail = "benjaminvonsnarski@gmail.com";
    };
    gh = {
      enable = true;
      settings = {
        editor = "hx";
        prompt = "enabled";
      };
    };
  };
}
