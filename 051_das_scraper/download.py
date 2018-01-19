from subprocess import call
import re


with open('videos.txt') as fp:
    videos = fp.read().splitlines()

for video in videos:
    video_name = re.findall((r"~REDACTED~"), video)[0]
    call(["curl", "-o", video_name, video])
