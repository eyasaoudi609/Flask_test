# Build stage
FROM python:3.9-slim-buster AS build
WORKDIR /app

# Copy only the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Final stage
FROM python:3.9-slim-buster AS final
WORKDIR /app

# Copy only the necessary files from the build stage
COPY --from=build /app /app

# Expose port
EXPOSE 8000

# Command to run the application
CMD ["python", "main.py", "--port", "8000"]
