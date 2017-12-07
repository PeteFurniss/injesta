# injesta


***

## Core Data Handler Design

Each system process centres on a Core Data Handler process. Based on an OTP gen_server process, the Core Data Handler receives data messages, one at a time from the Input Queue, via the Queue Reader process.

Having received a message, the Core Data Handler calls the process_message function of the Application-Specific Callback Module. The process_message function performs application-specific processing on the message it is given and returns the result to the Core Data Handler.

The Core Data Handler then forwards the result to the Output Queue via the Queue Writer process.

The Core Data Handler is configured with configuration data it reads from the Configuration Data Module. Using the Core Data Handler process name as key, the Configuration Data Module returns details of the modules with which the Core Data Handler interfaces. It is the configuration data together with the Application-Specific Callback Module that turn a generic Core Data Handler process into a process that performs a specific task in the processing pipeline.

### Behaviour

OTP gen_server

### API

#### start_link

* start_link({ProcessType, ProcessInstance, ConfigModule}) -> Result

**Types**

* ProcessType = atom()
* ProcessInstance = int()
* ConfigModule = atom()
* Result = {ok, Pid} | ignore | {error, Error}
* Pid = pid()
* Error = {already_started, Pid} | term()

Creates a Core Data Handler process with the registered name "ProcessTypeProcessInstance".

ConfigModule is the module that Core Data Handler uses to provide its configuration data, given the ProcessType.

start_link may be called as part of a supervision tree.

#### stop

* stop({ProcessType, ProcessInstance}) -> ok

**Types**

* ProcessType = atom()
* ProcessInstance = int()

Stops the relevant Core Data Handler instance.