# injesta


***

### System Design

#### Overview

injesta is a framework designed to facilitate the building of data ingest pipelines as depicted below:

**Simple Logical Processing Pipeline**
![Simple Logical Pipeline](https://github.com/PeteFurniss/injesta/blob/master/doc/simple_logical_pipeline.png  "Simple Logical Pipeline")

The figure above is a simple example of the type of application that injesta may be used to implement. It shows a number of logical processes, organised as a pipeline, that read data from some kind of source system, apply some kind of transformation and filtering to that data before writing it to a destination system.

It is important to emphasise that the processes shown in the above figure represent logical processing steps in processing pipeline. One of the design aims for injesta is scalability and therefore, a logical process may in face be implemented using multiple instances of a physical process as shown below:

**Example Physical Processing Pipeline**
![Simple Physical Pipeline](https://github.com/PeteFurniss/injesta/blob/master/doc/simple_physical_pipeline.png  "Simple Physical Pipeline")


