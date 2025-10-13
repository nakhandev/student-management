#!/bin/bash

# Student Management System - Start Script
# Author: MD Nawab Ali Khan
# Description: Starts the Spring Boot Student Management System

echo "🎓 Starting Student Management System..."
echo "========================================"

# Check if Java is installed
if ! command -v java &> /dev/null; then
    echo "❌ Error: Java is not installed. Please install Java 11 or higher."
    exit 1
fi

# Check Java version
JAVA_VERSION=$(java -version 2>&1 | awk -F '"' '/version/ {print $2}' | awk -F'.' '{print $1}')
if [ "$JAVA_VERSION" -lt 11 ]; then
    echo "❌ Error: Java 11 or higher is required. Current version: $JAVA_VERSION"
    exit 1
fi

# Check if port 8080 is available
if lsof -Pi :8080 -sTCP:LISTEN -t >/dev/null ; then
    echo "⚠️  Warning: Port 8080 is already in use."
    echo "   Please stop any existing application or use a different port."
    echo "   You can stop the application with: ./stop.sh"
    exit 1
fi

# Check if Maven is installed
if ! command -v mvn &> /dev/null; then
    echo "❌ Error: Maven is not installed. Please install Maven."
    exit 1
fi

echo "✅ Java version: $(java -version 2>&1 | awk -F '"' '/version/ {print $2}')"
echo "✅ Maven found"
echo "✅ Port 8080 is available"

# Start the application
echo ""
echo "🚀 Starting Spring Boot application..."
echo "   Command: mvn spring-boot:run"
echo "   URL: http://localhost:8080"
echo "   API Base: http://localhost:8080/api/students"
echo ""

# Run the application in background
mvn spring-boot:run &

# Get the process ID
APP_PID=$!

echo "✅ Application started successfully!"
echo "   Process ID: $APP_PID"
echo "   Application URL: http://localhost:8080"
echo "   Health Check: http://localhost:8080/actuator/health"
echo "   API Documentation: See README.md for all endpoints"
echo ""
echo "📋 To stop the application, run: ./stop.sh"
echo "📋 To view logs, run: tail -f target/surefire-reports/*.log"
echo ""
echo "🎯 Application is ready to use!"
echo "========================================"
