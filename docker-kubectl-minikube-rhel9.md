# 🧩 General topic for minikube

line for follow https://www.linuxtechi.com/how-to-install-minikube-on-rhel/

## 1 install minikube in rhel 9 wmare
# Install Minikube on RHEL9

This guide provides a complete step-by-step process to install **Docker**, **kubectl**, and **Minikube** on **RHEL 9**.

---

## Step 1: Enable Docker Repository

Enable the official Docker repository:

```bash
sudo dnf config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
```

---

## Step 2: Install Docker

Install Docker CE and related dependencies:

```bash
sudo dnf install docker-ce --nobest -y
```

Example output:

```
Dependencies resolved.
Installing:
 docker-ce                  x86_64   3:23.0.1-1.el9       docker-ce-stable   23 M
Installing dependencies:
 containerd.io              x86_64   1.6.18-3.1.el9       docker-ce-stable   32 M
 docker-ce-cli              x86_64   1:23.0.1-1.el9       docker-ce-stable  7.0 M
 docker-ce-rootless-extras  x86_64   23.0.1-1.el9         docker-ce-stable  3.8 M
 docker-buildx-plugin       x86_64   0.10.2-1.el9         docker-ce-stable   12 M
 docker-compose-plugin      x86_64   2.16.0-1.el9         docker-ce-stable   11 M
 docker-scan-plugin         x86_64   0.23.0-3.el9         docker-ce-stable  3.8 M
```

---

## Step 3: Start and Enable Docker

Start and enable the Docker service:

```bash
sudo systemctl start docker
sudo systemctl enable docker
```

Verify Docker is running:

```bash
sudo systemctl status docker
```

Expected output:

```
● docker.service - Docker Application Container Engine
     Loaded: loaded (/usr/lib/systemd/system/docker.service; enabled; vendor preset: disabled)
     Active: active (running)
```

---

## Step 4: Install `kubectl`

You can install `kubectl` in two ways.

### Method 1: Using Kubernetes Repository

Create the repo file:

```bash
sudo vim /etc/yum.repos.d/kubernetes.repo
```

Add the following content:

```
[kubernetes]
name=Kubernetes
baseurl=https://packages.cloud.google.com/yum/repos/kubernetes-el7-x86_64
enabled=1
gpgcheck=1
repo_gpgcheck=1
gpgkey=https://packages.cloud.google.com/yum/doc/yum-key.gpg https://packages.cloud.google.com/yum/doc/rpm-package-key.gpg
exclude=kubelet kubeadm kubectl
```

Install `kubectl`:

```bash
sudo dnf install -y kubectl --nobest
```

### Method 2: Using Binary

```bash
sudo curl -LO "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl"
sudo install -o root -g root -m 0755 kubectl /usr/local/bin/kubectl
```

Verify installation:

```bash
kubectl version --output=yaml
```

Example output:

```
clientVersion:
  gitVersion: v1.26.2
  goVersion: go1.19.6
  platform: linux/amd64
```

---

## Step 5: Install Minikube

### Download Minikube

```bash
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo chmod +x minikube-linux-amd64
sudo mv minikube-linux-amd64 /usr/local/bin/minikube
```

---

### Start Minikube

```bash
minikube start
```

Example output:

```
😄  minikube v1.29.0 on Redhat 9.1 (kvm/amd64)
✨  Automatically selected the podman driver
👍  Starting control plane node minikube
🏄  Done! kubectl is now configured to use "minikube" cluster
```

---

### Verify Installation

```bash
kubectl cluster-info
```

Expected output:

```
Kubernetes control plane is running at https://192.168.49.2:8443
CoreDNS is running at https://192.168.49.2:8443/api/v1/namespaces/kube-system/services/kube-dns:dns/proxy
```

---

## Step 6: Access Kubernetes Dashboard

Launch the Kubernetes Dashboard:

```bash
minikube dashboard
```

This command starts a proxy and opens the dashboard in your browser.

---

## Best Practices

* Keep Minikube and Docker versions up to date.
* Use a dedicated namespace for your experiments.
* Apply resource limits to control CPU/memory usage.
* Use persistent storage for data durability.
* Avoid using Minikube in production environments.

---

**✅ You have successfully installed Docker, kubectl, and Minikube on RHEL9.**


---

## 2 how to access minikube dashword outside or the vm 
```
[vivek@localhost ~]$ kubectl get services -n kubernetes-dashboard
NAME                        TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)    AGE
dashboard-metrics-scraper   ClusterIP   10.111.145.236   <none>        8000/TCP   6m21s
kubernetes-dashboard        ClusterIP   10.110.199.175   <none>        80/TCP     6m21s

[vivek@localhost ~]$ kubectl patch svc kubernetes-dashboard -n kubernetes-dashboard -p '{"spec": {"type": "NodePort"}}'
service/kubernetes-dashboard patched
[vivek@localhost ~]$ kubectl get services -n kubernetes-dashboard                                        NAME                        TYPE        CLUSTER-IP       EXTERNAL-IP   PORT(S)        AGE
dashboard-metrics-scraper   ClusterIP   10.111.145.236   <none>        8000/TCP       6m56s
kubernetes-dashboard        NodePort    10.110.199.175   <none>        80:32646/TCP   6m56s

[vivek@localhost ~]$ ip addr show
>
[vivek@localhost ~]$ sudo firewall-cmd --permanent --add-port=32646/tcp
success
[vivek@localhost ~]$ sudo firewall-cmd --reload

[vivek@localhost ~]$ sudo systemctl status firewalld
if it si running stop this 

[vivek@localhost ~]$ sudo systemctl stop firewalld
[vivek@localhost ~]$ kubectl proxy --address='192.168.19.135' --port=8001 --accept-hosts='.*'

hit this url http://192.168.19.135:8001/api/v1/namespaces/kubernetes-dashboard/services/http:kubernetes-dashboard:/proxy/


 
```













