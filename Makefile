SWIFTLINT_VERSION = 0.50.3
SWIFTLINT_SHA256 = 47078845857fa7cf8497f5861967c7ce67f91915e073fb3d3114b8b2486a9270

SWIFTLINT_URL = https://github.com/realm/SwiftLint/releases/download/$(SWIFTLINT_VERSION)/portable_swiftlint.zip
swiftlint:
	@echo "  ⚠️  Checking for SwiftLint..."
	@rm -rf tools/swiftlint
	@curl -L $(SWIFTLINT_URL) --output tools/swiftlint.zip
	@echo "$(SWIFTLINT_SHA256)  tools/swiftlint.zip" > tools/swiftlint.zip.sha256
	@shasum -a 256 -c tools/swiftlint.zip.sha256
	@unzip tools/swiftlint.zip -d tools/swiftlint
	@rm tools/swiftlint.zip*
	@echo "  ✅ SwiftLint is good to go!"

lint:
	$(shell ./tools/swiftlint/swiftlint lint --fix)
