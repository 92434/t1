FROM	ubuntu:14.04
RUN	apt-get update && apt-get install -y git
RUN	git clone https://github.com/pooler/cpuminer.git
RUN	cd cpuminer && \
                ./autogen.sh && \
                ./configure CFLAGS="-O3" && \
                make
ADD	./init.sh /init.sh
RUN	apt-get update && apt-get install -y \
	automake \
	libcurl4-openssl-dev \
	make
CMD	["/init.sh"]
