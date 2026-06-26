# CatPriceAI

A synthetic Cat XL treaty pricing workbench with Streamlit front-end, FastAPI backend, pricing analytics, and optional OpenAI-enhanced agent/RAG support.

## Project structure

- `01_generate_data.py` - build synthetic cedant portfolio, loss events, treaty terms, and CSV/SQLite outputs
- `app/10_streamlit_app.py` - main Streamlit UI logic
- `app/streamlit_app.py` - Streamlit entrypoint wrapper
- `api/09_api.py` - FastAPI backend exposing health, exposure, pricing, top losses, treaty Q&A, and pricing query
- `rag/07_rag_engine.py` - treaty document retrieval engine with optional OpenAI prompt support
- `agent/08_pricing_agent.py` - local pricing agent for underwriting queries
- `data/` - generated CSV and SQLite data assets

## Setup

From the project root:

```bash
python -m pip install -r requirements.txt
```

## Generate data

Generate the synthetic dataset required by the app:

```bash
python 01_generate_data.py
```

## Run the Streamlit app

```bash
streamlit run app/streamlit_app.py
```

Then open the browser at:

- `http://localhost:8501`

## Run the FastAPI backend

```bash
uvicorn api.09_api:app --host 127.0.0.1 --port 8000 --reload
```

API endpoints:

- `http://127.0.0.1:8000/health`
- `http://127.0.0.1:8000/exposure`
- `http://127.0.0.1:8000/pricing`
- `http://127.0.0.1:8000/top-losses`
- `http://127.0.0.1:8000/treaty/ask`
- `http://127.0.0.1:8000/pricing/query`

## Run both together

Use the helper script:

```bash
./run.sh
```

This starts Streamlit at `http://localhost:8501` and FastAPI at `http://127.0.0.1:8000`.

## OpenAI API key support

The Streamlit app sidebar accepts an optional OpenAI API key.

- If provided, the underwriting agent and treaty Q&A use OpenAI for richer responses.
- If blank, the app falls back to local rule-based answers and document retrieval.

To run with an environment key:

```bash
export OPENAI_API_KEY="your_api_key_here"
./run.sh
```

## Quick terminal commands

```bash
# install dependencies
python -m pip install -r requirements.txt

# generate data
python 01_generate_data.py

# run Streamlit
streamlit run app/streamlit_app.py

# run FastAPI backend
uvicorn api.09_api:app --host 127.0.0.1 --port 8000 --reload

# run both together
./run.sh
```

## Notes

- The app uses generated CSV files in `data/`.
- `app/streamlit_app.py` imports the UI code from `app/10_streamlit_app.py`.
- The backend and UI are designed to work with the current local project dataset.
