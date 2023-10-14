from flask import Flask, render_template, request, redirect
from DB.main_events import nepali_events  # Import the data from events.py
from DB.myevents import myevents
import os
import json
import threading
import time
from datetime import datetime
from test import saveGeneratedPostToLocalDatabse
app = Flask(__name__, template_folder="html_templates")

# Function to save events and dates to myevents.py
def save_event(event, date):
    with open("DB/myevents.py", "r+") as file:
        lines = file.readlines()
        line_number_to_insert = len(lines) - 1
        new_content  = f'"{event}": "{date}",\n'
        lines.insert(line_number_to_insert - 1, new_content)
        file.seek(0)
        file.truncate()
        file.writelines(lines)


@app.route("/")
def index():
    return render_template("index.html", events=nepali_events, your_events=myevents)

@app.route("/submit", methods=["POST"])
def submit():
    event = request.form["event"]
    date = request.form["date"]
    
    save_event(event, date)
    
    return redirect("/")

def generate_json_data(base_dir):
    data = {}
    for root, dirs, files in os.walk(base_dir):
        for dir_name in dirs:
            dir_path = os.path.join(root, dir_name)
            image_file = os.path.join(dir_path, f"{dir_name}.jpg")
            text_file = os.path.join(dir_path, f"{dir_name}.txt")
            image_file = image_file.replace(os.path.sep, '/')

            if os.path.exists(image_file) and os.path.exists(text_file):
                with open(text_file, "r", encoding="utf-8") as text_file:
                    text = text_file.read()
                data[dir_name] = {
                    "url": image_file,
                    "text": text
                }
    return data


@app.route("/json_data")
def json_data():
    base_directory = "C:/Users/PEIN/OneDrive/Desktop/AI INNOVATION BOUNTY/DB/POST"  # Specify the base directory
    json_data = generate_json_data(base_directory)
    return json.dumps(json_data, ensure_ascii=False, indent=4)

events = {
    "BuddhaJayanti": 11,
    "HappyBirthdayAayush": 12,
    "Holi": 13,
    "MahaShivaratri": 14,
    "Tihar": 15,
}

def check_time_and_generate_posts():
    while True:
        current_minute = datetime.now().minute
        

        for event, event_minute in events.items():
            if current_minute == event_minute:
                saveGeneratedPostToLocalDatabse(event)

        # Sleep for one minute before checking again
        time.sleep(30)

# Create a separate thread to periodically check the time and trigger post generation
time_check_thread = threading.Thread(target=check_time_and_generate_posts)
time_check_thread.daemon = True  # The thread will exit when the main application exits
time_check_thread.start()


if __name__ == "__main__":
    app.run(debug=True)
