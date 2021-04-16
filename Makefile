docker-build:
	docker build . -t ${IMAGE_REF}

docker-push:
	docker push ${IMAGE_REF}

docker-scan-to-pwd:
	docker run -v "$(pwd):/results" ${IMAGE_REF} scan '${CLUSTER_USER}' '${CLUSTER_PASSWORD}' '${CLUSTER_API}' '${OUTPUT_TAG}'

cluster-scan:
	./cluster-scanner.sh ${OUTPUT_TAG}

cluster-diff:
	python3 ./cluster-differ.py -f ${FIRST_FILE} -s ${SECOND_FILE} -o ${OUTPUT_TAG}