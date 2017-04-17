FROM buildpack-deps

# Install Node
RUN set -x \
    && curl -sL https://deb.nodesource.com/setup_7.x | bash - \
    && apt-get install -y \
        nodejs


# Install Chrome
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo 'deb http://dl.google.com/linux/chrome/deb/ stable main' > /etc/apt/sources.list.d/google.list
RUN set -x \
    && apt-get update \
    && apt-get install -y \
        xvfb \
        google-chrome-stable
ADD scripts/xvfb-chrome /usr/bin/xvfb-chrome
RUN ln -sf /usr/bin/xvfb-chrome /usr/bin/google-chrome
ENV CHROME_BIN /usr/bin/google-chrome

# Install npm dependencies
RUN npm i -g grunt-cli@1.2.0 \
    && npm i grunt@1.0.1 \
    && npm i grunt-babel@6.0.0 \
    && npm i grunt-contrib-concat@1.0.0 \
    && npm i grunt-file-append@0.0.7 \
    && npm i grunt-jsbeautifier@0.2.10 \
    && npm i grunt-karma@2.0.0 \
    && npm i grunt-html2js@0.3.8 \
    && npm i grunt-contrib-clean@1.0.0 \
    && npm i karma@1.5.0 \
    && npm i karma-chrome-launcher@2.0.0 \
    && npm i karma-jasmine@1.1.0 \
    && npm i jasmine-core@2.4.1 \
    && npm i babel-preset-es2015@6.6.0 \
    && npm i nunjucks@3.0.0 \
    && npm i chai@3.5.0 \
    && npm i mocha@3.2.0

# Clean npm cache
RUN npm cache clean