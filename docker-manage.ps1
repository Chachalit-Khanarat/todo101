#!/usr/bin/env pwsh

# Todo101 Docker Management Script

param(
    [string]$Action = "help"
)

switch ($Action.ToLower()) {
    "start" {
        Write-Host "Starting MongoDB container..." -ForegroundColor Green
        docker-compose up -d mongodb
    }
    "start-all" {
        Write-Host "Starting all services (MongoDB + Mongo Express)..." -ForegroundColor Green
        docker-compose up -d
    }
    "stop" {
        Write-Host "Stopping all containers..." -ForegroundColor Yellow
        docker-compose down
    }
    "restart" {
        Write-Host "Restarting containers..." -ForegroundColor Yellow
        docker-compose restart
    }
    "logs" {
        Write-Host "Showing MongoDB logs..." -ForegroundColor Cyan
        docker-compose logs -f mongodb
    }
    "status" {
        Write-Host "Container status:" -ForegroundColor Cyan
        docker-compose ps
    }
    "reset" {
        Write-Host "WARNING: This will delete all data!" -ForegroundColor Red
        $confirm = Read-Host "Are you sure? (y/N)"
        if ($confirm -eq "y" -or $confirm -eq "Y") {
            docker-compose down -v
            docker-compose up -d mongodb
            Write-Host "Database reset complete." -ForegroundColor Green
        } else {
            Write-Host "Reset cancelled." -ForegroundColor Yellow
        }
    }
    "backend" {
        Write-Host "Starting Node.js backend..." -ForegroundColor Green
        Set-Location backend
        node index.js
    }
    "help" {
        Write-Host @"
Todo101 Docker Management Script

Usage: .\docker-manage.ps1 [action]

Actions:
  start      - Start MongoDB container only
  start-all  - Start all services (MongoDB + Mongo Express)
  stop       - Stop all containers
  restart    - Restart all containers
  logs       - Show MongoDB logs (real-time)
  status     - Show container status
  reset      - Reset database (WARNING: deletes all data)
  backend    - Start Node.js backend server
  help       - Show this help message

Examples:
  .\docker-manage.ps1 start
  .\docker-manage.ps1 logs
  .\docker-manage.ps1 status
"@ -ForegroundColor White
    }
    default {
        Write-Host "Unknown action: $Action" -ForegroundColor Red
        Write-Host "Use '.\docker-manage.ps1 help' for available commands." -ForegroundColor Yellow
    }
}
