FROM    jenkins/jenkins:latest

# User root for installs
USER    root

# Keep plugins.txt up-to-date and use exact version numbers
RUN     mkdir -p /usr/share/jenkins/ref/plugins
COPY    plugins.txt /usr/share/jenkins/ref/plugins/plugins.txt
RUN     chown -R jenkins:jenkins /usr/share/jenkins/ref/plugins

# Drop back to the regular jenkins user - good practice
USER    jenkins

# Install plugins if found in the plugins.txt
RUN     if [ -s /usr/share/jenkins/ref/plugins/plugins.txt ]; then xargs /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins/plugins.txt; fi

COPY    init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d/

USER    root
RUN     chown -R jenkins /usr/share/jenkins/ref/init.groovy.d/
USER    jenkins
