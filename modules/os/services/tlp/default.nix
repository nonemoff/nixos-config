{ lib, config, ... }: {
  options = {
    module.service.tlp.enable =
      lib.mkEnableOption "enables tlp";
  };

  config = lib.mkIf config.module.service.tlp.enable {
    services.power-profiles-daemon.enable = false;
    services.tlp = {
      enable = true;
      settings = {
        CPU_SCALING_GOVERNOR_ON_AC = "performance";
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";

        CPU_ENERGY_PERF_POLICY_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";

        CPU_MIN_PERF_ON_AC = 0;
        CPU_MAX_PERF_ON_AC = 100;
        CPU_MIN_PERF_ON_BAT = 0;
        CPU_MAX_PERF_ON_BAT = 20;

        CPU_BOOST_ON_AC = 1;
        CPU_BOOST_ON_BAT = 0;

        RADEON_DPM_PERF_LEVEL_ON_AC = "high";
        RADEON_DPM_PERF_LEVEL_ON_BAT = "low";

        RADEON_DPM_STATE_ON_AC = "performance";
        RADEON_DPM_STATE_ON_BAT = "battery";

        RADEON_POWER_PROFILE_ON_AC = "high";
        RADEON_POWER_PROFILE_ON_BAT = "low";

        SCHED_POWERSAVE_ON_AC = 0;
        SCHED_POWERSAVE_ON_BAT = 1;

        PLATFORM_PROFILE_ON_AC = "performance";
        PLATFORM_PROFILE_ON_BAT = "low-power";

        NMI_WATCHDOG = 0;

        START_CHARGE_THRESH_BAT0 = 0;
        STOP_CHARGE_THRESH_BAT0 = 60;
        RESTORE_THRESHOLDS_ON_BAT = 1;
      };
    };
  };
}
