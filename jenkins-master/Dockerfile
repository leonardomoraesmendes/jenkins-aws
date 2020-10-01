FROM jenkinsci/blueocean
USER root
RUN apk add --no-cache \
        python3 \
        py3-pip \
        git \
    && pip3 install --upgrade pip \
    && pip3 install \
        awscli \
    && rm -rf /var/cache/apk/*

RUN git clone https://github.com/tfutils/tfenv.git ~/.tfenv

ENV PATH="/root/.tfenv/bin:${PATH}"