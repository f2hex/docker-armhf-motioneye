FROM f2hex/armhf-motion:latest
MAINTAINER Franco Fiorese <franco.fiorese@gmail.com>

COPY . /

# create mount points and remove unused executables (from base image)
RUN mkdir -p /etc/motioneye /var/lib/motioneye /var/run/motioneye /var/log/motioneye && \
    rm -f /usr/bin/ffprobe /usr/bin/ffserver
# configuration files (motioneye needs to update config files)
VOLUME ["/etc/motioneye", "/var/run/motioneye", "/var/log/motioneye", "/var/lib/motioneye"]

CMD /usr/bin/meyectl startserver -c /etc/motioneye/motioneye.conf
EXPOSE 8765
