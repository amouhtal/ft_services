minikube delete
minikube start --vm-driver=virtualbox

#To point your shell to minikube's docker-daemon, run:
eval $(minikube docker-env)
#
docker build -t mysql       ./srcs/mysql/
docker build -t nginx       ./srcs/nginx
docker build -t ftps       	./srcs/ftps
docker build -t phpmyadmin  ./srcs/phpmyadmin/
docker build -t influxdb   	./srcs/influxdb/
docker build -t grafana		./srcs/grafana
docker build -t wordpress   ./srcs/wordpress/

kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/namespace.yaml
kubectl apply -f https://raw.githubusercontent.com/metallb/metallb/v0.9.5/manifests/metallb.yaml
# On first install only
kubectl create secret generic -n metallb-system memberlist --from-literal=secretkey="$(openssl rand -base64 128)"
#
kubectl apply -f ./srcs/yaml/metallb.yml
#

# 
kubectl apply -f ./srcs/yaml/nginx.yml
kubectl apply -f ./srcs/yaml/influxdb.yml
kubectl apply -f ./srcs/yaml/ftps.yml
kubectl apply -f ./srcs/yaml/mysql.yml
kubectl apply -f ./srcs/yaml/phpmyadmin.yml
kubectl apply -f ./srcs/yaml/grafana.yml
kubectl apply -f ./srcs/yaml/wordpress.yml
minikube dashboard