# Innovatech Frontend

Frontend del sistema **Innovatech Chile**, desarrollado para la
Evaluación Parcial de la asignatura **Introducción a Herramientas
DevOps**.

La aplicación fue desarrollada utilizando **Vue + Vite** y desplegada
sobre **Amazon EKS (Kubernetes)**. El proceso de integración y
despliegue continuo se encuentra automatizado mediante **GitHub
Actions**, mientras que las imágenes Docker son almacenadas en **Amazon
Elastic Container Registry (ECR)**.

------------------------------------------------------------------------

# Tecnologías utilizadas

-   Vue.js
-   Vite
-   Docker
-   Nginx
-   Kubernetes
-   Amazon EKS
-   Amazon ECR
-   GitHub Actions
-   AWS Cloud

------------------------------------------------------------------------

# Características implementadas

-   Aplicación SPA desarrollada con Vue.
-   Contenedorización mediante Docker.
-   Servidor web Nginx.
-   Despliegue automático en Amazon EKS.
-   Pipeline CI/CD con GitHub Actions.
-   Imágenes almacenadas en Amazon ECR.
-   Service de tipo LoadBalancer.
-   Comunicación con los microservicios del Backend.
-   Gestión segura de credenciales mediante GitHub Secrets.

------------------------------------------------------------------------

# Arquitectura

El Frontend se ejecuta como un Deployment independiente dentro del
clúster de Kubernetes y es publicado mediante un Service de tipo
**LoadBalancer**, permitiendo el acceso público a la aplicación. La
comunicación con los microservicios de Ventas y Despachos se realiza
mediante los Services internos del clúster.

------------------------------------------------------------------------

# Pipeline CI/CD

El flujo automatizado realiza:

1.  Descarga del código desde GitHub.
2.  Construcción de la imagen Docker.
3.  Publicación de la imagen en Amazon ECR.
4.  Conexión al clúster Amazon EKS.
5.  Actualización automática del Deployment del Frontend.

------------------------------------------------------------------------

# Kubernetes

Recursos utilizados:

-   Deployment del Frontend.
-   Service tipo LoadBalancer.
-   Horizontal Pod Autoscaler (HPA).

Los manifiestos YAML se encuentran en la carpeta **k8s/**.

------------------------------------------------------------------------

# Ejecución local

``` bash
npm install
npm run build

docker build -t innovatech-frontend .
docker run -d -p 80:80 innovatech-frontend
```

------------------------------------------------------------------------

# Seguridad

-   GitHub Secrets para las credenciales de AWS.
-   Imágenes privadas en Amazon ECR.
-   Acceso público únicamente mediante LoadBalancer.
-   Comunicación interna con el Backend mediante Kubernetes Services.
-   Credenciales fuera del repositorio.

------------------------------------------------------------------------

# Estructura del proyecto

``` text
Frontend-deploy/
├── src/
├── public/
├── k8s/
│   ├── frontend-deployment.yaml
│   ├── frontend-service.yaml
│   └── hpa.yaml
├── .github/
│   └── workflows/
│       └── deploy-frontend.yml
├── Dockerfile
└── package.json
```

------------------------------------------------------------------------

# Integrantes

-   Fernanda Paredes

------------------------------------------------------------------------

# Asignatura

**ISY1101 - Introducción a Herramientas DevOps**
