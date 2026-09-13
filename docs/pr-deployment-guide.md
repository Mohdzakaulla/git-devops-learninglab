# PR Deployment Guide

## 1. Create Branch

```bash
git checkout -b feature/change
```

## 2. Make Changes and Commit

```bash
git add .
git commit -m "Add changes"
```

## 3. Push Branch

```bash
git push -u origin feature/change
```

## 4. Create Pull Request

Create:

```text
feature/change → main
```

## 5. GitHub Actions

GitHub Actions runs CI checks on the Pull Request.

```text
Pull Request
     ↓
CI Checks
     ↓
Code Review
     ↓
Merge to main
```

## 6. Deployment

After merging to `main`, the deployment workflow runs.

```text
main
 ↓
GitHub Actions
 ↓
Deploy
 ↓
Verify
```
