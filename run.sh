#!/usr/bin/env bash
set -euo pipefail

# Start the FastAPI backend and Streamlit front-end together.
# Run this from the project root: ./run.sh

API_HOST="127.0.0.1"
API_PORT="8000"
STREAMLIT_PORT="8501"

echo "Starting FastAPI backend at http://${API_HOST}:${API_PORT}"
uvicorn api.09_api:app --host "${API_HOST}" --port "${API_PORT}" --reload &
API_PID=$!

sleep 2

echo "Starting Streamlit app at http://localhost:${STREAMLIT_PORT}"
streamlit run app/streamlit_app.py --server.port "${STREAMLIT_PORT}" --server.headless true

# If Streamlit exits, stop the backend too.
kill ${API_PID}
