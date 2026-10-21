/*
 * Copyright (C) 2026 The CyanogenMod Project
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

package com.qualcomm.timeservice;

import android.content.BroadcastReceiver;
import android.content.Context;
import android.content.Intent;
import android.util.Log;

/**
 * Passes Android time changes to Qualcomm's time_daemon.
 */
public class TimeServiceBroadcastReceiver extends BroadcastReceiver {
    private static final String TAG = "TimeService";
    private static final String LIBRARY = "TimeService";

    private static final boolean sLoaded;

    static {
        boolean loaded = false;
        try {
            System.loadLibrary(LIBRARY);
            loaded = true;
        } catch (Throwable t) {
            Log.e(TAG, "Unable to load " + LIBRARY + " library", t);
        }
        sLoaded = loaded;
    }

    /*
     * Implemented by /vendor/lib/libTimeService.so:
     *   Java_com_qualcomm_timeservice_TimeServiceBroadcastReceiver_setTimeServicesUserTime
     * It issues time_genoff_operation(ATS_USER, TIME_MSEC, T_SET, time).
     */
    private native void setTimeServicesUserTime(long time);

    @Override
    public void onReceive(Context context, Intent intent) {
        if (!sLoaded) {
            return;
        }

        final long now = System.currentTimeMillis();
        Log.d(TAG, "onReceive " + intent.getAction() + ", time=" + now);
        try {
            setTimeServicesUserTime(now);
        } catch (Throwable t) {
            Log.e(TAG, "Unable to pass time to time_daemon", t);
        }
    }
}
