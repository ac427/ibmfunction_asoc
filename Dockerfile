FROM anantac/ibmfunction_bionic

ENV    PATH="/usr/local/saclient/bin:${PATH}"

COPY requirements.txt /tmp/requirements.txt

RUN apt-get update && apt-get install -y \
        unzip \
        && rm -rf /var/lib/apt/lists/* \
        && pip3 install --no-cache-dir -r /tmp/requirements.txt \
        &&  curl -o saclient.zip -sL "https://cloud.appscan.com/api/SCX/StaticAnalyzer/SAClientUtil?os=linux" \
        &&  unzip saclient.zip && rm -rf saclient.zip && mv SAClientUtil* /usr/local/saclient
