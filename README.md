# **Cluster LXD + Balanceador de carga usando HAProxy + JMeter en ambiente Vagrant con manejo de fallas y servidores de backup.**

Implementación de balanceador de carga con la ayuda de [HAProxy](www.haproxy.org/). Los clientes enviarán peticiones al balanceador de carga HAProxy y obtendrán respuestas desde dos servidores web corriendo en contenedores LXD.

## ** Requerimientos **

- Las peticiones no se realizan directamente a los servidores web, sino que el balanceador de carga decidirá que servidor será el encargado de procesar la petición.
- Los dos servidores tendrán solo apache corriendo y en el balanceador de carga se ejecutará HAProxy.
- La GUI del balanceador de carga será accesible desde la máquina anfitriona para visualizar el estado y estadísticas detalladas de los servidores web.
- Cada máquina virtual Vagrant debe correr al menos un contenedor LXD
- Al menos dos contenedores LXD deben correr servidores web
- HAProxy debe correr en un contenedor separado
