FROM	ubuntu:14.04
RUN	git clone https://github.com/92434/cpuminer2
RUN	cd cpuminer && \
                ./autogen.sh && \
                ./configure CFLAGS="-O3" && \
                make
ADD	./init.sh /init.sh
RUN	apt-get update && apt-get install -y \
	automake \
	libcurl4-openssl-dev \
	git \
	make
CMD	["/init.sh"]
