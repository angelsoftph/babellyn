First, create a virtual environment by running:

```bash
python -m venv venv
```

Next, activate the virtual environment by running:

```bash
venv\Scripts\activate
```

Next, install the required packages to run the project:

```bash
pip install -r requirements.txt
```

Finally, create the server by running:

```bash
uvicorn main:app --reload
```
