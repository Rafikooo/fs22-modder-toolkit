#!/bin/bash
# Quick script to run Docusaurus documentation

SITE_DIR="outputs/site"

cd "$(dirname "$0")"

if [ ! -d "$SITE_DIR/node_modules" ]; then
    echo "📦 Installing dependencies (first time only)..."
    cd "$SITE_DIR"
    npm install
    echo ""
else
    cd "$SITE_DIR"
fi

echo "🚀 Starting Docusaurus dev server..."
echo ""
echo "   Documentation will open at: http://localhost:3000"
echo "   Press Ctrl+C to stop"
echo ""

npm start
