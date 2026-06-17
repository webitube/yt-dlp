call conda activate yt-dlp
git pull origin main
pip install -r requirements/default.txt
python bundle/pyinstaller.py