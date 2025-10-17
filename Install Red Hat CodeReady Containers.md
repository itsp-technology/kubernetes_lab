# 🧩 Install Red Hat CodeReady Containers (CRC) on VMware (Windows Host)

## 🖥️ System Requirements

| Component | Requirement |
|------------|--------------|
| **Operating System** | Windows 10 / 11 (64-bit) |
| **Virtualization Platform** | VMware Workstation / VMware Player |
| **Disk Space** | Minimum **100 GB** free space |
| **Memory (RAM)** | Minimum **12 GB** |
| **vCPUs** | Minimum **8 vCPUs** |
| **Internet Connection** | Required for CRC setup and OpenShift cluster pull secrets |

---

## ⚙️ Step 1: Install VMware

1. Download and install **VMware Workstation** or **VMware Player**.
2. Enable virtualization in your BIOS/UEFI (Intel VT-x / AMD-V).
3. Create a **RHEL 9** or **Fedora** virtual machine with:
   - 8 vCPUs  
   - 12 GB RAM  
   - 100 GB Disk  

---

## 📦 Step 2: Download CRC

Open your terminal inside the VM (RHEL or Fedora):
```
# Download CRC
 wget https://developers.redhat.com/content-gateway/rest/mirror/pub/openshift-v4/clients/crc/latest/crc-linux-amd64.tar.xz

# Extract and install
tar -xvf crc-linux-amd64.tar.xz
sudo cp crc-linux-*-amd64/crc /usr/local/bin/

# Setup and start
crc setup
crc start
```
---
#execution logs or installing logs
```
# CRC Installation Log - RHEL on VMware (Windows Host)
### Date: October 16, 2025
### User: vivek

```bash
[vivek@localhost ~]$ tar -xvf crc-linux-amd64.tar.xz
crc-linux-2.55.0-amd64/
crc-linux-2.55.0-amd64/LICENSE
crc-linux-2.55.0-amd64/crc

[vivek@localhost ~]$ ll
total 36348
drwxr-xr-x. 2 vivek vivek       32 Oct  6 12:37 crc-linux-2.55.0-amd64
-rw-r--r--. 1 vivek vivek 37218688 Oct  9 03:58 crc-linux-amd64.tar.xz
drwxr-xr-x. 2 vivek vivek        6 Oct 16 00:05 Desktop
drwxr-xr-x. 2 vivek vivek        6 Oct 16 00:05 Documents
drwxr-xr-x. 2 vivek vivek        6 Oct 16 00:05 Downloads
drwxr-xr-x. 2 vivek vivek        6 Oct 16 00:05 Music
drwxr-xr-x. 2 vivek vivek        6 Oct 16 00:05 Pictures
drwxr-xr-x. 2 vivek vivek        6 Oct 16 00:05 Public
drwxr-xr-x. 2 vivek vivek        6 Oct 16 00:05 Templates
drwxr-xr-x. 2 vivek vivek        6 Oct 16 00:05 Videos

[vivek@localhost ~]$ sudo cp crc-linux-*-amd64/crc /usr/local/bin/
[sudo] password for vivek: 

[vivek@localhost ~]$ crc version
CRC version: 2.55.0+5be569
OpenShift version: 4.19.13
MicroShift version: 4.19.7

[vivek@localhost ~]$ crc setup
CRC is constantly improving and we would like to know more about usage (more details at https://developers.redhat.com/article/tool-data-collection)
Your preference can be changed manually if desired using 'crc config set consent-telemetry <yes/no>'
Would you like to contribute anonymous usage statistics? [y/N]: y
Thanks for helping us! You can disable telemetry with the command 'crc config set consent-telemetry no'.
INFO Using bundle path /home/vivek/.crc/cache/crc_libvirt_4.19.13_amd64.crcbundle 
INFO Checking if running as non-root              
INFO Checking if running inside WSL2              
INFO Checking if crc-admin-helper executable is cached 
INFO Caching crc-admin-helper executable          
INFO Using root access: Changing ownership of /home/vivek/.crc/bin/crc-admin-helper-linux-amd64 
INFO Using root access: Setting suid for /home/vivek/.crc/bin/crc-admin-helper-linux-amd64 
INFO Checking if running on a supported CPU architecture 
INFO Checking if crc executable symlink exists    
INFO Creating symlink for crc executable          
INFO Checking minimum RAM requirements            
INFO Check if Podman binary exists in: /home/vivek/.crc/bin/oc 
INFO Checking if Virtualization is enabled        
INFO Checking if KVM is enabled                   
INFO Checking if libvirt is installed             
INFO Installing libvirt service and dependencies  
INFO Using root access: Installing virtualization packages 
INFO Checking if user is part of libvirt group    
INFO Adding user to libvirt group                 
INFO Using root access: Adding user to the libvirt group 
INFO Checking if active user/process is currently part of the libvirt group 
INFO Checking if libvirt daemon is running        
WARN No active (running) libvirtd systemd unit could be found - make sure one of libvirt systemd units is enabled so that it's autostarted at boot time. 
INFO Starting libvirt service                     
INFO Using root access: Executing systemctl daemon-reload command 
INFO Using root access: Executing systemctl start libvirtd 
INFO Checking if a supported libvirt version is installed 
INFO Checking if crc-driver-libvirt is installed  
INFO Installing crc-driver-libvirt                
INFO Checking crc daemon systemd service          
INFO Setting up crc daemon systemd service        
INFO Checking crc daemon systemd socket units     
INFO Setting up crc daemon systemd socket units   
INFO Checking if vsock is correctly configured    
INFO Setting up vsock support                     
INFO Using root access: Setting CAP_NET_BIND_SERVICE capability for /usr/local/bin/crc executable 
INFO Using root access: Creating udev rule for /dev/vsock 
INFO Using root access: Changing permissions for /etc/udev/rules.d/99-crc-vsock.rules to 644  
INFO Using root access: Reloading udev rules database 
INFO Using root access: Loading vhost_vsock kernel module 
INFO Using root access: Creating file /etc/modules-load.d/vhost_vsock.conf 
INFO Using root access: Changing permissions for /etc/modules-load.d/vhost_vsock.conf to 644  
INFO Checking if CRC bundle is extracted in '$HOME/.crc' 
INFO Checking if /home/vivek/.crc/cache/crc_libvirt_4.19.13_amd64.crcbundle exists 
INFO Getting bundle for the CRC executable        
INFO Downloading bundle: /home/vivek/.crc/cache/crc_libvirt_4.19.13_amd64.crcbundle... 
6.40 GiB / 6.40 GiB [--------------------------------------------------------------------------] 100.00% 1.86 MiB/s
INFO Uncompressing /home/vivek/.crc/cache/crc_libvirt_4.19.13_amd64.crcbundle 
crc.qcow2:  22.04 GiB / 22.04 GiB [-----------------------------------------------------------------------] 100.00%
oc:  177.78 MiB / 177.78 MiB [----------------------------------------------------------------------------] 100.00%
Your system is correctly setup for using CRC. Use 'crc start' to start the instance

[vivek@localhost ~]$ crc start
INFO Using bundle path /home/vivek/.crc/cache/crc_libvirt_4.19.13_amd64.crcbundle 
INFO Checking if running as non-root              
INFO Checking if running inside WSL2              
INFO Checking if crc-admin-helper executable is cached 
INFO Checking if running on a supported CPU architecture 
INFO Checking if crc executable symlink exists    
INFO Checking minimum RAM requirements            
INFO Check if Podman binary exists in: /home/vivek/.crc/bin/oc 
INFO Checking if Virtualization is enabled        
INFO Checking if KVM is enabled                   
INFO Checking if libvirt is installed             
INFO Checking if user is part of libvirt group    
INFO Checking if active user/process is currently part of the libvirt group 
INFO Checking if libvirt daemon is running        
INFO Checking if a supported libvirt version is installed 
INFO Checking if crc-driver-libvirt is installed  
INFO Checking crc daemon systemd socket units     
INFO Checking if vsock is correctly configured    
INFO Loading bundle: crc_libvirt_4.19.13_amd64... 
CRC requires a pull secret to download content from Red Hat.
You can copy it from the Pull Secret section of https://console.redhat.com/openshift/create/local.
? Please enter the pull secret ************************************************************************************
INFO Creating CRC VM for OpenShift 4.19.13...     
INFO Generating new SSH key pair...               
INFO Generating new password for the kubeadmin user 
INFO Starting CRC VM for openshift 4.19.13...     
INFO CRC instance is running with IP 127.0.0.1    

INFO CRC VM is running                            
INFO Updating authorized keys...                  
INFO Configuring shared directories               
INFO Check internal and public DNS query...       
INFO Check DNS query from host...                 
INFO Verifying validity of the kubelet certificates... 
INFO Starting kubelet service                     
INFO Waiting for kube-apiserver availability... [takes around 2min] 
INFO Adding user's pull secret to the cluster...  
INFO Updating SSH key to machine config resource... 
INFO Overriding password for developer user       
INFO Changing the password for the users          
INFO Updating cluster ID...                       
INFO Updating root CA cert to admin-kubeconfig-client-ca configmap... 
```
## 📦 : CONNECT WMARE WITH MOBOA 
GET THE ID OF YOUR WMARE 
$ ip a 

Access via MobaXterm

Open MobaXterm → Session → SSH.

Remote host: 192.168.19.133

Port: 22

Username: vivek

Password: your RHEL VM password

Click OK → Connect

You will now have a terminal into your VM.








