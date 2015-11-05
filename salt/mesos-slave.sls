mesos-master:
  service.dead:
    - enable: False

mesos-slave:
  service.running:
    - enable: True
    - watch:
      - file: /etc/mesos/zk
      - file: /etc/mesos-slave/ip
      - file: /etc/mesos-slave/hostname

/etc/mesos/zk:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents: 192.168.255.10:5050

/etc/mesos-slave/ip:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents: {{ salt['grains.get']('ip4_interfaces:enp0s8', '') }}

/etc/mesos-slave/hostname:
  file.managed:
    - user: root
    - group: root
    - mode: 644
    - contents: {{ salt['grains.get']('ip4_interfaces:enp0s8', '') }}
