# Dockerfile to use this script in an env with no internet access
# Use a base image with Python pre-installed
FROM python:3.11

# Set the working directory within the container
WORKDIR /app

# Copy your Python script and any other necessary files into the container
COPY main.py /app/
# You can also copy other files or dependencies if needed

# Install any additional dependencies (e.g., requests, requests-ntlm) offline
COPY offline_packages/ /app/offline_packages/
RUN pip install --no-index --find-links=/app/offline_packages/ -r /app/offline_packages/requirements.txt

# Expose the port if your script requires network access (adjust as needed)
EXPOSE 80

# Specify the command to run your script
CMD ["python", "main.py"]
