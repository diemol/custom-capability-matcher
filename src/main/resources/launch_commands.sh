#!/usr/bin/env bash

# Download Selenium
wget http://selenium-release.storage.googleapis.com/2.53/selenium-server-standalone-2.53.0.jar


# Start the hub with the specific config
java -cp selenium-server-standalone-2.53.0.jar:target/custom-capability-matcher-1.0-SNAPSHOT.jar org.openqa.grid.selenium.GridLauncher -role hub -hubConfig src/main/resources/hubConfig.json

# Start node foo
java -jar selenium-server-standalone-2.53.0.jar -role node -hub http://localhost:4444/grid/register -nodeConfig nodeConfig_foo.json

# Start node bar
java -jar selenium-server-standalone-2.53.0.jar -role node -hub http://localhost:4444/grid/register -nodeConfig nodeConfig_bar.json
