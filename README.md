# Repository Visualization with Gource

This repository contains scripts to generate a visually appealing video showcasing the contribution history of a Git repository using Gource. The video dynamically illustrates the evolution of the codebase, displaying file additions, modifications, and deletions over time.  Each contributor is represented by an avatar, making it easy to see who contributed to which parts of the project.

This tool is useful for project demonstrations, showcasing open-source contributions, or simply creating engaging visuals of a repository's history. It transforms the typical commit log into a dynamic and understandable format.

## Setup and Usage

This script requires `gource`, `ffmpeg`, and `git` to be installed on your system.  You can usually install these through your system's package manager (e.g., `apt-get`, `brew`, etc.). For example on Debian/Ubuntu:

```bash
sudo apt-get install gource ffmpeg git
```

To create a visualization video, follow these steps:

1. **Clone this repository:**

```bash
git clone https://github.com/<your_username>/<this_repo>.git
cd <this_repo>
```

2. **Run the script:**  The script takes one argument, which can either be a GitHub URL or a local path to a Git repository.

   **Using a GitHub URL:**

   ```bash
   ./run.sh https://github.com/<username>/<repository>.git
   ```

   **Using a local repository path:**

   ```bash
   ./run.sh /path/to/your/repository
   ```

The script performs the following actions:

- **Clones the repository:** If a GitHub URL is provided, the script clones the repository. If a local path is given, it skips the cloning step.
- **Generates `caption.txt`:**  The script extracts the commit history from the repository and creates `caption.txt`, which Gource uses to display commit messages in the visualization.
- **Runs Gource:** The `gource` command generates a stream of PPM image frames based on the repository's history and configuration specified in `gource.config`. The output is piped to `ffmpeg`.
- **Runs FFmpeg:** The `ffmpeg` command encodes the PPM stream into an MP4 video file named `gource.x264.mp4`.


## Configuration

The `gource.config` file contains various settings for customizing the Gource visualization. You can modify parameters like viewport size, display options, user scaling, colors, and the project logo. See the Gource documentation for a full list of available options.

## Included Files

- **`run.sh`**:  The main script that orchestrates the process of cloning (if necessary), generating the caption file, running Gource, and encoding the output video.
- **`gource.config`**: Configuration file for Gource, controlling the appearance of the visualization.
- **`run_ffmpeg.sh`**: A simplified script that only runs the ffmpeg command. While present in the repository, it's currently unused as ffmpeg is invoked directly from `run.sh`.
