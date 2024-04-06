{ lib, config, ... }: {
  options = {
    module.program.podman.enable =
      lib.mkEnableOption "enables virtualbox";
  };

  config = lib.mkIf config.module.program.podman.enable {
    virtualisation.podman = {
      enable = true;

      # Create a `docker` alias for podman, to use it as a drop-in replacement
      dockerCompat = true;

      # Required for containers under podman-compose to be able to talk to each other.
      defaultNetwork.settings.dns_enabled = true;
    };
  };
}
