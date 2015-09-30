#!/bin/bash -e
if ([ "$TRAVIS_BRANCH" == "master" ] || [ ! -z "$TRAVIS_TAG" ]) && \
  [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
  echo "Deploying image to docker hub"
  docker login -p "${DOCKER_PASSWORD}" -u "${DOCKER_USERNAME}" -e "${DOCKER_EMAIL}"
  docker push "camptocamp/docker-agent:${TRAVIS_TAG}"
else
  echo "Not deploying image"
fi
