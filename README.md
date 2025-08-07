# Todo101 Backend with MongoDB

This project uses Docker to run MongoDB locally.

## Prerequisites
- Docker and Docker Compose installed on your system

## Quick Start

### 1. Start MongoDB with Docker
```bash
# Start MongoDB container
docker-compose up -d mongodb

# Or start both MongoDB and Mongo Express (web admin interface)
docker-compose up -d
```

### 2. Install backend dependencies
```bash
cd backend
npm install
```

### 3. Start the backend server
```bash
npm start
```

## Docker Commands

### Start MongoDB only
```bash
docker-compose up -d mongodb
```

### Start all services (MongoDB + Mongo Express web admin)
```bash
docker-compose up -d
```

### Stop all services
```bash
docker-compose down
```

### View logs
```bash
docker-compose logs mongodb
```

### Reset MongoDB data
```bash
docker-compose down -v
docker-compose up -d
```

## Access Points
- **Backend API**: http://localhost:15000
- **MongoDB**: localhost:27017
- **Mongo Express** (web admin): http://localhost:8081 (admin/admin123)

## Environment Variables
The `.env` file contains configuration for:
- MongoDB connection URL
- Server port
- Mongo Express credentials
