#!/bin/bash

# Validate variables
if [[ -z "${FROM_HOST}" ]]; then
  echo "FATAL ERROR: FROM_HOST can not be null."
  exit 1
fi
FROM_SCHEME=${FROM_SCHEME:-https}
FROM_URL="${FROM_SCHEME}://${FROM_HOST}"

if [[ -z "${FROM_IMAGE}" ]]; then
  echo "FATAL ERROR: FROM_IMAGE can not be null."
  exit 1
fi

if [[ -z "${FROM_TAG}" ]]; then
  echo "FATAL ERROR: FROM_TAG can not be null."
  exit 1
fi

if [[ -z "${FROM_USERNAME}" ]]; then
  echo "FATAL ERROR: FROM_USERNAME can not be null."
  exit 1
fi

if [[ -z "${FROM_PASSWORD}" ]]; then
  echo "FATAL ERROR: FROM_PASSWORD can not be null."
  exit 1
fi

if [[ -z "${TO_HOST}" ]]; then
  echo "FATAL ERROR: TO_HOST can not be null."
  exit 1
fi
TO_SCHEME=${TO_SCHEME:-https}
TO_URL="${TO_SCHEME}://${TO_HOST}"

if [[ -z "${TO_IMAGE}" ]]; then
  echo "FATAL ERROR: TO_IMAGE can not be null."
  exit 1
fi

if [[ -z "${TO_TAG}" ]]; then
  echo "FATAL ERROR: TO_TAG can not be null."
  exit 1
fi

if [[ -z "${TO_USERNAME}" ]]; then
  echo "FATAL ERROR: TO_USERNAME can not be null."
  exit 1
fi

if [[ -z "${TO_PASSWORD}" ]]; then
  echo "FATAL ERROR: TO_PASSWORD can not be null."
  exit 1
fi

# Login to FROM_URL
cmd="docker login --username ${FROM_USERNAME} --password ${FROM_PASSWORD} ${FROM_URL}"
echo "Running: ${cmd}"
eval "${cmd}"

# Download image
cmd="docker pull ${FROM_HOST}/${FROM_IMAGE}:${FROM_TAG}"
echo "Running: ${cmd}"
eval "${cmd}"

# Login to TO_URL
cmd="docker login --username ${TO_USERNAME} --password ${TO_PASSWORD} ${TO_URL}"
echo "Running: ${cmd}"
eval "${cmd}"

# Tag image for push
cmd="docker tag ${FROM_HOST}/${FROM_IMAGE}:${FROM_TAG} ${TO_HOST}/${TO_IMAGE}:${TO_TAG}"
echo "Running: ${cmd}"
eval "${cmd}"

# Push image
cmd="docker push ${TO_HOST}/${TO_IMAGE}:${TO_TAG}"
echo "Running: ${cmd}"
eval "${cmd}"
