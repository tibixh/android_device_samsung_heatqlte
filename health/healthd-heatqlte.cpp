/*
 * Copyright (C) 2013 The Android Open Source Project
 * Copyright (C) 2013 The CyanogenMod Project
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

#include <healthd.h>

void healthd_board_init(struct healthd_config *config)
{
    config->batteryCapacityPath    = "/sys/devices/battery.78/power_supply/battery/capacity";
    config->batteryStatusPath      = "/sys/devices/battery.78/power_supply/battery/status";
    config->batteryVoltagePath     = "/sys/devices/battery.78/power_supply/battery/voltage_now";
    config->batteryPresentPath     = "/sys/devices/battery.78/power_supply/battery/present";
    config->batteryHealthPath      = "/sys/devices/battery.78/power_supply/battery/health";
    config->batteryTemperaturePath = "/sys/devices/battery.78/power_supply/battery/temp";
    config->batteryTechnologyPath  = "/sys/devices/battery.78/power_supply/battery/technology";
}


int healthd_board_battery_update(struct android::BatteryProperties *props)
{
    // return 0 to log periodic polled battery status to kernel log
    return 0;
}