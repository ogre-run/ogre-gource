#!/bin/bash

ffmpeg -i video1.mp4 -i video2.mp4 -i video3.mp4 -i video4.mp4 -filter_complex "[0]scale=1280x720[v1]; [1]scale=1280x720[v2]; [2]scale=1280x720[v3]; [3]scale=1280x720[v4]; \
[v1][v2]hstack=inputs=2[top]; [v3][v4]hstack=inputs=2[bottom]; [top][bottom]vstack=inputs=2[v]" -map "[v]" output.mp4

