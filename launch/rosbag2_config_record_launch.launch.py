import os
from typing import List

from ament_index_python.packages import get_package_share_directory

import launch


def generate_launch_description():
    # parameter
    config_package_name: str = "rosbag2_record_launcher"
    config_file_name: str = "topic_list.txt"
    duration: int = 60

    # set config file
    config_dir_name: str = get_package_share_directory(config_package_name)
    config_file_path: str = os.path.join(
        config_dir_name,
        "config",
        config_file_name,
    )

    record_topics: List[str] = []
    with open(config_file_path, "r") as fi:
        while True:
            line: str = fi.readline()
            if not line:
                break
            record_topics.append(line.replace("\n", ""))
    print(record_topics)

    command_list: List[str] = (
        ["ros2", "bag", "record"] + record_topics + ["-d", str(duration)]
    )

    return launch.LaunchDescription(
        [
            launch.actions.ExecuteProcess(
                cmd=command_list,
                output="screen",
            ),
        ]
    )
