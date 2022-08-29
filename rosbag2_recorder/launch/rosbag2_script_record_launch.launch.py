import os
from typing import List

from ament_index_python.packages import get_package_share_directory

import launch


def generate_launch_description():
    # parameter
    config_package_name: str = "rosbag2_record_launcher"
    shell_script_name: str = "rosbag2_record.sh"

    # set config file
    config_dir_name: str = get_package_share_directory(config_package_name)
    config_file_path: str = os.path.join(
        config_dir_name,
        "scripts",
        shell_script_name,
    )
    print(config_file_path)

    return launch.LaunchDescription(
        [
            launch.actions.ExecuteProcess(
                cmd=[config_file_path],
                output="screen",
            ),
        ]
    )
