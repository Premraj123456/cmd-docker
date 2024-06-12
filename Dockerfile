# Use the official Python image from the Docker Hub
FROM python:3.9

# Set the working directory
WORKDIR /app

# Copy the requirements file and install dependencies
COPY packages.txt .
RUN apt-get update && \
    xargs -a packages.txt apt-get install -y

# Copy the rest of the application
COPY . .

# Install Python dependencies
RUN pip install streamlit

# Expose the port Streamlit will run on
EXPOSE 8501

# Run the Streamlit app
CMD ["streamlit", "run", "app.py"]
