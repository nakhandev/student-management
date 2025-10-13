#!/bin/bash

# Student Management System - Git Push Script
# Author: Md Nawab Ali Khan
# Description: Comprehensive Git automation script for the Student Management System

set -e  # Exit on any error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
NC='\033[0m' # No Color

echo -e "${CYAN}🚀 Student Management System - Git Push Script${NC}"
echo "==============================================="

# Function to print colored output
print_status() {
    echo -e "${GREEN}✅ $1${NC}"
}

print_warning() {
    echo -e "${YELLOW}⚠️  $1${NC}"
}

print_error() {
    echo -e "${RED}❌ $1${NC}"
}

print_info() {
    echo -e "${BLUE}ℹ️  $1${NC}"
}

# Check if Git is installed
if ! command -v git &> /dev/null; then
    print_error "Git is not installed. Please install Git first."
    exit 1
fi

# Check if we're in a Git repository
if ! git rev-parse --git-dir > /dev/null 2>&1; then
    print_error "Not in a Git repository. Please initialize Git first:"
    echo "   git init"
    echo "   git remote add origin <your-repo-url>"
    exit 1
fi

print_status "Git repository detected"

# Get repository information
REPO_URL=$(git remote get-url origin 2>/dev/null || echo "No remote configured")
BRANCH=$(git branch --show-current)
COMMIT_COUNT=$(git rev-list --count HEAD 2>/dev/null || echo "0")

print_info "Repository URL: ${REPO_URL:-"Not configured"}"
print_info "Current branch: $BRANCH"
print_info "Total commits: $COMMIT_COUNT"

# Check if remote is configured
if [ "$REPO_URL" = "No remote configured" ]; then
    print_error "No remote repository configured."
    echo "Please add a remote repository:"
    echo "   git remote add origin https://github.com/nakhandev/student-management.git"
    exit 1
fi

# Check repository status
echo ""
echo -e "${CYAN}📊 Repository Status:${NC}"
git status --porcelain

# Check for uncommitted changes
if git diff --quiet && git diff --staged --quiet; then
    print_warning "No changes to commit."
    echo "The repository is clean. Nothing to push."
    exit 0
fi

# Show what will be added
echo ""
echo -e "${CYAN}📋 Files to be committed:${NC}"
git add --dry-run .

# Confirm before proceeding
echo ""
read -p "Do you want to proceed with the commit and push? (y/N): " -n 1 -r
echo
if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    print_info "Operation cancelled by user."
    exit 0
fi

# Stage all changes
echo ""
echo -e "${CYAN}📦 Staging files...${NC}"
git add .

# Get the number of staged files
STAGED_COUNT=$(git diff --cached --name-only | wc -l)
print_status "Staged $STAGED_COUNT files for commit"

# Create commit message with timestamp and project info
TIMESTAMP=$(date '+%Y-%m-%d %H:%M:%S')
PROJECT_VERSION=$(grep -o '<version>[^<]*</version>' pom.xml | grep -o '[0-9]\+\.[0-9]\+\.[0-9]\+' || echo "1.0.0")

# Check if this is the first commit
if [ "$COMMIT_COUNT" = "0" ]; then
    COMMIT_MSG="🎓 Initial commit: Student Management System v$PROJECT_VERSION

📅 Timestamp: $TIMESTAMP
🏗️ Spring Boot REST API with MySQL
✅ Full CRUD operations implemented
✅ Data validation and error handling
✅ Automated database setup
✅ Comprehensive API documentation

Built with:
- Java 11+
- Spring Boot 2.7.x
- MySQL 8.0
- Maven
- RESTful API design"
else
    COMMIT_MSG="🔄 Update: Student Management System v$PROJECT_VERSION

📅 Timestamp: $TIMESTAMP
📊 Build: $((COMMIT_COUNT + 1))
✅ All API endpoints tested and working
✅ Database auto-creation functional
✅ Shell scripts for start/stop operations
✅ Comprehensive documentation

Changes in this commit:
$(git diff --cached --name-only | sed 's/^/  - /')"
fi

# Commit the changes
echo ""
echo -e "${CYAN}💾 Creating commit...${NC}"
echo -e "${YELLOW}Commit message:${NC}"
echo "$COMMIT_MSG"
echo ""

git commit -m "$COMMIT_MSG"

print_status "Changes committed successfully"

# Push to remote repository
echo ""
echo -e "${CYAN}🚀 Pushing to remote repository...${NC}"
echo "Remote: $REPO_URL"
echo "Branch: $BRANCH"

# Try to push
if git push origin "$BRANCH"; then
    print_status "Successfully pushed to $REPO_URL"
    print_info "Branch: $BRANCH"
    print_info "New commit count: $((COMMIT_COUNT + 1))"

    echo ""
    echo -e "${GREEN}🎉 Push completed successfully!${NC}"
    echo "==============================================="
    echo "🌐 Repository URL: $REPO_URL"
    echo "📖 You can view your project at the URL above"
    echo ""
    echo -e "${CYAN}📋 Next steps:${NC}"
    echo "   - Share your repository with others"
    echo "   - Create a pull request if working with a team"
    echo "   - Deploy to production if ready"
    echo ""
    echo -e "${PURPLE}💡 Pro tip: Use ./start.sh to run your application${NC}"

else
    print_error "Failed to push to remote repository."
    echo ""
    echo -e "${YELLOW}Troubleshooting:${NC}"
    echo "   - Check your internet connection"
    echo "   - Verify remote repository URL"
    echo "   - Ensure you have push permissions"
    echo "   - Try: git push -u origin $BRANCH (for initial push)"
    echo ""
    echo "If this is your first push to this repository, try:"
    echo "   git push -u origin $BRANCH"
    exit 1
fi

echo "==============================================="
