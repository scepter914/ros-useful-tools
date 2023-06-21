# down_ros2

Down ROS 2 process script.

## Confirmed environment

- Ubuntu 22.04 LTS, ROS2 Humble

## Get started

```sh
./kill_ros2.sh
ros2 daemon start
```

## Use case

- When error messages as below is printed, you can use this script.

```
xmlrpc.client.Fault: <Fault 1: "<class 'rclpy._rclpy_pybind11.RCLError'>:failed to get topic names and types: rcl node's context is invalid, at ./src/rcl/node.c:428">
```

```
[ERROR] [asyncio]: Future exception was never retrieved
future: <Future finished exception=InvalidHandle('cannot use Destroyable because destruction was requested')>
Traceback (most recent call last):
  File "/usr/lib/python3.10/concurrent/futures/thread.py", line 58, in run
    result = self.fn(*self.args, **self.kwargs)
  File "/opt/ros/humble/lib/python3.10/site-packages/launch_ros/actions/load_composable_nodes.py", line 197, in _load_in_sequence
    self._load_node(next_load_node_request, context)
  File "/opt/ros/humble/lib/python3.10/site-packages/launch_ros/actions/load_composable_nodes.py", line 119, in _load_node
    while not self.__rclpy_load_node_client.wait_for_service(timeout_sec=1.0):
  File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/client.py", line 180, in wait_for_service
    return self.service_is_ready()
  File "/opt/ros/humble/local/lib/python3.10/dist-packages/rclpy/client.py", line 159, in service_is_ready
    with self.handle:
rclpy._rclpy_pybind11.InvalidHandle: cannot use Destroyable because destruction was requested
[INFO] [robot_state_publisher-2]: sending signal 'SIGINT' to process[robot_state_publisher-2]
```

## Reference

- <https://dev.to/tsadarsh/xmlrpcclientfault-fault-1-class-rclpyrclpypybind11invalidhandlecannot-use-destroyable-because-destruction-was-3f35>
