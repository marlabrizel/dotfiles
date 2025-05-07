#!/bin/bash
# Cleanup script to remove redundant files after dotfiles modernization

echo "Cleaning up redundant files..."

# Remove bin directory
if [ -d "bin" ]; then
  echo "Removing bin/ directory..."
  rm -rf bin
fi

# Remove packages/bundles.txt
if [ -f "packages/bundles.txt" ]; then
  echo "Removing packages/bundles.txt..."
  rm packages/bundles.txt
  
  # Check if packages directory is empty and remove if it is
  if [ -z "$(ls -A packages 2>/dev/null)" ]; then
    echo "Removing empty packages/ directory..."
    rmdir packages
  fi
fi

# Remove tmux.conf and tmate.conf
if [ -f "dots/tmux.conf" ]; then
  echo "Removing dots/tmux.conf..."
  rm dots/tmux.conf
fi

if [ -f "dots/tmate.conf" ]; then
  echo "Removing dots/tmate.conf..."
  rm dots/tmate.conf
fi

echo "Cleanup complete!"