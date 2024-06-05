### Basic Networking Concepts

1. **What is the difference between TCP and UDP?**

    - **Answer**: TCP (Transmission Control Protocol) is connection-oriented and ensures reliable data transmission with error checking and flow control. UDP (User Datagram Protocol) is connectionless and does not guarantee delivery, making it faster but less reliable.

2. **Explain the OSI model and its layers.**

    - **Answer**: The OSI model has seven layers: Physical, Data Link, Network, Transport, Session, Presentation, and Application. Each layer has specific functions, like routing (Network layer), data transmission (Physical layer), and establishing connections (Transport layer).

3. **What is an IP address and how is it structured?**
    - **Answer**: An IP address is a unique identifier for a device on a network. IPv4 addresses are 32-bit numbers divided into four octets, while IPv6 addresses are 128-bit numbers represented in hexadecimal format.

### Network Configuration

4. **How do you configure a network interface in Linux?**

    - **Answer**: Network interfaces can be configured using tools like `ifconfig`, `ip`, or by editing configuration files.
        ```sh
        sudo ifconfig eth0 192.168.1.100 netmask 255.255.255.0 up
        sudo ip addr add 192.168.1.100/24 dev eth0
        ```

5. **How do you set a static IP address on a Linux system?**
    - **Answer**: Edit the network configuration file for your distribution (e.g., `/etc/network/interfaces` on Debian/Ubuntu or `/etc/sysconfig/network-scripts/ifcfg-eth0` on CentOS/RHEL).
        ```sh
        # Debian/Ubuntu example
        auto eth0
        iface eth0 inet static
          address 192.168.1.100
          netmask 255.255.255.0
          gateway 192.168.1.1
        ```

### Network Troubleshooting

6. **How do you check network connectivity in Linux?**

    - **Answer**: Use commands like `ping`, `traceroute`, and `curl`.
        ```sh
        ping google.com
        traceroute google.com
        curl -I http://example.com
        ```

7. **How do you diagnose and fix DNS resolution issues?**
    - **Answer**: Check `/etc/resolv.conf` for correct DNS

server entries, use `dig` or `nslookup` to query DNS servers, and verify network settings.

```sh
cat /etc/resolv.conf
dig example.com
nslookup example.com
```

8. **How do you find which process is using a specific port?**
    - **Answer**: Use the `netstat`, `ss`, or `lsof` commands to find the process.
    ```sh
    sudo netstat -tulnp | grep :80
    sudo ss -tulnp | grep :80
    sudo lsof -i :80
    ```

### Network Services and Tools

9. **How do you configure and manage a firewall in Linux?**

    - **Answer**: Use `iptables` or `firewalld` (CentOS/RHEL) and `ufw` (Ubuntu).

    ```sh
    sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
    sudo ufw allow 22/tcp
    sudo firewall-cmd --add-service=ssh --permanent
    sudo firewall-cmd --reload
    ```

10. **What is a VLAN and how do you configure it in Linux?**
    - **Answer**: A VLAN (Virtual LAN) segregates network traffic for better security and performance. Use the `ip` command to create and manage VLANs.
    ```sh
    sudo ip link add link eth0 name eth0.10 type vlan id 10
    sudo ip addr add 192.168.10.1/24 dev eth0.10
    sudo ip link set up eth0.10
    ```

### Network Security

11. **How do you secure SSH access on a Linux server?**

    -   **Answer**: Change the default port, disable root login, use key-based authentication, and configure firewall rules.

    ```sh
    sudo vim /etc/ssh/sshd_config
    # Change Port 22 to another port
    # PermitRootLogin no
    sudo systemctl restart sshd
    ```

12. **Explain the purpose and basic setup of a VPN.**
    -   **Answer**: A VPN (Virtual Private Network) creates a secure tunnel over the internet, protecting data and masking IP addresses. Use tools like `OpenVPN` or `WireGuard` to set up a VPN.
    ```sh
    sudo apt install openvpn
    sudo openvpn --config client.ovpn
    ```

### Advanced Topics

13. **What is a subnet mask and how do you calculate subnets?**

    -   **Answer**: A subnet mask divides the IP address into network and host portions. Calculate subnets by understanding binary representation and performing bitwise operations.

    ```sh
    # For example, 255.255.255.0 is a /24 subnet mask.
    # Use tools like `ipcalc` to calculate subnets.
    ipcalc 192.168.1.0/24
    ```

14. **How do you monitor network traffic in real-time?**
    -   **Answer**: Use tools like `tcpdump`, `iftop`, or `wireshark`.
    ```sh
    sudo tcpdump -i eth0
    sudo iftop -i eth0
    sudo wireshark
    ```

### Practical Scenarios

15. **How do you set up a basic web server in Linux?**

    -   **Answer**: Install and configure `Apache` or `Nginx`.

    ```sh
    sudo apt install apache2
    sudo systemctl start apache2
    sudo systemctl enable apache2
    # For Nginx
    sudo apt install nginx
    sudo systemctl start nginx
    sudo systemctl enable nginx
    ```

16. **Explain how to set up and use SSH tunneling.**
    -   **Answer**: SSH tunneling forwards traffic securely over an SSH connection.
    ```sh
    # Local port forwarding
    ssh -L local_port:destination_server:remote_port user@ssh_server
    # Remote port forwarding
    ssh -R remote_port:local_server:local_port user@ssh_server
    ```

### Conceptual Questions

17. **What are the advantages and disadvantages of using IPv6 over IPv4?**

    -   **Answer**: IPv6 offers a larger address space, improved security features, and better support for mobile devices. However, it may have compatibility issues with legacy systems.

18. **Explain the difference between a hub, a switch, and a router.**
    -   **Answer**: A hub broadcasts data to all devices, a switch sends data to the specific device based on MAC addresses, and a router forwards data between different networks using IP addresses.

### Final Tips

-   **Stay Updated**: Networking technologies and tools evolve. Stay current with new trends and practices.
-   **Practical Experience**: Hands-on experience with configuring and troubleshooting network setups is invaluable.
-   **Scenario-Based Questions**: Be prepared to solve real-world problems or explain steps you would take to address specific networking issues.

By understanding these topics and being able to articulate your knowledge clearly, you'll be well-prepared for network-related questions in a Linux interview.
