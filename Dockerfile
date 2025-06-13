FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy all app files (app.py + templates folder)
COPY . .

# Expose port for Flask app
EXPOSE 10000

# Command to start your Flask app with gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:10000", "app:app"]
