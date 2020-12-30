FROM registry.access.redhat.com/ubi8/ubi-minimal:latest
WORKDIR /
COPY . .
COPY helper-bins/* /usr/local/bin/
RUN microdnf update && microdnf install python3
ENV FIRST_FILE=/test-one-results/pre-acm.yaml \
    SECOND_FILE=/test-one-results/post-acm-uninstalled.yaml
CMD ["python3", "./spot-the-difference.py", "&&",  "sleep", "infinity" ]
