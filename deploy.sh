#!/bin/bash

# BreadHub Recipe Manager - Deployment Script
# This script helps you deploy your app to GitHub and Netlify

echo "🍞 BreadHub Recipe Manager - Deployment Script"
echo "=============================================="

# Check if git is initialized
if [ ! -d ".git" ]; then
    echo "📝 Initializing Git repository..."
    git init
    git branch -M main
fi

# Add all files
echo "📁 Adding files to Git..."
git add .

# Get commit message from user or use default
if [ -z "$1" ]; then
    COMMIT_MSG="Update BreadHub Recipe Manager"
else
    COMMIT_MSG="$1"
fi

echo "💾 Committing changes: $COMMIT_MSG"
git commit -m "$COMMIT_MSG"

# Check if remote origin exists
if ! git remote get-url origin > /dev/null 2>&1; then
    echo "⚠️  No remote origin found."
    echo "Please add your GitHub repository URL:"
    echo "git remote add origin https://github.com/yourusername/BreadHub-Recipe.git"
    echo ""
    echo "Then run this script again or push manually:"
    echo "git push -u origin main"
else
    echo "🚀 Pushing to GitHub..."
    git push -u origin main
    echo ""
    echo "✅ Deployment complete!"
    echo ""
    echo "Next steps:"
    echo "1. 🔗 Connect your GitHub repo to Netlify at https://netlify.com"
    echo "2. 🔥 Set up Firebase (see README.md for instructions)"
    echo "3. 🎉 Your app will be live at: https://your-app-name.netlify.app"
fi

echo ""
echo "🛠️  Local testing:"
echo "Open index.html in your browser or run:"
echo "python3 -m http.server 8000"