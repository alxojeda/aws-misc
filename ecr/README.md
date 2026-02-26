
## Login hacia ECR
```
aws ecr get-login-password --region us-east-1 | docker login   --username AWS   --password-stdin <id-cuenta>.dkr.ecr.us-east-1.amazonaws.com
```

## Crear repositorio
```
aws ecr create-repository --repository-name mi-app-env --region us-east-1
```

## Subir imagen
```
docker push <id-cuenta>.dkr.ecr.us-east-1.amazonaws.com/mi-app-env
```
