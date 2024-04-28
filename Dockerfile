
FROM hashicorp/terraform:latest  

WORKDIR /terraform  

COPY . .  

ENTRYPOINT ["sleep", "9999"]