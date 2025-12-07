.PHONY: hooks
hooks:
	brew install pre-commit
	pre-commit install --hook-type commit-msg
