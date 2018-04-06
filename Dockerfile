FROM    jenkins/jenkins

# User root for installs
USER    root

RUN     mkdir -p /usr/share/jenkins/ref/plugins
# Keep plugins.txt up-to-date and use exact version numbers
COPY    plugins.txt /usr/share/jenkins/ref/plugins/plugins.txt
RUN     chown -R jenkins:jenkins /usr/share/jenkins/ref/plugins
COPY    init.groovy.d/ /usr/share/jenkins/ref/init.groovy.d/
RUN     chown -R jenkins:jenkins /usr/share/jenkins/ref/init.groovy.d/
COPY    seed-jobs/ /usr/share/jenkins/ref/seed-jobs/
RUN     chown -R jenkins /usr/share/jenkins/ref/seed-jobs/

# Drop back to the regular jenkins user
USER    jenkins

# Install plugins if found in the plugins.txt
RUN     if [ -s /usr/share/jenkins/ref/plugins/plugins.txt ]; then /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins/plugins.txt; fi
