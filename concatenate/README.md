# Video Grid Creator

This script creates a grid of videos from multiple input video files.  It arranges four videos into a 2x2 grid, scaling each video to 1280x720 resolution before combining them into a single output video file named `output.mp4`.

This tool is useful for creating video collages, comparisons, or overviews, particularly in scenarios where visualizing multiple video streams simultaneously is beneficial. Examples include showcasing different camera angles of an event, comparing different versions of a video, or displaying the outputs of multiple simulations.

## Setup and Usage

This script requires `ffmpeg` to be installed on your system.  FFmpeg is a powerful command-line tool for manipulating video and audio files.

Here's how to set up and run the script:

1. **Install FFmpeg:**
   - On Debian/Ubuntu systems: `sudo apt-get update && sudo apt-get install ffmpeg`
   - On macOS using Homebrew: `brew install ffmpeg`
   - On Windows: Download the static builds from the official website ([https://ffmpeg.org/download.html](https://ffmpeg.org/download.html)), extract the archive, and add the `bin` folder to your system's PATH environment variable.

2. **Place your input video files (video1.mp4, video2.mp4, video3.mp4, video4.mp4) in the same directory as the script.**  Ensure these files exist and are correctly named. Alternatively, you can modify the script to use different filenames.

3. **Save the script as `concatenate.sh` and make it executable:** `chmod +x concatenate.sh`

4. **Run the script:** `./concatenate.sh`

This will generate a new video file named `output.mp4` containing the 2x2 grid of your input videos.

