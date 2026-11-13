/*
 * Copyright (C) 2026 The LineageOS Project
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

package com.android.internal.telephony;

import static com.android.internal.telephony.RILConstants.*;

import android.content.Context;
import android.os.Parcel;
import android.telephony.Rlog;

/**
 * Framework-side workaround for Samsung QMI RILs which jump directly to
 * RADIO_STATE_ON without reporting the intermediate SIM states.
 *
 * libril only sends UNSOL_RESPONSE_SIM_STATUS_CHANGED from the intermediate
 * states, so the framework can cache CARDSTATE_ABSENT during boot and never
 * re-query. Once the radio is on, ask for the card status again.
 */
public class HeatqlteRIL extends SamsungQcomRIL {

    private static final String TAG = "HeatqlteRIL";

    private boolean mSimRequeried = false;

    public HeatqlteRIL(Context context, int networkMode, int cdmaSubscription) {
        super(context, networkMode, cdmaSubscription);
    }

    public HeatqlteRIL(Context context, int preferredNetworkType,
            int cdmaSubscription, Integer instanceId) {
        super(context, preferredNetworkType, cdmaSubscription, instanceId);
    }

    @Override
    protected void processUnsolicited(Parcel p, int type) {
        int dataPosition = p.dataPosition();
        int response = p.readInt();
        p.setDataPosition(dataPosition);

        super.processUnsolicited(p, type);

        if (response == RIL_UNSOL_RESPONSE_RADIO_STATE_CHANGED) {
            if (mState.isOn()) {
                if (!mSimRequeried) {
                    mSimRequeried = true;
                    Rlog.d(TAG, "radio on: re-querying SIM status");
                    getIccCardStatus(null);
                }
            } else {
                mSimRequeried = false;
            }
        }
    }
}
