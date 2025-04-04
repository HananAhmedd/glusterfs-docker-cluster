#!/bin/bash

# Loop through node1 to node4
for i in 1 2 3 4; do
  # Remove any existing container with the same name
  docker rm -f gfs-node$i 2>/dev/null

  echo "🚀 Starting gfs-node$i..."
  docker run -dit \
    --name gfs-node$i \
    --hostname gfs-node$i \
    --network gluster-net \
    --privileged \
    -v gfs-node${i}-brick:/bricks/brick1 \
    glusterfs-custom
done

echo "🎉 All 4 GlusterFS nodes launched!"
