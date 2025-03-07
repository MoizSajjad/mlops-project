# Use Python as base image
FROM python:3.9

# Set the working directory inside the container
WORKDIR /app

# Copy project files into the container
COPY . .

# Install dependencies
RUN pip install -r requirements.txt

# Expose the port (if running a web app)
EXPOSE 5000

# Run the application
CMD ["python", "app.py"]
