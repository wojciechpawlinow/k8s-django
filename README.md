# Kubernetes Python/Django config
This is a basic configuration of Django application deployment, easy adaptable to any medium project.  

Technology stack considers **Django** server application + **Celery** worker + **RabbitMQ** broker. 

* _docker/_ - Dockerfiles
* _kubernetes/config/_ - configuration
* _kubernetes/deploy.sh_ - basic script for updating your code with new version. Obviously not directly, it needs to authenticate to cloud provider. Should be included in continuous delivery process.

Configuration need some adjustments and replacements.
