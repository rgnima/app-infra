## Proyecto Final: Todo-List App con Enfoque DevOps

## Despliegue de Infraestructura con Terrafom y github Actions
### Descripción
Este repositorio contiene los archivos terrafom y configuración necesaria para el despliegue de un AKS en azure, sobre el cual se despliega la aplicación, base de datos y los componentes de monitoreo (prometheus y grafana)
El despliegue del AKS se gatilla con github actions al hacer merge a la rama main.
## Descripción de Archivos
### main.tf
Es el archivo principal que contiene el resource AKS en con nombre **aksrgnima**
## terraform.tf
Contiene los provider necesarios para que terraform pueda desplegar recursos en azure
### Variables
En este archivo se indica el resource group y la región en los cuales se desplegará el AKS.
### .github/workflows/terraform.yaml
Es el action que gatilla la creación/eliminación del AKS
En este archivo se definen las variables de entorno necesarias como el storage account y container previamente creados manualmente para el resguardo del tfstate o también llamado backend. Asi también hace referencia a secretos utilizados por el extension, creados para la conexión hacia azure, básicamente son datos del service principal (clientID y ClientSecret), tenant y suscripción sobre los cuales se creará el AKS.
El service principal utilizado tiene asignado el rol de contributor sobre la suscripción, esto con la finalidad de que se le permita crear recursos.
El action contiene las fases de despliegue de la infraestructura:
- Init
- Plan
- Apply
- Destroy

Se utiliza el flujo gitflow, los cambios se aplican automáticamente al aprobar el merge a la rama main