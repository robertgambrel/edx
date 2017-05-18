# Clustering

- Taking a set of data points and assigning them to groups
- Segment customers into targeted types - what issues do they care about?
- Personalized medicine
- Physical distance - cluster people, and put police near clusters

## Distance norms
- Straight-line norms (Euclidean)
    - p-norm distance
    - infinity-norm: just use the largest component of the distance instead of the sum of all the parts
        - ie if you can move one unit / time across all dimensions, you are only done after you complete the lonest dimension, so only worry about that one
        - remember the conveyor and height example - have to wait for the slowest task to complete
- Rectilinear distance - how many grid shifts do you take to get to the next point (moving 1 to the left/right, 1 up/down at a time, no diagonals)

## K-means clustering
- start by picking k-points as possible centers of clusters
- temporarily assign each data point to the center it's closest to
- move cluster center to the centroid of the data points that were part of it, re-calculate the points that belong, re-center, repeat, repeat
- once cluster centers stop moving, you have the center
- is a HEURISTIC: not guaranteed to find the absolute best solution, but is fast and usually pretty good
- is an expectation-maximization (EM) algorithm: find cluster center (expectation), assign points to clusters (maximization), repeat
- outliers:
    - just get assigned to the closest cluster
- since it's fast, you can run it a bunch of times, with multiple k-values, multiple initial values
    - to avoid K = N Obs, look at the 'elbow diagram' for diminishing returns of total distance w/ addition of more clusters
- Predictve clustering:
    - Assign new points to closest cluster center
- Supervised vs Unsupervised learning
    - Classification: know outcome (supervised)
    - Clustering: unknown outcome (unsupervised)
