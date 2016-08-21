# dwm - dynamic window manager
# See LICENSE file for copyright and license details.

include config.mk
VERSION=$(shell ls /usr/src | grep dwm | cut -d "-" -f3)
RELEASE=$(shell ls /usr/src | grep dwm | cut -d "-" -f4)
SRC_DIR=/usr/src/dwm-user-${VERSION}-${RELEASE}
SRC = dwm.c
OBJ = ${SRC:.c=.o}

all: diff options dwm

install: dwm.c config.mk 
	cp dwm.c ${SRC_DIR}/dwm.c 
	cp config.mk ${SRC_DIR}/config.mk 

options:
	@echo dwm build options:
	@echo "CFLAGS   = ${CFLAGS}"
	@echo "LDFLAGS  = ${LDFLAGS}"
	@echo "CC       = ${CC}"

.c.o:
	@echo CC $<
	@${CC} -c ${CFLAGS} $<

${OBJ}: config.h config.mk

dwm: ${OBJ}
	@echo CC -o $@
	@${CC} -o $@ ${OBJ} ${LDFLAGS}

clean:
	@echo cleaning
	@rm -f dwm ${OBJ} dwm-${VERSION}.tar.gz

dist: clean
	@echo creating dist tarball
	@mkdir -p dwm-${VERSION}
	@cp -R LICENSE Makefile README config.def.h config.mk \
		dwm.1 ${SRC} dwm-${VERSION}
	@tar -cf dwm-${VERSION}.tar dwm-${VERSION}
	@gzip dwm-${VERSION}.tar
	@rm -rf dwm-${VERSION}

.PHONY: install diff all options clean dist
