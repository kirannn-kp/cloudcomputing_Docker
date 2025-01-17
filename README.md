# Terraform Cloud Deployment Assignment

In this assignment, you will use Terraform to deploy a static website and an API container to a cloud provider.

---

## Assignment Overview

The goal of this assignment is to:
1. Register a free cloud provider account.
2. Set up Terraform and the provider.
3. Host a static website using an object storage service.
4. Deploy a public API container.
5. Integrate the API into the website.
6. Deploy a custom Docker API image.
7. Record a screencast of the deployment and application.

---

## Requirements

### Prerequisites
1. **Cloud Provider Account**:
   - Register a free account with either AWS or Google Cloud.  
   Use [Google Cloud Free Tier](https://cloud.google.com/free) or [AWS Free Tier](https://aws.amazon.com/free/).

2. **Tools to Install**:
   - [Terraform](https://www.terraform.io/downloads)
   - [Google Cloud CLI (gcloud)](https://cloud.google.com/sdk/docs/install) or [AWS CLI](https://aws.amazon.com/cli/)
   - A text editor or IDE (e.g., VS Code, Sublime Text).


## Assignment Steps

### 1. Register Free Cloud Provider Account
- Decide on a platform: Google Cloud or AWS.
- Register an account using the free tier offerings.

---

### 2. Setup Terraform and Provider

#### Step 1: Install Terraform
- Download and install Terraform from the [official site](https://www.terraform.io/downloads).

#### Step 2: Install Provider
- Set up the Google Cloud provider or AWS provider in the `providers.tf` file.  
- Use `terraform init` to pull the provider code.

#### Step 3: Setup Credentials
- Follow the instructions for your chosen cloud provider to set up credentials.
- Ensure credentials are accessible for Terraform to deploy resources.

---

### 3. Host a Static Website Using an Object Storage Service

#### Step 1: Create Website Files
- In a `webapp` folder, create a basic `index.html` file with the following content:
  ```html
  <html>
    <body>
      <h1>Hello Cloud</h1>
    </body>
  </html>
  ```

#### Step 2: Deploy to Object Storage
- Use Terraform to deploy the website to Google Cloud Storage (or AWS S3).
- Make the bucket publicly accessible and ensure the website is accessible via a public URL.

---

### 4. Deploy an API Container

#### Step 1: Choose a Public Docker Image
- Select a public Docker image that runs a simple web server and returns a JSON response.  
  Example: [hashicorp/http-echo](https://hub.docker.com/r/hashicorp/http-echo).

#### Step 2: Deploy API Service
- Use Google Cloud Run or AWS App Runner to deploy the container using Terraform.
- Make the API publicly accessible.

---

### 5. Call the API from the Website

#### Step 1: Add a Button to the Website
- Update `index.html` to include a button that calls the API using the `fetch()` method.

#### Step 2: Use Terraform Templates
- Avoid hardcoding the API URL. Use Terraform's `templatefile` function to inject the URL dynamically into the website files.

---

### 6. Deploy a Custom Docker API Image

#### Step 1: Build a Custom Docker Image
- Create a simple custom API image in a programming language of your choice.
- Push the image to Google Artifact Registry or AWS Elastic Container Registry.

#### Step 2: Deploy the Custom Image
- Adapt your Terraform configuration to use the custom Docker image for the API.

---

### 7. Record Screencast

#### Screencast Guidelines
- Record a screencast explaining the full setup.
- Demonstrate the live deployment and application.
- Keep the screencast under **5 minutes**.
- Include the presenter’s name on the screen during their part.

---

## Grading Criteria

### Terraform
- **Provider Setup**: Proper setup in `providers.tf` file.
- **Resource Deployment**: Website and API resources correctly deployed.
- **Automation**: Deployment works in one step using `terraform apply`.
- **No Hardcoding**: No hardcoded URLs; changes to the `webapp` folder automatically update the deployment.

### Custom API Image
- **Custom Build**: Custom API image built, tagged, and deployed.
- **Versioning**: API image tagged with a clear version, e.g., Git SHA.

### Form
- **Screencast Quality**: Clear explanation, live demo, and proper length.
- **Presentation**: Names of presenters displayed during their parts.

---

## Contribution

Please provide your Gmail account to be added to the group for Google Cloud access.

---

## License

This project is licensed under the MIT License.
