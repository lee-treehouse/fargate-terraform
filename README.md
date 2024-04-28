# fargate-terraform

docker build -t terraform-docker .

To initialize a new Terraform project, run the following command:

```shell

docker run --rm -v $(pwd):/terraform terraform-docker init

```

This command mounts the current directory as the `/terraform` directory inside the Docker container and runs the `init` command using the `terraform` entrypoint defined in the `Dockerfile`.

to plan and apply changes, use the following commands:

```shell

docker run --rm -v $(pwd):/terraform terraform-docker plan

docker run --rm -v $(pwd):/terraform -it terraform-docker apply

docker run --rm -v $(pwd):/terraform -it terraform-docker destroy


```
