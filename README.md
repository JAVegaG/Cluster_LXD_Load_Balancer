# **LXD Cluster + Load Balancer using HAProxy + JMeter in a Vagrant environment with fault management and backup servers.**

Load balancer implementation with the help of [HAProxy](www.haproxy.org/). Clients will send requests to the HAProxy load balancer and get responses from two web servers running in LXD containers.

## ** Requirements **

- The requests are not made directly to the web servers, but rather the load balancer will decide which server will be in charge of processing the request.
- Both servers will have only Apache running and HAProxy will be running on the load balancer.
- The load balancer GUI will be accessible from the host machine to view the status and detailed statistics of the web servers.
- Each Vagrant virtual machine must run at least one LXD container
- At least two LXD containers must run web servers
- HAProxy must run in a separate container
