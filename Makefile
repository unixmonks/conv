#!/usr/bin/env make

# Makefile for conv - Currency Converter

# Installation paths
PREFIX = /usr/local
USER_PREFIX = $(HOME)/.local
BINDIR = $(PREFIX)/bin
USER_BINDIR = $(USER_PREFIX)/bin

# Default target
all: help

# Help target
help:
	@echo "conv - Currency Converter"
	@echo ""
	@echo "Available targets:"
	@echo "  install       - Install system-wide (requires sudo)"
	@echo "  install-user  - Install for current user only"
	@echo "  uninstall     - Uninstall system-wide (requires sudo)"
	@echo "  uninstall-user- Uninstall for current user"
	@echo "  test          - Run basic functionality tests"
	@echo "  deps          - Check for required dependencies"
	@echo "  help          - Show this help message"

# Install system-wide
install:
	@echo "Installing conv to $(BINDIR)..."
	install -d $(BINDIR)
	install -m 755 conv $(BINDIR)/conv
	@echo "Installation complete!"
	@echo "You can now use: conv <from> <to> <amount>"

# Install for current user
install-user:
	@echo "Installing conv to $(USER_BINDIR)..."
	install -d $(USER_BINDIR)
	install -m 755 conv $(USER_BINDIR)/conv
	@echo "Installation complete!"
	@echo "Make sure $(USER_BINDIR) is in your PATH"
	@echo "You can now use: conv <from> <to> <amount>"

# Uninstall system-wide
uninstall:
	@echo "Removing conv from $(BINDIR)..."
	rm -f $(BINDIR)/conv
	@echo "Uninstall complete!"

# Uninstall for current user
uninstall-user:
	@echo "Removing conv from $(USER_BINDIR)..."
	rm -f $(USER_BINDIR)/conv
	@echo "Uninstall complete!"

# Check dependencies
deps:
	@echo "Checking dependencies..."
	@which curl >/dev/null 2>&1 || (echo "❌ curl not found - install with: apt install curl" && exit 1)
	@which jq >/dev/null 2>&1 || (echo "❌ jq not found - install with: apt install jq" && exit 1)
	@which bc >/dev/null 2>&1 || (echo "❌ bc not found - install with: apt install bc" && exit 1)
	@echo "✅ All dependencies are installed!"

# Basic functionality tests
test: deps
	@echo "Running basic functionality tests..."
	@./conv -v >/dev/null || (echo "❌ Version check failed" && exit 1)
	@./conv -h >/dev/null || (echo "❌ Help check failed" && exit 1)
	@echo "✅ Basic tests passed!"
	@echo "Note: Full currency conversion tests require internet connectivity"

.PHONY: all help install install-user uninstall uninstall-user deps test
