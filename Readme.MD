# Trail DevOps Ascan

## Sumary

- [Trail DevOps Ascan](#trail-devops-ascan)
    - [About the project](#about-the-project)
    - [Project architecture](#project-achitecture)
    - [Technologies](#technologies)
    - [How To Start](#how-to-start)
        - [Initialize terraform project](#initialize-terraform-project)
        - [Creating IAM user on your AWS](#creating-iam-user-on-your-aws)
        - [Getting Access key and secret keys](#getting-access-key-and-secret-keys)
- [Environment Variables](#environment-variables)

# Trail DevOps Ascan

This is an open project to conclude a trail for an Intern formation at
[Instituto Altântico](https://www.atlantico.com.br/).


## About the project

This project is a terraform application which uses AWS to create an instance of nginx using EC2 T2.Micro which is 
eligible for free tier. Providing an infrastructure.

## Project achitecture

## Technologies

- Terraform
- EC2 Instance
- AWS IAM

## How to Start

### Initialize terraform project

The first step is initialize terraform project:

```bash
$ terraform init
```

### Creating IAM user on your AWS

You will need to create an IAM account on AWS in order to run terraform plan. [See this guide.](https://docs.aws.amazon.com/IAM/latest/UserGuide/id_users_create.html)


### Getting Access key and secret keys

[Guide](https://docs.aws.amazon.com/powershell/latest/userguide/pstools-appendix-sign-up.html)


## Environment variables

| Variable          | Description                                            |
|-------------------|--------------------------------------------------------|
| AWS_ACCESS_KEY    | Long-term credentials for an IAM user                  |
| AWS_SECRET_KEY    | Long-term credentials for an IAM user                  |
| retention_days    | Time that logs will be retained on AWS                 |
| INSTANCE_NAME     | Name of the EC2 instance                               |
| prefix            | Prefix to organize names on AWS                        |
| PUBLIC_KEY_SSH    | Key to connect to instance with SSH                    |
| EC2_USER          | Name of the user that will be created on your instance | 
| PRIVATE_KEY_PATH  | Path where your SSH private key is stored              | 


<br><br><br><br>
<h2 align="center">Breno Araripe</strong>
<h6 align="center">"Some people feel the rain. Others just get wet."</h4>

[![GitHub Badge](https://img.shields.io/badge/GitHub-100000?style=for-the-badge&logo=github&logoColor=white)](https://github.com/brenoma)
[![LinkedIn Badge](https://img.shields.io/badge/LinkedIn-0077B5?style=for-the-badge&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/brenoma)