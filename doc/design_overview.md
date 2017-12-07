# injesta


***

### System Design Overview

injesta is a framework designed to facilitate the building of data ingest pipelines as depicted below:

**Simple Logical Processing Pipeline**
![Simple Logical Pipeline](./doc/simple_logical_pipeline.png  "Simple Logical Pipeline")

The figure above is a simple example of the type of application that injesta may be used to implement. It shows a number of logical processes, organised as a pipeline, that read data from some kind of source system, apply some kind of transformation and filtering to that data before writing it to a destination system.

It is important to emphasise that the processes shown in the above figure represent logical processing steps in the processing pipeline. One of the design aims for injesta is scalability and therefore, a logical process may in fact be implemented using multiple instances of a physical process as shown below:

**Example Physical Processing Pipeline**
![Simple Physical Pipeline](./doc/simple_physical_pipeline.png  "Simple Physical Pipeline")

The example physical processing pipeline above shows how physical processes pass data along the pipeline via a number of queues. The reason for using queues between processes is to provide a degree of decoupling of processes and to allow the number of processes of each type to be scaled independently. For example, Reader processes need to know which queue to write to but they don't need to know anything about the next process in the pipeline or how many of those processes there are.

It is important to point out that the design for injesta described here is suitable for applications where data records may be processed independently of each other. The design is less suited to applications that need to maintain state since, in general, it is not possible to say which instance of a process will process any given data record.

It may be observed that each physical process follows a pattern:

- Read a record from a source queue.

- Apply some kind of application-specific processing to the record.

- Write the resulting record to destination queue.

Further aspects common to each physical process are:

- The need to be started and stopped and restarted on failure (i.e. supervision).

- The need to be able to handle message and metric logging.

The design for injesta is that each process take the form of a generic part handling reading from and writing to queues, message/metric logging with application-specific processing handled by a number of callback functions.

The aim of this project is to design and implement a framework that provides the generic parts of such pipeline processes that may be configured into pipelines using some kind of queueing technology.
