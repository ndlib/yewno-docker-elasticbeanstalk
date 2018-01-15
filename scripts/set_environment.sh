#! /bin/sh

CODEBUILD_BUILD_ARN=${CODEBUILD_BUILD_ARN:=arn:aws:codebuild:region-ID:account-ID:build/codebuild}
CODEBUILD_LOG_PATH=${CODEBUILD_LOG_PATH:=$(git rev-parse HEAD)}

APPLICATION_VERSION=$(git describe --always --tags)
AWS_ACCOUNT_ID=${AWS_ACCOUNT_ID:=$(echo ${CODEBUILD_BUILD_ARN} | cut -d: -f5)}

PY_SITE_PACKAGES="$(command -v pipenv >/dev/null 2>&1 && pipenv run python -c 'from distutils.sysconfig import get_python_lib as gpl; print(gpl())')"

export APPLICATION_VERSION AWS_ACCOUNT_ID CODEBUILD_BUILD_ARN CODEBUILD_LOG_PATH PY_SITE_PACKAGES
