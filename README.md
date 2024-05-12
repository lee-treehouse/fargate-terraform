# fargate-terraform

build image
`docker build -t terraform-docker .`

run container (bash entrypoint)
`docker run --rm -v $(pwd):/terraform -it terraform-docker`

# set env vars in container

```
export AWS_ACCOUNT_ID=
export AWS_SECRET_ACCESS_KEY=
export AWS_ACCESS_KEY_ID=
```

cd into relevant folder then
run terraform commands eg `terraform plan` `terraform destroy`
