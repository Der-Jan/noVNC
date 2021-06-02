ARG BUILD_FROM
FROM $BUILD_FROM

ENV LANG C.UTF-8

# Install requirements for add-on
RUN apk add --no-cache py3-pip py3-numpy
RUN pip install websockify

# Copy data for add-on
COPY launch.sh /
COPY web /web
RUN chmod a+x /launch.sh

CMD [ "/launch.sh" ]
