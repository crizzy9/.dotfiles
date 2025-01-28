{ pkgs, ... }:
{
  home.packages = with pkgs; [
    python312Packages.pip
    python312Packages.openai-whisper
  ];

}
