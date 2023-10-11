from flask import Flask, render_template, request, redirect
from DB.main_events import nepali_events  # Import the data from events.py
from DB.myevents import myevents

app = Flask(__name__, template_folder="html_templates")

# Function to save events and dates to myevents.py
def save_event(event, date):
    with open("myevents.py", "r+") as file:
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

if __name__ == "__main__":
    app.run(debug=True)
