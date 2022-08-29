
""" rosbag2 loader
Rosbag2 loadar API.
"""

import logging
from typing import Any, Dict, List

from rclpy.serialization import deserialize_message
from rosbag2_py import ConverterOptions, SequentialReader, StorageOptions
from rosidl_runtime_py.utilities import get_message

logger = logging.getLogger(__name__)


class TopicData:
    """Topic data class

    Attributes:
        self.topic_name (str): Topic name
        self.topic_data_list (List[Any]): The list of topic data
        self.timestamp_list (List[int]): The timestamp array
    """

    def __init__(
        self,
        topic_name: str,
    ) -> None:
        """Init function

        Args:
            topic_name (str): Topic name
        """

        self.topic_name: str = topic_name
        # Any = msg type
        self.topic_data_list: List[Any] = []
        self.timestamp_list: List[int] = []

    def add_data(
        self,
        topic_data: Any,
        timestamp: int,
    ) -> None:
        """Add data

        Args:
            topic_data (Any): Topic data. The type is msg of ros2.
            timestamp (int): Time stamp from rosbag2.
        """
        self.topic_data_list.append(topic_data)
        self.timestamp_list.append(timestamp)


class Rosbag2Loader:
    """Rosbag2 loader class

    Attributes:
        self.reader(Any): rosbag2 reader
        self.topic_name_to_msg_type (Dict[str, str]):
            Map from topic name to message type.
            For example,
            self.topic_name_to_msg_type["/camera/camera_info"] = "sensor_msgs/msg/CameraInfo"
    """

    def __init__(
        self,
        rosbag_input_path: str,
    ) -> None:
        """init class

        Args:
            rosbag_input_path (str): Input path for rosbag2
        """
        self.reader: Any = self._load_rosbag(rosbag_input_path)
        self.topic_name_to_msg_type: Dict[str, str] = self._set_topic_name_to_msg_type()

    def get_topic_data(
        self,
        topic_name_list: List[str],
    ) -> List[TopicData]:
        """Get topic data

        Args:
            topic_name_list (List[str]): The list of topic's names you want to load.

        Returns:
            List[TopicData]: The list of TopicData class
        """

        # Init for topic_data
        output_topic_list: List[TopicData] = []
        for topic_name in topic_name_list:
            output_topic_list.append(TopicData(topic_name))

        # Load topic data
        while self.reader.has_next():
            (topic_name, topic_raw_data, timestamp) = self.reader.read_next()
            msg_type = get_message(self.topic_name_to_msg_type[topic_name])
            for output_topic in output_topic_list:
                if topic_name == output_topic.topic_name:
                    deserialized_topic_data = deserialize_message(
                        topic_raw_data, msg_type
                    )
                    output_topic.add_data(deserialized_topic_data, timestamp)
        return output_topic_list

    def _set_topic_name_to_msg_type(self) -> Dict[str, str]:
        """Set the map of topic name to message type

        Returns:
            Dict[str, str]: The map of topic name to message type
        """
        topic_types = self.reader.get_all_topics_and_types()
        topic_name_to_msg_type: Dict[str, str] = dict()
        for topic_type in topic_types:
            topic_name_to_msg_type[topic_type.name] = topic_type.type
        return topic_name_to_msg_type

    @staticmethod
    def _load_rosbag(rosbag_input_path: str) -> Any:
        """_summary_

        Args:
            rosbag_input_path (str):
                The path to input rosbag2.
                Full path is required and '~' and '$HOME' are invalid because of rosbag2-api.

        Returns:
            Any: rosbag2 reader
        """
        storage_options = StorageOptions(uri=rosbag_input_path, storage_id="sqlite3")
        converter_options = ConverterOptions(
            input_serialization_format="cdr", output_serialization_format="cdr"
        )
        reader = SequentialReader()
        reader.open(storage_options, converter_options)
        logger.info("finish loading rosbag2")
        return reader
