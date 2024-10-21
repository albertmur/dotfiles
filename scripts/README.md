# Automatic Git Pull and Push on Startup and Shutdown

This guide provides instructions on how to set up automatic `git pull` when your system starts and `git push` when your system shuts down. The process leverages Bash scripts and `systemd` services to run the commands during system events.

## 1. Create Bash Scripts

### Script for `git pull`

Create a Bash script that runs `git pull` when the system starts. Save this file as `git_pull.sh`:

```bash
#!/bin/bash

# Path to the repository
REPO_DIR="$HOME/path/to/your/repository"

# Change to the repository directory
cd "$REPO_DIR" || exit

# Perform git pull
git pull origin main

#!/bin/bash

# Path to the repository
REPO_DIR="$HOME/path/to/your/repository"

# Change to the repository directory
cd "$REPO_DIR" || exit

# Add all changes, commit, and push
git add .
git commit -m "Auto-sync changes"
git push origin main
```

Finally, make both scripts executable:
chmod +x git_pull.sh
chmod +x git_push.sh

