#!/bin/bash

# Student Management System - Stop Script
# Author: MD Nawab Ali Khan
# Description: Stops the Spring Boot Student Management System gracefully

echo "🛑 Stopping Student Management System..."
echo "========================================"

# Find the Spring Boot application process
APP_PID=$(ps aux | grep "spring-boot:run" | grep -v grep | awk '{print $2}')

if [ -z "$APP_PID" ]; then
    echo "❌ No running Spring Boot application found."
    echo "   The application might already be stopped or not started."
    exit 1
fi

echo "✅ Found application process: $APP_PID"

# Stop the application gracefully
echo "🔄 Stopping application gracefully..."
kill -TERM $APP_PID

# Wait for the process to stop
echo "⏳ Waiting for application to stop..."
while ps -p $APP_PID > /dev/null; do
    sleep 1
    echo "   ...still stopping"
done

echo "✅ Application stopped successfully!"

# Verify the port is free
if lsof -Pi :8080 -sTCP:LISTEN -t >/dev/null ; then
    echo "⚠️  Warning: Port 8080 is still in use."
    echo "   There might be another application running on this port."
else
    echo "✅ Port 8080 is now available"
fi

echo ""
echo "🎯 Application has been stopped!"
echo "📋 To start the application again, run: ./start.sh"
echo ""
echo "========================================"
