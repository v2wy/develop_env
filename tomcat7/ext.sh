echo "-----------install ant----------"
apk update \
&& apk add --no-cache curl tar bash \
&& mkdir -p /usr/local/ant \
&& curl -fsSL -o /tmp/apache-ant.tar.gz ${BASE_URL} \
&& sha512sum /tmp/apache-ant.tar.gz \
&& tar -xzf /tmp/apache-ant.tar.gz -C /usr/local/ant --strip-components=1 \
&& rm -f /tmp/apache-ant.tar.gz \
&& ln -s /usr/local/ant/bin/ant /usr/bin/ant