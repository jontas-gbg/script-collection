#!/usr/bin/python3

import os
import feedparser
from datetime import datetime

# Sökväg för input och output-filer
input_file = os.path.expanduser("~/.local/share/rss/get-podcasts.txt")
output_file = os.path.expanduser("~/.local/share/rss/view-podcasts.txt")

def format_date(date):
    return date.strftime("%d %b").lower()

def get_latest_episodes():
    latest_episodes = []
    with open(input_file, 'r') as f:
        for url in f:
            url = url.strip()
            feed = feedparser.parse(url)
            if 'entries' in feed and len(feed.entries) > 0:
                latest_episode = feed.entries[0]
                pub_date = format_date(datetime(*latest_episode.published_parsed[:6]))
                title = latest_episode.title
                podcast_name = feed.feed.get('title', 'Unknown Podcast')
                latest_episodes.append((pub_date, podcast_name, title))
    return latest_episodes

def write_to_file(latest_episodes):
    with open(output_file, 'w') as f:
        for pub_date, podcast_name, title in latest_episodes:
            f.write(f"{pub_date} \"{podcast_name}\" {title}\n")

if __name__ == "__main__":
    latest_episodes = get_latest_episodes()
    write_to_file(latest_episodes)
