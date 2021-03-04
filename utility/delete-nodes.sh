#!/bin/bash

set -u 

gcloud beta compute \
  --project=solutionsarchitect-01 instances delete vm1 vm2 vm3 vm4 vm5 vm6 vm7


