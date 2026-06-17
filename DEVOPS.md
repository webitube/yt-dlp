<!DOCTYPE html>
<h1 style="color: #333;">⚙️ DevOps Guide for yt-dlp</h1>

This document outlines the standard workflow for developers, including how to pull the latest code, build a standalone executable for distribution, and run the application with various command-line arguments.

---

### 🚀 1. Getting the Latest Version

To ensure you are working with the most up-to-date source code, always pull the latest changes from the main repository branch.

**Command:**
```bash
git pull origin main
```

### 🌿 2. Setting Up the Development Environment (Virtual Environments)

Before building or running the application, it is highly recommended to use a virtual environment to isolate dependencies.

**Creating and Activating the Virtual Environment:**
1.  **Create the environment:**
    ```bash
    python -m venv venv
    ```
    or

    ```bash
    conda create -n yt-dlp
    ```

2.  **Activate the environment (Windows - PowerShell):**
    ```bash
    .\venv\Scripts\Activate.bat
    ```

    or

    ```bash
    conda activate yt-dlp
    ```

    *Note: If you encounter execution policy errors, you may need to run `Set-ExecutionPolicy RemoteSigned -Scope Process` first.*

3.  **Deactivate the environment:**
    ```bash
    deactivate
    ```

    or

    ```bash
    conda deactivate
    ```

**Usage:**
Once activated, all subsequent dependency installations (e.g., `pip install -r requirements/default.txt`) and script executions should be performed within this activated environment.

---

### 🛠️ 3. Building a Standalone Executable (The Build Process)

The standalone executable is built using `PyInstaller` via the `bundle/pyinstaller.py` script. This process requires Python and PyInstaller to be installed in your environment.

**Prerequisites:**
1.  Ensure all dependencies are installed:
    ```bash
    pip install -r requirements/default.txt
    ```
2.  Run the build script from the project root:
    ```bash
    python bundle/pyinstaller.py
    ```

**Explanation:**
*   This command executes the build logic defined in `bundle/pyinstaller.py`.
*   It will create the final executable (e.g., `dist/yt-dlp-onefile.exe` on Windows) in the `dist/` directory.
*   **Important:** Remember to run `devscripts/update-version.py` after a successful build to update the version information in the executable.

### 💻 4. Running the Application (Usage Examples)

Once the standalone executable is built, you can run it directly. The executable is located in the `dist/` folder.

#### **Basic Usage**

The simplest way to run the tool is by pointing to the executable:

```bash
# Replace <PATH_TO_EXECUTABLE> with the actual path in the dist/ folder
./dist/yt-dlp [OPTIONS] [URL]
```

#### **Key Command-Line Arguments**

| Argument | Description | Example |
| :--- | :--- | :--- |
| `-F` or `--format` | Specify the desired output format (e.g., `mp4`, `mp3`). | `-f mp4` |
| `--output` | Specify the output directory or filename. | `--output "./videos/"` |
| `-x` or `--extract-audio` | Extracts only the audio track (useful for music). | `-x` |
| `--embed-thumbnail` | Embeds the video thumbnail into the output file. | `--embed-thumbnail` |
| `--playlist-items` | Process only specific items from a playlist. | `--playlist-items 5-10` |

#### **Example Scenarios**

**1. Downloading a single video:**
To download a video from YouTube and ensure it's an MP4 file:
```bash
./dist/yt-dlp --format mp4 "YOUR_YOUTUBE_URL"
```

**2. Downloading and converting the best audio track:**
To download a song and save it as an MP3 file:
```bash
./dist/yt-dlp -x --audio-format mp3 "YOUR_YOUTUBE_URL"
```

**3. Downloading an entire playlist:**
To download all videos from a playlist and save them into a specific folder:
```bash
./dist/yt-dlp --output "./Playlist_Downloads/%(playlist_title)s/%(playlist_index)s - %(title)s.%(ext)s" "YOUR_PLAYLIST_URL"
```
***
*Note: This guide assumes you have successfully run the build process and the executable is available in the `dist/` directory.*
