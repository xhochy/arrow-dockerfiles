Environment to reproduce ARROW-1282
===================================

1. Run `./docker/build_image.sh`
2. Run `./docker/build_from_scratch.sh`
3. Open the environment with `./docker/bash.sh`
4. Call `python hanger.py`. The script is expected to be hanging some time (~30s)
   after it went into the iteration #2.
