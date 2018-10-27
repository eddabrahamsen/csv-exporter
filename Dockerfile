FROM       resin/raspberrypi3-alpine-python
ENV        INITSYSTEM on
RUN        pip install safetyculture-sdk-python
COPY       . /app
WORKDIR    /app
RUN	       mkdir /app/iauditor_exports_folder
RUN        cd /app/iauditor_exports_folder
ENV        SHELL=/bin/bash
ENTRYPOINT "iauditor_exporter" "--loop" "--format" "csv" && /bin/bash
CMD        ["python"]
