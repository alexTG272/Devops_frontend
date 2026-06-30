Frontend - Innovatech Chile
Este repositorio contiene el frontend del sistema Innovatech Chile, desarrollado como parte de la Evaluación Parcial de la asignatura Introducción a Herramientas DevOps.

El proyecto está construido con Vue.js y Vite, garantizando un entorno de desarrollo rápido y optimizado. Su infraestructura y ciclo de vida se basan en prácticas modernas de DevOps:

CI/CD: El flujo de integración y despliegue continuo está completamente automatizado mediante GitHub Actions.

Registro de Contenedores: Las imágenes Docker generadas se almacenan de forma segura en Amazon ECR.

Despliegue: La aplicación está orquestada y alojada en la nube sobre Amazon EKS (Kubernetes).

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


# Seguridad

-   GitHub Secrets para las credenciales de AWS.
-   Imágenes privadas en Amazon ECR.
-   Acceso público únicamente mediante LoadBalancer.
-   Comunicación interna con el Backend mediante Kubernetes Services.
-   Credenciales fuera del repositorio.

------------------------------------------------------------------------


# Asignatura

**ISY1101 - Introducción a Herramientas DevOps**
