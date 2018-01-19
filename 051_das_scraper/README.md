~REDACTED~ Video Scraper
==================================

This repo scrapes the ~REDACTED~ site for its videos.

I redacted the name of the site and other identifying information as they may not want me scraping them XD

### Requirements

```
- python
- pip
- virtualenv
```

### Getting Started

*Install Dependencies*

```
virtualenv venv
pip install -r requirements.txt
source venv/bin/activate
```

*Getting the List of Pages*

They publish an atom feed here ~REDACTED~

Run this to get the latest list of video pages

```
curl -s ~REDACTED~ | grep "~REDACTED~" | grep "~REDACTED~/" | cut -d ">" -f 2 | cut -d "<" -f 1 > pages.txt
```

*Getting the List of Video Urls*

This will spin up selenium, prompt for the password, and login. It will then grab the list of video urls (with auth credential) and write it to `videos.txt`

```
python scrape.py > videos.txt
```

*Downloading the videos*

```
python download.py
```
