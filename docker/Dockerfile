FROM fedora:28

# This container comes with a preset fake email/name in git config.
# This is needed to allow cherry-picking patches from gerrit (git review -x ####).

RUN	dnf -y update && \
	dnf -y install \
		bash-completion colordiff diffstat man tig vim \
		\
		make gcc gcc-c++ lcov pkgconfig \
		libedit-devel jansson-devel libuuid-devel sqlite-devel libxml2-devel \
		speex-devel speexdsp-devel libogg-devel libvorbis-devel alsa-lib-devel portaudio-devel libcurl-devel xmlstarlet bison flex \
		postgresql-devel unixODBC-devel neon-devel gmime-devel lua-devel uriparser-devel libxslt-devel openssl-devel \
		mysql-devel bluez-libs-devel radcli-devel freetds-devel jack-audio-connection-kit-devel bash \
		net-snmp-devel iksemel-devel corosynclib-devel newt-devel popt-devel libical-devel spandsp-devel \
		libresample-devel uw-imap-devel binutils-devel libsrtp-devel gsm-devel doxygen graphviz zlib-devel openldap-devel \
		codec2-devel fftw-devel libsndfile-devel unbound-devel \
		wget subversion git git-review \
		bzip2 patch python-devel \
		\
		autoconf autoconf-archive automake ccache sudo valgrind gdb rsync \
		python2-pyyaml python2-twisted python2-autobahn python2-construct python2-devel \
		python2-lxml python2-netifaces python2-numpy python2-requests python2-PyXB python2-Cython \
		libpcap-devel lksctp-tools-devel python-alembic python2-psycopg2 \
		\
		postgresql-server postgresql-odbc \
		\
		&& \
	dnf clean all && \
	\
	cd /usr/src && \
	git config --global user.email "you@example.com" && \
	git config --global user.name "Fake Name" && \
	\
	git clone https://github.com/asterisk/starpy && \
	(cd starpy && python setup.py install) && \
	rm -fr starpy && \
	\
	git clone https://github.com/otherwiseguy/yappcap && \
	(cd yappcap && make && make install) && \
	rm -fr yappcap && \
	\
	git clone https://github.com/SIPp/sipp -b v3.5.2 && \
	( \
		cd sipp && \
		./build.sh --prefix=/usr --with-pcap --with-openssl --with-rtpstream --with-sctp && \
		make install \
	) && \
	rm -fr sipp && \
	\
	git clone https://github.com/asterisk/asterisk && \
	(cd asterisk && git remote add gerrit https://gerrit.asterisk.org/asterisk) && \
	\
	git clone https://github.com/asterisk/testsuite && \
	(cd testsuite && git remote add gerrit https://gerrit.asterisk.org/testsuite)

COPY asterisk-ci-full /usr/bin/
COPY postgresql-start /usr/local/bin

WORKDIR "/usr/src/asterisk"
