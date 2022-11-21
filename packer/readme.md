## Validate an image file

packer validate -var-file=variables.json zookeeper.json

## Build the image

packer build -var-file=variables.json zookeeper.json
