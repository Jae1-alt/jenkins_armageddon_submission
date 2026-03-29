The following Dockerfile code can be used to create a custom jenkins image, with installed plugins from the lisd i the plugins.txt file

Dockerfile code:
```
FROM jenkins/jenkins:j.v1

USER root
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
RUN apt-get update && apt-get install -y \
    curl \
    unzip \
    gnupg \
    groff \
    less \
    python3 \
    python3-pip \
    python3-venv \
    && rm -rf /var/lib/apt/lists/*

RUN apt-get install -y curl unzip \
    && curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" \
    && unzip awscliv2.zip \
    && ./aws/install \
    && rm -rf awscliv2.zip ./aws

RUN curl -LO "https://releases.hashicorp.com/terraform/1.14.7/terraform_1.14.7_linux_amd64.zip" \
    && unzip terraform_1.14.7_linux_amd64.zip \
    && mv terraform /usr/local/bin/ \
    && rm terraform_1.14.7_linux_amd64.zip

USER jenkins
```

List of Jenkins plugins to will called upon by the `jenkins-plugin-cli` command:
```
# AWS
aws-credentials
pipeline-aws
ec2
amazon-ecs
codedeploy
aws-java-sdk2-lambda
aws-java-sdk-lambda
aws-lambda
aws-codebuild
aws-bucket-credentials
aws-secrets-manager-credentials-provider
aws-codepipeline
configuration-as-code-secret-ssm
jenkins-cloudformation-plugin
aws-java-sdk-cloudformation
aws-java-sdk2-cloudformation
aws-sam

# Terraform
terraform

# Google
kubernetes
google-storage-plugin
google-kubernetes-engine
google-oauth-plugin
pipeline-gcp

# DevSecOps
snyk-security-scanner

# Sonar
sonar

# Aqua
aqua-security-scanner
aqua-microscanner
aqua-serverless

# GitHub
github
github-oauth
pipeline-github
pipeline-githubnotify-step
github-scm-trait-notification-context

# Maven
maven-plugin
pipeline-maven

# Publish
publish-over-ssh
```