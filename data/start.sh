#!/bin/bash

java -XX:+UnlockExperimentalVMOptions \
-XX:G1HeapRegionSize=4M \
-XX:InitiatingHeapOccupancyPercent=10 \
-XX:+UseG1GC -XX:MaxGCPauseMillis=70 -XX:+DisableExplicitGC -XX:TargetSurvivorRatio=90 -XX:G1NewSizePercent=50 -XX:G1MaxNewSizePercent=80 -XX:G1MixedGCLiveThresholdPercent=35 \
-XX:+AlwaysPreTouch -XX:+ParallelRefProcEnabled \
-XX:+AggressiveOpts -Xms${MIN_MEMORY} -Xmx${MAX_MEMORY} -XX:+UseLargePagesInMetaspace \
-jar paper.jar
