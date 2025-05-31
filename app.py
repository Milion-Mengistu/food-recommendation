from flask import Flask, render_template, request
import subprocess

app = Flask(__name__)

@app.route("/", methods=["GET", "POST"])
def index():
    recommendation = ""
    if request.method == "POST":
        # Collect form inputs
        hungry = request.form.get("hungry")
        vegetarian = request.form.get("vegetarian")
        sweet = request.form.get("sweet")
        hot_weather = request.form.get("hot_weather")
        morning = request.form.get("morning")
        hurry = request.form.get("hurry")
        relaxing = request.form.get("relaxing")

        # Prepare facts list to send as args to Prolog
        facts = []
        for trait, val in [("hungry", hungry), ("vegetarian", vegetarian), ("sweet", sweet),
                           ("hot_weather", hot_weather), ("morning", morning),
                           ("hurry", hurry), ("relaxing", relaxing)]:
            if val == "yes":
                facts.append(trait)

        # Run Prolog script with facts as arguments
        try:
            result = subprocess.run(
                ["swipl", "-q", "-f", "food_recommendation.pl", "-g", "main", "--"] + facts,
                capture_output=True,
                text=True,
                check=True
            )
            recommendation = result.stdout.strip()
        except subprocess.CalledProcessError as e:
            recommendation = "Error running Prolog script."

    return render_template("index.html", recommendation=recommendation)

if __name__ == "__main__":
    app.run(debug=True)
