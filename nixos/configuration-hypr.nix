# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Set your time zone.
  time.timeZone = "America/Chicago";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.niv0se = {
    isNormalUser = true;
    description = "niv0se";
    extraGroups = [ "networkmanager" "wheel" ];
    packages = with pkgs; [
   ];
  };

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

# Enable CUPS to print
  services.printing.enable = true;
  services.pulseaudio.enable = false;
  services.pipewire = {
   enable = true;
   alsa.enable = true;
   alsa.support32Bit = true;
   pulse.enable = true;


};


#  media-session.enable = true

security.pam.services.swaylock ={};

# Useful programs and services
programs.hyprland.enable = true;
fonts.packages = with pkgs; [nerd-fonts.symbols-only noto-fonts noto-fonts-extra noto-fonts-cjk-sans noto-fonts-cjk-serif noto-fonts-emoji fira-code fira-code-symbols font-awesome liberation_ttf proggyfonts];
fonts.fontDir.enable = true;
users.defaultUserShell = pkgs.zsh;
programs.zsh.enable = true;
programs.firefox.enable = true;
services.flatpak.enable = true;
services.gvfs.enable = true;
services.udisks2.enable = true;

# programs.uwsm.enable = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
  neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
  pkgs.kitty
  kdePackages.dolphin
  kdePackages.qtsvg
  kdePackages.ark
  cryptsetup
  nyxt
  kakoune
  wget
  curl
  git
  emacs
  zsh
  btop
  kitty
  waybar
  wofi
  yazi
  swaylock
  nwg-look
  grim
  slurp
  unzip
  vscode
  podman
  distrobox
  usbutils
  udiskie
  udisks
  p7zip

];

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "25.05"; # Did you read the comment?

}
