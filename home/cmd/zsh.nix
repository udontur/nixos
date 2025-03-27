{ pkgs, config, ... }:

{
  
  home.packages = with pkgs; [
    zsh-powerlevel10k
    zsh-syntax-highlighting
    zsh-autocomplete
  ];
  #home.file.".p10k.zsh".text = builtins.readFile ../../assets/p10k/p10k.zsh;
  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;
    shellAliases={
      reb="./rebuild";
    };
    history.size=10000;
  };
}
