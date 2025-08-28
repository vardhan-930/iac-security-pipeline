PROJECT DETAILS :  
                    Infrastructure as Code Security Pipeline with Checkov and GitHub Actions

 Student Details  
   - Name: HARSHA VARDHAN BODDU  
   - Reg No: 229303278  
   - Section: D

 Project Goal  
   - I built a small CI pipeline that scans my Terraform code for security issues when I push or open a pull request.

What It Does  
   - Runs Checkov on Terraform files on every push/PR.  
   - Shows pass/fail in the PR Checks.  
   - Blocks merging to main if the scan fails.

 Why This Matters  
   - It helps stop common cloud mistakes like public S3 buckets or missing encryption before merging.

 Tech Used  
   - Terraform, GitHub Actions, Checkov.

 How To Run  
   - Create a branch, change any .tf file, push, and open a PR to main.  
   - The Checkov job runs automatically in the PR Checks tab.

 What I Secured  
   - S3 server-side encryption (AES256).  
   - Blocked all public access for the bucket.  
   - Optional: versioning and HTTPS-only bucket policy.

 Files To See  
   - main.tf — my S3 setup with security.  
   - .github/workflows/checkov.yml — pipeline that runs Checkov.

 Notes  
   - Bucket names must be globally unique.  
   - If PR says “nothing to compare,” make a small change and push again.  
   - Use a Personal Access Token (PAT) for HTTPS pushes.
