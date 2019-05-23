`libpostal-api.go` contains code for a server that accepts HTTP requests and returns the expanded or parsed address of what it is given using `libpostal`.

To build the image...

1) Go to `./base_image` and run `docker build -t libpostal .`. This builds a base image with `libpostal` already set up, which drastically cuts down on 
2) Go to the root directory of the project and run `docker build -t libpostal-api .`. This will build the image that contains the 

To run and test locally...

1) `docker run -d -p 8080:8080 libpostal-api`
2) Query locally via cURL with `curl -X POST -d '{"query": "1632 Washtenaw Ave"}' localhost:8080/libpostal/expand`, and the same for parse functionality, except with `parse` replacing `expand` at the end.

To deploy a new version...

1) First, check Google Container Registry's `libpostal-api` folder. Should tell you what version to tag the new image as.
2) Tag the image appropriately by running `docker tag libpostal-api gcr.io/eminent-prism-112521/libpostal-api:[version]`.
3) Go back to Google Container Registry. Remove the `latest` tag from the image that previously had it and add it to the new image.
4) Find the `libpostal-api` workload on the `backend-cluster` in Kubernetes Engine and reboot it. Can be done a myriad of ways, I prefer scaling nodes to 0 and back up to 1.
