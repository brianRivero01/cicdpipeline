#Autenticacion Amazon ECR 
aws ecr get-login-password --region us-east-2 | docker login --username AWS --password-stdin brian_r

#Crear un repositorio
aws ecr create-repository --repository-name pipeline-repository 
    
#Envio de img a repositorio
docker tag jenkins/jenkins:alpine brian_r.dkr.ecr.us-east-2.amazonaws.com/pipeline-repository
docker push brian_r.dkr.ecr.us-east-2.amazonaws.com/pipeline-repository

#Desokiegue 
sam build
sam deploy --stack-name sam-app --region us-east-2 --capabilities CAPABILITY_IAM




