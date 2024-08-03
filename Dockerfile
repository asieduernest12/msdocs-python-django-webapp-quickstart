# Use a lightweight Python base image
FROM python:3.9

# Start and enable SSH
RUN apt-get update \
    && apt-get install -y --no-install-recommends dialog \
    && apt-get install -y --no-install-recommends openssh-server \
    && echo "root:Docker!" | chpasswd 


# Set working directory
WORKDIR /app

# Copy requirements.txt and install dependencies
COPY requirements.txt ./
RUN pip install -r requirements.txt

# Copy the application code
COPY . .
COPY sshd_config /etc/ssh/

RUN chmod u+x ./init.sh \
    && make build-assets

# Expose the port for the Django application
EXPOSE 8000 2222

# Set the command to run the Django development server
# CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
ENTRYPOINT [ "./init.sh" ]


