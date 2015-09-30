#!/bin/bash -e
if ([ "$TRAVIS_BRANCH" == "master" ] || [ ! -z "$TRAVIS_TAG" ]) && \
  [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo "Deploying image to docker hub"
  # Setup login
  openssl aes-256-cbc -K $encrypted_7cc4e6238d18_key -iv $encrypted_7cc4e6238d18_iv -in .dockercfg.enc -out ~/.dockercfg -d
  docker push "camptocamp/docker-agent:${TRAVIS_TAG}"
else
  echo "Not deploying image"
fi
