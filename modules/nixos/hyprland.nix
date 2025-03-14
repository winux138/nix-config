{pkgs, ...}: {
  programs = {
    dconf.enable = true;
    hyprland.enable = true;
  };

  services = {
    xserver.enable = true;
    xserver.videoDrivers = ["amdgpu"];
    dbus.enable = true;

    displayManager.sddm = {
      enable = true;
      wayland.enable = true;
    };

    # pipewire = {
    #   enable = true;
    #   alsa.enable = true;
    #   alsa.support32Bit = true;
    #   pulse.enable = true;
    # };
  };

  # This variable fixes electron apps in wayland
  environment.sessionVariables.NIXOS_OZONE_WL = "1";

  environment.systemPackages = with pkgs; [
    nwg-look
    networkmanagerapplet
    openfortivpn
    networkmanager-fortisslvpn
    dunst
    waybar
    hyprlock
    wl-clipboard
    grimblast
  ];
}
