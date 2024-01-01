.PHONY: install uninstall

install:
	@echo "Installing tfetch script..."
	@sudo cp tfetch.sh /usr/local/bin/tfetch
	@sudo chmod +x /usr/local/bin/tfetch
	@echo "tfetch script installed successfully."

uninstall:
	@echo "Uninstalling tfetch script..."
	@sudo rm -f /usr/local/bin/tfetch
	@echo "tfetch script uninstalled successfully."
