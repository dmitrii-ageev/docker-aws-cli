# AWS Command Line Interface (CLI) - A containerized version.

This is _containerized_ AWS CLI to avoid requiring the AWS CLI to be installed on CI machines.

## Usage

**Configure:**
```
export AWS_ACCESS_KEY_ID="<id>"
export AWS_SECRET_ACCESS_KEY="<key>"
export AWS_DEFAULT_REGION="<region>"

```

**Upload file to S3:**
```
$ aws-cli s3 cp your_file s3://downloads.dcos.io/some_path/

```

**Caveat:** Because aws-cli.sh mounts the current directory as /workdir, paths to local files must be relative to the current directory.

## Install

To use aws-cli.sh as a drop-in replacement for calls to the aws-cli, use one of the following methods:

#### Add an alias to your shell:
```
$ alias aws-cli='docker run --rm -t $(tty &>/dev/null && echo "-i") -e "AWS_ACCESS_KEY_ID=${AWS_ACCESS_KEY_ID}" -e "AWS_SECRET_ACCESS_KEY=${AWS_SECRET_ACCESS_KEY}" -e "AWS_DEFAULT_REGION=${AWS_DEFAULT_REGION}" -v "$(pwd):/workdir" dmitriiageev/aws-cli' 
```

#### Or drop it into your path named AWS:
```
$ curl -o /usr/local/bin/aws-cli https://raw.githubusercontent.com/dmitrii-ageev/aws-cli/master/aws-cli.sh && chmod a+x /usr/local/bin/aws-cli

```

## References

 - [AWS CLI Docs](https://aws.amazon.com/documentation/cli/)

## Licence

 GPLv2

