#!/bin/bash

# Exit on fail
set -e

# Ensure all gems installed
bundle check || bundle

# Finally call command issued to the docker service
exec "$@"