# TechTestApp

### Pre-requisite 

* Terraform 0.12+
* Packer 1.4+
* Packer plugin: packer-post-processor-amazon-ami-management 0.7.0+
* Git
* Suggested OS: Linux (Debian)

### High-level Architecture

![Techtestapp](https://user-images.githubusercontent.com/109196045/178875495-ae80472c-5dbc-452d-9e3d-925b222eebaf.jpg)


### Addition Features

* Encryption for S3/DynamoDB/AMI/EBS
* Auto scaling app instances
* Tables arent dropped when new slaves spin up
* App builds itself from source upon launch in container
* Remote state file and lock on AWS


### Install Terraform/Packer with Brew (For Linux Debian):

* sudo apt-get install terraform
* sudo apt-get install packer

### Derployment

1) Clone repository this repo locally:

```
$ git clone https://github.com/dansali/TechTestApp.git
```

2) Modify ```config.tfvars``` according to AWS account.

3) Add AWS credentials into ```secrets/credentials.ini``` according to AWS account.

4) Generate new keys for encryption.

```
$ chmod +x generate_keys.sh
$ ./generate_keys.sh
```

5) Generate new AMI's from built-json.

```
$ chmod +x packer.sh
$ ./packer.sh
```

6) Execute terraform script.

```
$ chmod +x execute_terraform.sh
$ ./execute_terraform.sh
```

7) Wait until Load Balancer url is printed, app & rds might take a few minutes to boot up.

8) To destroy the infrastructure.

```
$ chmod +x destroy_terraform.sh
$ ./destroy_terraform.sh
```

### Built on

* https://github.com/servian/TechTestApp
* https://github.com/wata727/packer-post-processor-amazon-ami-management

This respository consists of multiple tech stacks
* Terraform - Builds AWS instances/resources
* S3/DynamoDB - Holds remote state file/lock
* Packer - Builds the AMI for Terraform to deploy to EC2
* Docker Composer - Spawns 2 docker containers on the EC2
* Nginx web server - Proxy for the app
* Go lang container - Builds and runs the app

### Future wok

* Terraform can be initialised by Git CI/CD pipeline and docker-compose can be replaced by Kubernetes.
