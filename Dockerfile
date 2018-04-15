FROM    jenkins/jenkins

# User root for installs
USER    root

RUN     curl -fsSLO https://download.docker.com/linux/static/stable/x86_64/docker-17.12.0-ce.tgz && \
        tar --strip-components=1 -xvzf docker-17.12.0-ce.tgz -C /usr/local/bin

RUN     mkdir -p /usr/share/jenkins/ref/plugins
# Keep plugins.txt up-to-date and use exact version numbers
COPY    plugins.txt /usr/share/jenkins/ref/plugins/plugins.txt
COPY    init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d/
RUN     chown -R jenkins:jenkins /usr/share/jenkins/ref/

RUN     mkdir -p /var/jenkins_home/jobs/jenkins/
COPY    seed-job/jenkins.xml /var/jenkins_home/jobs/jenkins/config.xml
RUN     chown -R jenkins:jenkins /var/jenkins_home

# Drop back to the regular jenkins user
USER    jenkins

# Install plugins if found in the plugins.txt
RUN     if [ -s /usr/share/jenkins/ref/plugins/plugins.txt ]; then /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins/plugins.txt; fi

User    root
