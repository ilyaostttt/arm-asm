CC := /home/ilya/rpi/tools/arm-bcm2708/gcc-linaro-arm-linux-gnueabihf-raspbian-x64/bin/arm-linux-gnueabihf-gcc
CFLAGS := -g -O0

BIN = bin
HEADERS = block_copy.h data.h
EXECUTABLES = ${BIN}/factorial_test ${BIN}/main
TARGET = pi@rpi:

all: ${EXECUTABLES}

${BIN}/%.o: %.s ${HEADERS} | ${BIN}
	${CC} ${CFLAGS} $< -c -o $@

${BIN}/%.o: %.c ${HEADERS} | ${BIN}
	${CC} ${CFLAGS} $< -c -o $@

${BIN}/main: ${BIN}/main.o ${BIN}/data.o ${BIN}/block_copy.o ${BIN}/ex.o | ${BIN}
	${CC} ${CFLAGS} $^ -o $@

${BIN}/factorial_test: ${BIN}/factorial_test.o ${BIN}/factorial.o | ${BIN}
	${CC} ${CFLAGS} $^ -o $@

.PHONY: clean
clean:
	rm -rf ${BIN}

.PHONY: ${BIN}
${BIN}:
	mkdir -p $@

deploy: ${EXECUTABLES}
	scp -r ${BIN} ${TARGET}
