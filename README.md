# Innovatech Chile - Sistema de Despachos y Ventas

## Descripción del Proyecto
Este repositorio contiene la implementación de un entorno productivo en la nube (AWS) para el sistema de Despachos y Ventas de **Innovatech Chile**. El proyecto orquesta una arquitectura de microservicios compuesta por un frontend y dos servicios backend, garantizando alta disponibilidad, escalabilidad automatizada y un flujo continuo de integración y despliegue (CI/CD).

## Tecnologías Utilizadas
* **Frontend:** Vue.js servido a través de Nginx.
* **Backend:** Java Spring Boot (Microservicios de Despachos y Ventas).
* **Base de Datos:** MySQL.
* **Contenedorización:** Docker (Builds multi-stage).
* **Proveedor Cloud:** AWS (Amazon Web Services).
* **Orquestación de Contenedores:** Amazon EKS (Elastic Kubernetes Service) en la región `us-east-1`.
* **Registro de Imágenes:** Amazon ECR (Elastic Container Registry) cifrado con AES-256.
* **CI/CD:** GitHub Actions.
* **Infraestructura como Código:** Manifiestos de Kubernetes (Deployments, Services, HPA).

##  Arquitectura y Pasos Realizados

### 1. Construcción de Imágenes Docker
Se desarrollaron `Dockerfiles` independientes utilizando la estrategia de **multi-stage builds** para separar la etapa de compilación de la imagen final.
* **Componentes:** Frontend (Vue.js + Nginx), Backend Despachos (Spring Boot) y Backend Ventas (Spring Boot).
* **Beneficios:** Reducción del tamaño de la imagen final y minimización de la superficie de ataque.

### 2. Almacenamiento Seguro en Amazon ECR
Las imágenes construidas se almacenaron de forma segura en tres repositorios privados dentro de Amazon ECR:
* `eksfrontend`
* `eksdespacho`
* `eksventas`
El acceso a estos repositorios está estrictamente controlado mediante políticas de IAM y las imágenes se encuentran cifradas utilizando AES-256.

### 3. Despliegue en el Clúster de Kubernetes (AWS EKS)
Se configuró y desplegó la infraestructura en un clúster de Amazon EKS, resultando en un total de 7 Pods en estado *Running*:
* **Frontend:** 2 réplicas (Accesible públicamente a través de un Load Balancer).
* **Microservicio Despachos:** 2 réplicas.
* **Microservicio Ventas:** 2 réplicas.
* **Base de Datos:** 1 réplica de MySQL.

### 4. Autoescalado (Horizontal Pod Autoscaler - HPA)
Para asegurar el rendimiento óptimo ante fluctuaciones en la carga de trabajo, se implementó autoescalado dinámico (HPA) para los tres servicios (frontend, despachos y ventas) con la siguiente configuración:
* **Umbral de uso de CPU:** 70%.
* **Rango de escalado:** Entre 2 y 5 réplicas.

### 5. Pipeline CI/CD Automatizado
Se automatizó todo el flujo de entrega utilizando **GitHub Actions**. Se crearon dos workflows (uno para el repositorio frontend y otro para el backend) que se ejecutan automáticamente tras cada `commit` a la rama `main`. El pipeline realiza:
1.  **Build:** Construcción de las imágenes Docker.
2.  **Push:** Autenticación y subida de imágenes a Amazon ECR.
3.  **Deploy:** Despliegue automatizado de las nuevas versiones en el clúster EKS.

## Instrucciones de Uso y Accesibilidad

1.  **Acceso a la Aplicación:** El sistema es accesible para los usuarios finales mediante la URL pública del Load Balancer asociado al servicio Frontend.
2.  **Gestión y Monitoreo del Clúster (Para Administradores):**
    * Asegúrese de contar con las herramientas CLI necesarias instaladas: `aws`, `kubectl` y `docker`.
    * Actualice su configuración local para interactuar con el clúster:
        ```bash
        aws eks update-kubeconfig --region us-east-1 --name <nombre-del-cluster>
        ```
    * **Verificar pods:** `kubectl get pods`
    * **Verificar autoescalado:** `kubectl get hpa`

## Conclusión
La implementación final cumple exitosamente con los requerimientos de orquestación productiva: configuración de clúster EKS estable, despliegues funcionales desde ECR, autoescalado activo y un pipeline CI/CD optimizado que facilita la integración y liberación continua de los servicios.

Aqui se ecnuentra un archivo que contiene todas las evidencias y capturas del proyecto [EP3_Encargo_Evidencias.docx](https://github.com/user-attachments/files/29529308/EP3_Encargo_Evidencias.docx)


# Asignatura

**ISY1101 - Introducción a Herramientas DevOps**

# Integrantes

Alexander Torres 
Benjamin Quezada
