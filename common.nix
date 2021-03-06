{ pkgs, ... }:
{
  imports = [
    ./dunst.nix
    ./files.nix
    ./git.nix
    ./i3.nix
    ./packages.nix
    ./polybar.nix
    ./private.nix
    ./rofi.nix
    ./unclutter.nix
    ./xresources.nix
    ./xsession.nix
    ./zsh.nix
  ];

  nixpkgs.config.allowUnfree = true;

  home.sessionVariables = {
    GTK_IM_MODULE = "ibus";
    LC_CTYPE = "en_US.UTF-8";
    QT_IM_MODULE = "ibus";
    XMODIFIERS = "@im=ibus";
    BROWSER = "firefox";
  };

  xdg.enable = true;

  gtk = {
    iconTheme.package = pkgs.gnome3.gnome_themes_standard;
    theme.package = pkgs.gnome3.gnome_themes_standard;
  };

  services = {
    parcellite.enable = true;
    blueman-applet.enable = true;

    kdeconnect = {
      enable = true;
      indicator = true;
    };

    gnome-keyring = {
      enable = true;
      components = ["secrets" "ssh"];
    };

    gpg-agent = {
      enable = true;
      defaultCacheTtl = 1800;
      enableSshSupport = true;
    };

    # seafile.enable = true;

    redshift = {
      enable = true;
      latitude = "47.6093";
      longitude = "12.1844";
      tray = true;
      brightness = {
        day = "1";
        night = "0.5";
      };
    };
  };

  programs = {
    command-not-found.enable = true;
    feh.enable = true;

    home-manager = {
      enable = true;
      path = https://github.com/rycee/home-manager/archive/master.tar.gz;
      # path = "/home/manveru/github/rycee/home-manager";
    };

    pidgin = {
      enable = true;
      plugins = with pkgs; [
        pidginotr
        pidginosd
        pidgin-skypeweb
        pidgin-opensteamworks
      ];
    };

    firefox = {
      enable = true;
      enableAdobeFlash = false;
      enableGoogleTalk = true;
      enableIcedTea = true;
    };
  };
}
