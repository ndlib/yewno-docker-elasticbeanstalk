# Yewno nginx docker elasticbeanstalk test

```shell
pipenv install --ignore-pipfile && pipenv shell

APPLICATION_NAME=yewno
ENVIRONMENT=test
VERSION_LABEL=v2018.4
APPLICATION_VERSION_BUNDLE=${VERSION_LABEL}.zip

REGION=$(aws configure get region)
BUCKET=${APPLICATION_NAME}-${REGION}

# setup AWS Elastic Beanstalk
aws elasticbeanstalk create-application --application-name ${APPLICATION_NAME}

# make the version bundle
git archive -v -o ${APPLICATION_VERSION_BUNDLE} --format=zip HEAD
aws s3 mb s3://${BUCKET}
aws s3 mv ${APPLICATION_VERSION_BUNDLE} s3://${BUCKET}/
aws elasticbeanstalk create-application-version \
 --application-name ${APPLICATION_NAME} \
 --version-label ${VERSION_LABEL} \
 --source-bundle S3Bucket=${BUCKET},S3Key=${APPLICATION_VERSION_BUNDLE}

# launch this puppy into space
aws elasticbeanstalk create-environment \
 --cname-prefix ${APPLICATION_NAME} \
 --application-name ${APPLICATION_NAME} \
 --version-label ${VERSION_LABEL} \
 --environment-name ${ENVIRONMENT} \
 --solution-stack-name "64bit Amazon Linux 2017.09 v2.8.2 running Docker 17.06.2-ce"

```
