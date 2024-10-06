
# Heisig Helper

A simple web page built in Rails that parses a given Japanese sentence and breaks down each kanji into their radical components as they appear in James Heisig's Remembering the Kanji vol. I. The link allow you to copy the results into the clipboard.

## Screenshot
  
![image](https://github.com/user-attachments/assets/4168a3b7-8dd9-43c7-847b-7fb25d4be1d1)

## Setup

### Docker

First setup the database, and then run the container.

```
docker-compose run --rm app bin/rails db:setup
docker-compose up --build
```
If you need to run migrations:

```
docker-compose run --rm app bin/rails db:migrate
```

### Local

First, install Rails 7.2.1 and Ruby 3.3.5 and then execute the below commands in the project folder:

 ```
bundle install
rails db:setup
```

Run `rails s` to start the server.
  
## Usage

Simply paste a Japanese sentence with kanji to get some results!

## Deploying to AWS ECS (Fargate)

Set up AWS CLI on your machine before proceeding. First, build the Docker image.

```
docker build -t heisig-helper .
```

Authenticate with Elastic Container Registry.

```
aws ecr get-login-password --region YOUR_REGION | docker login --username AWS --password-stdin YOUR_ACCOUNT_ID.dkr.ecr.YOUR_REGION-region.amazonaws.com
```

Create a new registry for your container.

```
aws ecr create-repository --repository-name NEW_REGISTRY_NAME --region YOUR_REGION
```

Tag the docker image.

```
docker tag heisig-helper:latest YOUR_ACCOUNT.dkr.ecr.YOUR_REGION.amazonaws.com/your-repo-name:latest
```
Then, push the Docker image.

```
docker push your-account-id.dkr.ecr.your-region.amazonaws.com/NEW_REGISTRY_NAME:latest
```

The remainder of the steps can be completed in the Amazon ECS console.

Create the ECS Cluster:

1. Choose Clusters and then select Create Cluster.
2. Choose Networking only (AWS Fargate) and click Next. Alternatively, you can use an EC2 instance, but that will require more setup.
3. Give your cluster a name and click Create.

Create the Task Definition:

1. In the ECS Console, choose Task Definitions and then select Create new Task Definition.
2. Choose Fargate as the launch type and click Next.
3. Set any required environment variables here. Note that you will need to map to container port 80 if using Fargate. I recommend setting RAILSLOGTO_STDOUT to true so you can debug the Rails server output

Finally, create and run the task:

1. In the ECS Console, navigate to your cluster.
2. Choose the Tasks tab and click Create.
3. Select the task was we just defined

By default, the task will be accessible via a public IP address, so make sure that the security group you're using is accessible via port 80.