FROM unixorn/debian-py3
LABEL maintainer="Joe Block <jpb@unixorn.net>"
LABEL description="pyvisio on debian buster-slim"
LABEL io.whalebrew.name 'pyvisio'
LABEL io.whalebrew.config.working_dir '$PWD'

RUN apt-get update && \
    apt-get install -y --no-install-recommends build-essential && \
    apt-get install -y apt-utils ca-certificates git python3-dev --no-install-recommends && \
		update-ca-certificates && \
		rm -fr /tmp/* /var/lib/apt/lists/*

RUN mkdir /src && \
  cd /src && \
  git clone https://github.com/vkorn/pyvizio.git

RUN  cd /src/pyvizio && \
  python3 setup.py install
  # pip3 install aiohttp[speedups] && \

ENTRYPOINT ["pyvizio"]
