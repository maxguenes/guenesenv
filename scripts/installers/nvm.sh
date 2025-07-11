#!/bin/bash
echo "#### Installing NVM ####"

if ! which nvm >/dev/null; then
  curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.40.3/install.sh | bash
fi
