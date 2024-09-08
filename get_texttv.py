#!/usr/bin/env python

# For use with a systemd timer running every n minutes and fetch sport results
# A simple bash tui for display the result
#
# jontas@gmx.com in 2023 

import os
import requests
from bs4 import BeautifulSoup

# Const
BASE_URL = 'https://www.svt.se/text-tv'
BASE_FILE_PATH = '/home/jontas/.cache/text-tv/'

# Check if text files exists - if not - an empty 'with' block creates a new file
# Also create directory if needed
def create_file_if_not_exists(file_path):
    if not os.path.exists(file_path):
        os.makedirs(os.path.dirname(file_path), exist_ok=True)  
        with open(file_path, 'w', encoding='utf-8') as f:
            pass  


pages = [
    {'page': '343', 'file_name': '343.txt'},
    {'page': '344', 'file_name': '344.txt'},
    {'page': '345', 'file_name': '345.txt'},
    {'page': '377', 'file_name': '377.txt'},
    # Add...
]

for entry in pages:
    url = f"{BASE_URL}/{entry['page']}"
    file_path = os.path.join(BASE_FILE_PATH, entry['file_name'])

    create_file_if_not_exists(file_path)  # Check and create file if needed

    response = requests.get(url)
    html_content = response.content

    soup = BeautifulSoup(html_content, 'html.parser')
    div_content = soup.find('div', class_='Content_screenreaderOnly__3Cnkp').text

    with open(file_path, 'w', encoding='utf-8') as file:
        file.write(div_content)
