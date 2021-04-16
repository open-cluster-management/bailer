# Bailer

## Process

The `bailer` process requires 3 steps to complete the comparison.

1. Run `cluster-scanner` on a cluster in the initial state.

2. Run `cluster-scanner` after applying changes/running test on the cluster.

3. Run `cluster-differ` to compare the two cluster scans.

## Building Bailer

### Building Docker Image

To build the `bailer` Docker image: 

```bash
make docker-build IMAGE_REF=<full-image-reference>
```

For example:

```bash
make docker-build IMAGE_REF=quay.io/team-member/bailer:test
```

### Pushing Docker Image

To push the built Docker image:

```bash
make docker-push IMAGE_REF=<full-image-reference>
```

For example:

```bash
make docker-push IMAGE_REF=quay.io/team-member/bailer:test
```

## Running Bailer via Docker Images

### Cluster Scanning via Docker Image

To run `cluster-scanner` from the Docker image:

```bash
export IMAGE_REF=<full-image-ref>
export CLUSTER_USER=<cluster-user> 
export CLUSTER_PASSWORD=<cluster-password>
export CLUSTER_API=<cluster-api-url> 
export OUTPUT_TAG=<suffix-to-output-file>

docker run -v "$(pwd):/results" ${IMAGE_REF} scan ${CLUSTER_USER} ${CLUSTER_PASSWORD} ${CLUSTER_API} ${OUTPUT_TAG}
```

For example:

```bash
export IMAGE_REF=quay.io/nathanweatherly/bailer:test
export CLUSTER_USER=kubeadmin
export CLUSTER_PASSWORD=hahayouwish
export CLUSTER_API=https://api.installer-pool-4dxtd.dev01.red-chesterfield.com:6443
export OUTPUT_TAG=rct3

docker run -v "$(pwd):/results" ${IMAGE_REF} scan ${CLUSTER_USER} ${CLUSTER_PASSWORD} ${CLUSTER_API} ${OUTPUT_TAG}
```

*This puts the result file into the current working directory (`pwd`). Update the parameter of `-v` to edit*

### Cluster Diffing via Docker Image

EDIT: THESE INSTRUCTIONS AREN'T RIGHT YET

To run `cluster-differ` from the Docker image:

```bash
export IMAGE_REF=quay.io/nathanweatherly/bailer:test
export FIRST_FILE=results-dock-test.txt
export SECOND_FILE=results-rct3.txt
export OUTPUT_TAG=dock-diff

docker run -v "$(pwd):$(pwd)" ${IMAGE_REF} diff ${FIRST_FILE} ${SECOND_FILE} ${OUTPUT_TAG}
```
