#!/bin/bash

cat <<EOF | kubectl apply -f -
apiVersion: apps/v1
kind: Deployment
metadata:
  name: counter-dpy
spec:
  replicas: 1
  selector:
    matchLabels:
      app: counter
  template:
    # Ref: https://kubernetes.io/docs/concepts/cluster-administration/logging/
    metadata:
      name: counter
      labels:
        app: counter
    spec:
      containers:
      - name: count
        image: busybox
        args: [/bin/sh, -c, 'i=0; while true; do echo "$i: $(date)"; i=$((i+1)); sleep 1; done']
EOF
