package com.ghResponse.screensaver;
import com.lianlf.capacitoryfullscreen.ToggleFullScreen;

import com.getcapacitor.BridgeActivity;

public class MainActivity extends BridgeActivity {
@Override
public void onCreate(Bundle savedInstanceState) {
    super.onCreate(savedInstanceState);

    // Initializes the Bridge
    this.init(savedInstanceState, new ArrayList<Class<? extends Plugin>>() {{
        add(ToggleFullScreen.class);
    }});
}
}
