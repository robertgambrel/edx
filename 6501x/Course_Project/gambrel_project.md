# Case Chosen
I chose to consider Mayo Clinic's problem in scheduling operating room use more effectively (https://www.informs.org/Impact/O.R.-Analytics-Success-Stories/Increasing-Surgical-Safety). The case writeup indicates that the clinic had inefficient scheduling - either due to unused capacity or to procedures taking longer than anticipated.

# Estimating Operating Room Time of Known Procedures
The first thing the facility would need to do is determine how much operating room to allocate to the procedure. This could depend on many factors the hospital would have ready access to - patient age, gender, complicating conditions, prior procedures, and health status. It would also depend on the performing physician - some may just tend to work more slowly than others, which could be captured by including a dummy and interaction terms for each doctor in the scheduling pool. The outcome would likely be treated as continuous, as it's a measure of time duration, hence a least squares model is appropriate.

# Predicting Influx of Unplanned Procedures
While most procedures are likely planned, it is possible that emergency procedures will need to occur. These would take scheduling priority over previously planned, necessary but not urgent, procedures. If a day was fully booked and an emergency procedure arose, some procedure would have to be bumped and rescheduled. These emergencies could be modeled in a variety of ways - discrete events (Poisson) that potentially occur every hour and affect every surgery later in the day. 

Of course, arrivals for spinal procedures might not be random and memoryless; a traffic accident or natural disaster might cause many patients to need care at once. The patients affected by these would not be independent events in the same way that spinal injuries due to random falls or personal activities would be.

We could also model the likelihood that any given day has any emergency patients. We could use the clinic's past history of emergency operations and include outside data about the region. For example, some days might have an influx of people to the region due to festivals, sporting events, or concerts. Holidays associated with increased road traffic and accidents would also be important to consider. This data could be collected from local news sources but would require a human coder.

# Determining the Utility Function
The analyst must determine whether the model should target operating room time or provider time. If the goal is to keep the operating room occupied, then there would be a potential for doctors and their patients to be 'queued' if the timeslot they scheduled is delayed by another procedure. This idle time carries a lot of costs - doctors and nurses are expensive, and it is risky to keep patients prepped for surgery under anaesthesia for longer than necessary. On the other hand, idle operating rooms are an inefficient use of a clinic's capacity and will still require upkeep and maintenance costs. How to balance these must ultimately be decided by the hospital; by running multiple simulations under different parameters, administrators can determine which outcomes best balance these costs.

# Simulating for Maximum efficiency
All of these inputs have inherent uncertainty built in. Surgery times vary from expectations, complications arise without warning, unscheduled emergency procedures happen, and sometimes mechanical failures happen that leave operating rooms unavailable. By using this uncertainty to run a simulation of daily surgeries coming in and being successfully completed, the hospital can get a sense of how often it anticipates starttime delays over over an hour, or doctors to have to stay after 6 pm, or surgeries getting completely bumped and rescheduled. By adjusting the daily scheduling rate and staffing levels of clinical support staff, the hospital could determine what mix of parameters yield the most acceptable outcome.

# Scheduling for Maximum efficiency
Suppose the hospital decides that by fully scheduling 9 rooms out of 10 (leaving the last one for emergency patients or scheduled paitents bumped from other rooms) and keeping 
