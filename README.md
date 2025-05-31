

### 📄 `README.md`


# 🍴 Food Recommendation Expert System

This is a simple Expert System built with **Flask (Python)** and **SWI-Prolog**, which recommends food based on user preferences and conditions like weather, hunger, time of day, and more.

---

## 🔧 Features

- Web-based user interface
- Dynamic interaction with Prolog rules
- Food suggestions based on logic rules
- Clean, modern HTML + CSS styling

---

## 🧠 Technologies Used

- Python 3
- Flask
- SWI-Prolog
- PySWIP (Python-Prolog bridge)
- HTML & CSS

---

## 📁 Project Structure

```

food-recommendation/
├── app.py                  # Flask backend
├── food\_rules.pl           # Prolog knowledge base
├── templates/
│   └── index.html          # HTML frontend (styled)
└── README.md               # Project overview

````

---

## 🚀 How to Run the Project

### 1. Clone the Repository

```bash
git clone https://github.com/Milion-Mengistu/food-recommendation.git
cd food-recommendation
````

### 2. Set Up the Environment

Install required Python packages:

```bash
pip install flask pyswip
```

Make sure SWI-Prolog is installed:

* [https://www.swi-prolog.org/Download.html](https://www.swi-prolog.org/Download.html)

### 3. Run the Flask App

```bash
python app.py
```

Visit: `http://127.0.0.1:5000` in your browser

---

## 📚 Example Food Rules

Some example logic rules in `food_rules.pl`:

```prolog
recommend(pancakes) :- input(morning, yes), input(sweet, yes).
recommend(salad) :- input(vegetarian, yes), input(hot_weather, yes).
recommend(ice_cream) :- input(sweet, yes), input(hot_weather, yes).
recommend(burger) :- input(hungry, yes), input(vegetarian, no).
recommend(fruit_juice) :- input(hot_weather, yes), input(relaxing, yes).
```

---

## ✅ Sample Questions in the Form

* Are you hungry?
* Are you vegetarian?
* Do you want something sweet?
* Is it hot weather?
* Is it morning?
* Are you in a hurry?
* Are you relaxing?

---

## 📸 Screenshot

![UI Screenshot](screenshot.png)

---

## 📃 License

This project is for educational purposes and open to modify.

---


Feel free to modify and extend this project!



---
