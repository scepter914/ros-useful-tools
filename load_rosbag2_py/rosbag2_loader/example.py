import argparse
from typing import List

from rosbag2_loader.rosbag2_loader import Rosbag2Loader, TopicData

if __name__ == "__main__":

    parser = argparse.ArgumentParser()
    parser.add_argument("--input", type=str, required=True)
    args = parser.parse_args()

    rosbag_loader = Rosbag2Loader(args.input)
    topics: List[TopicData] = rosbag_loader.get_topic_data(
        ["/camera_info", "/image_raw"]
    )
    print(f"{topics[0].topic_name} {len(topics[0].topic_data_list)} topics")
    print(f"{topics[1].topic_name} {len(topics[1].topic_data_list)} topics")
