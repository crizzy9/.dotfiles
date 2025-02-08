{ pkgs, ... }:
{
  hardware.enableAllFirmware = true;
  hardware.enableRedistributableFirmware = true;
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings = {
      General = {
        # Enable = "Source,Sink,Media,Socket";
        Name = "Hello";
        ControllerMode = "dual";
        FastConnectable = "true";
        Experimental = "true";
      };
      Policy = {
        AutoEnable = "true";
      };
    };
    # package = pkgs.bluez.overrideAttrs (finalAttrs: previousAttrs: rec {
    #   version = "5.78";
    #
    #   src = pkgs.fetchurl {
    #     url = "mirror://kernel/linux/bluetooth/bluez-${version}.tar.xz";
    #     sha256 = "sha256-gw/tGRXF03W43g9eb0X83qDcxf9f+z0x227Q8A1zxeM=";
    #   };
    #   patches = [];
    #
    #   buildInputs = previousAttrs.buildInputs ++ [
    #     pkgs.python3Packages.pygments
    #   ];
    # });
  };

  services.blueman.enable = true; # pairing
  # systemd.services.bluetooth.serviceConfig.ConfigurationDirectoryMode = "755";
  services.dbus.enable = true; # plugins like micp might need it
}
