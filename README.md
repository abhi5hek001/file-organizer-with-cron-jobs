# File Organizer CLI with Cron Jobs

A simple **Bash CLI tool** to automatically **organize files** in a directory based on their **type** (Images, Videos, Documents, Others) and optionally **log** the actions.  
It can also be **automated using cron** to run hourly/daily.

---

## Features

- Organize files by type:
  - `Images/`, `Videos/`, `Documents/`, `Others/`
- Optional **logging** of all file movements
- **Cron job setup** to automate the task
- Simple **CLI interface** for easy usage

---

## Project Structure

```
file-organizer/
├─ organizer.sh        # Main CLI script (argument parsing)
├─ organize_files.sh   # Core file organizing logic 
├─ logger_and_cron.sh # Logging and cron setup
├─ logs/              # Stores log files (auto-created)
└─ README.md          # Project documentation
```

---

## Usage

### 1. Make Scripts Executable

```bash
chmod +x *.sh
```

### 2. Run File Organizer Manually

```bash
./organizer.sh -s <source_dir> [-d <destination_dir>] [-l]
```

**Options:**
- `-s` → Source directory (required)
- `-d` → Destination directory (default: same as source)
- `-l` → Enable logging

**Example:**
```bash
./organizer.sh -s ~/Downloads -d ~/Organized -l
```

This will:
- Organize all files from `~/Downloads` into `~/Organized`
- Move files into `Documents/`, `Images/`, `Videos/`, `Others/`
- Log the operations into `logs/YYYY-MM-DD.log`

### 3. Enable Cron Automation

You can schedule the script to run hourly or daily:

```bash
./logger_and_cron.sh setup_cron
```

Default cron job runs hourly, organizing `~/Downloads` and logging actions.

### Example Log Output

```
2025-08-01 14:00:01 - Moved photo1.png to Images
2025-08-01 14:00:01 - Moved resume.pdf to Documents
2025-08-01 14:00:01 - Moved movie.mp4 to Videos
```

Logs are stored in:
```bash
logs/2025-08-01.log
```

## How to Collaborate (3-Person Team)

1. **Jaya Harsh Vardhan Alagadapa (S20220010011)**: `organizer.sh` → CLI & argument parsing
2. **Abhishek Sahay (S20220010003)**: `organize_files.sh` → File detection & moving logic
3. **Sujal Sanjay (S20220010213)**: `logger_and_cron.sh` → Logging & outputs
