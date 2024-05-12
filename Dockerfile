
FROM hashicorp/terraform:latest  

RUN apk add --no-cache jq bash curl aws-cli

WORKDIR /terraform  

COPY . .  

ENTRYPOINT ["bash", "-c"]