{
  boot = {
    # Bootloader.
    # loader.systemd-boot.enable = true;
    loader.efi.canTouchEfiVariables = true;
    loader.grub.enable = true;
    loader.grub.device = "nodev";
    loader.grub.efiSupport = true;
    loader.grub.useOSProber = true;
  };
}
