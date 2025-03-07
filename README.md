# MLOps Project - CI/CD Pipeline

## Project Overview
This project demonstrates a complete Continuous Integration and Continuous Deployment (CI/CD) pipeline for a machine learning application using industry-standard tools. The primary goal was to automate deployment, testing, and code quality checks using Jenkins, Docker, GitHub Actions, and more.

## Key Features
- **Automated CI/CD Pipeline:** Using Jenkins and Docker
- **Code Quality Checks:** Implemented with Flake8 and GitHub Actions
- **Automated Testing:** Set up via GitHub Actions
- **Real-Time Notifications:** Configured email alerts for build status
- **Webhooks Integration:** Enabled through ngrok for public access

## Tools and Technologies
- **Jenkins:** CI/CD automation
- **GitHub & GitHub Actions:** Version control and testing
- **Docker:** Containerization of the application
- **Flask & Python:** Application development
- **SMTP Server (Gmail):** Email notifications
- **ngrok:** Exposing localhost to public web

## How It Works
1. **Code Push:** Developers push code to the Dev branch.
2. **GitHub Actions:** Run Flake8 for code quality checks.
3. **Jenkins Build Trigger:** Initiated via GitHub webhooks using ngrok.
4. **Docker Deployment:** Jenkins builds and deploys the Docker container.
5. **Email Notification:** Automated alert for deployment status.

## Getting Started
1. **Clone the Repository:**
```bash
git clone https://github.com/MoizSajjad/mlops-project.git
```
2. **Build the Docker Container:**
```bash
docker build -t mlops-app .
```
3. **Run the Application:**
```bash
docker run -p 5000:5000 mlops-app
```
4. **Access the App:**
Open your browser at `http://localhost:5000`

## Contribution
Feel free to submit issues and pull requests. Contributions are welcome!



---

Thank you for checking out this project!

