# Use a lightweight Python base image
FROM python:3.9

# Set working directory
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt ./
RUN pip install -r requirements.txt

# Copy the application code
COPY . .

# Expose the port for the Django application
EXPOSE 8000-80010

# Set the command to run the Django development server
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
