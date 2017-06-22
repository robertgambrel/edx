# Queuing
- If you know something fits a probability distribution, how can you model it?
- If you have an auto-dialer that puts people in a queue if they pick up, how many phone operators do you need?
  - Based on answer rate, and length of call to finish
- If the pickup is poisson w/ parameter lambda, and the length of call is exponential with mu, you an calculate:
  - Expected fracion of time the employee is busy
  - Expected waiting time a caller faces if they pick up
  - Expected # of calls in the queue
- New calls arrive at rate lambda, and old ones are finished at rate mu
  - Transition equations: if there's 1 call in the queue, qhat happens next?
    - p(next event is new call arrival) = lambda / (mu + lambda)
    - p(next event is finished call) = mu / (mu + lambda)
  - can calculate:
    - expected fraction of time the employee is busy: lambda / mu
    - expected waiting time before talking to employee: lambda / (mu * (mu - lambda))
    - expected # of calls in queue: lambda^2 / (mu * (mu - lambda))
- What if you have 2 employees? Or a max queue of 4?
  - Can still get a closed-form solution because the distributions are *memoryless*
  - Current events don't care about prior history
  - Memoryless exponential distribution:
    - distribution of *remaining* call time equals *initial* distribution of call time
  - Memoryless Poisson
    - Distribution of time to next arrival = initial distribution of time to next arrival-
    - Remember poisson interarrival times are exponentially distributed
  - If you know a process is not memoryless, you know it can't be exponential
- Parameters for queuing models:
  - General arrival distribution (A)
  - General service distribution (S)
  - Number of servers (c)
  - Size of queue (K)
  - Population size (N)
  - Queuing discipline (D) - is it last in first out? FIFO?
  - Could also add hangups, 'balking' when queuers at the end of hte line drop out instead of waiting, etc.
  
# Simulation Basics
- Built a model to watch its behavior
- Types:
  - Deterministic: same inputs give same outputs
  - Stochastic: system has some randomness
  - Continuous-time: changes happen continuously
  - Discrete event simulations: changes happen at discrete time points (our focus)
- Discrete-event stochastic:
  - Help capture variability instead of just averages
- Simulation software
  - Elements of model:
    - Entities: things that move through a process
    - Modules: parts of the process (queues, storage)
    - Actions
    - Resources
    - Decision points
    - Statistical Tracking
  - Often 'drag and drop' style
  - Under the hood:
    - random number generation, tracking, animation, etc.
- Replications: number of runs of a simulation
  - Run many times to get distribution of outcomes
- Once you simulate, need to validate against real data to make sure it's a reasonable approximation



