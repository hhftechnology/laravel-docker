# Laravel E-commerce Docker Platform

A comprehensive, production-ready Laravel e-commerce application built with modern containerization technologies, featuring a complete microservices architecture for scalable web commerce solutions.

**⚠️ Development Notice**: This platform provides a robust foundation for e-commerce development. Ensure proper security reviews and testing before deploying to production environments. Regular updates and dependency management are essential for maintaining security standards.

## 📋 Table of Contents

- [Platform Overview](#platform-overview)
- [System Requirements](#system-requirements)
- [Technology Architecture](#technology-architecture)
- [Quick Start Guide](#quick-start-guide)
- [Environment Configuration](#environment-configuration)
- [Container Management](#container-management)
- [Development Workflow](#development-workflow)
- [Database Operations](#database-operations)
- [Testing & Validation](#testing--validation)
- [Troubleshooting Guide](#troubleshooting-guide)
- [Contributing Guidelines](#contributing-guidelines)
- [Additional Resources](#additional-resources)

## 🏗️ Platform Overview

This Laravel e-commerce platform delivers a full-stack web application using Docker containerization, providing developers with an isolated, reproducible development environment that mirrors production infrastructure.

### Core Features

🛍️ **E-commerce Functionality**
- Complete Laravel 11 framework implementation
- Modern PHP 8.2 runtime with optimized extensions
- Scalable microservices architecture
- Production-ready container orchestration

🔧 **Development Tools**
- Automated development environment setup
- Comprehensive helper scripts for common tasks
- Hot-reload capabilities for rapid development
- Integrated testing and debugging tools

🚀 **Infrastructure Components**
- High-performance Nginx web server
- Robust MySQL 8.0 database with optimized configuration
- Redis caching layer for enhanced performance
- MailHog email testing and development tools

## 🔧 System Requirements

Ensure your development environment meets these prerequisites:

### Required Software

| Component | Minimum Version | Purpose |
|-----------|----------------|---------|
| Docker | 20.10+ | Container runtime environment |
| Docker Compose | 2.0+ | Multi-container orchestration |
| Git | 2.30+ | Version control and repository management |

### System Verification

Validate your installation with these commands:

```bash
# Check Docker installation
docker --version
docker-compose --version

# Verify Docker daemon is running
docker info

# Test Git installation
git --version
```

## 🏗️ Technology Architecture

### Container Services Overview

| Service | Container Name | Internal Port | External Port | Technology Stack |
|---------|----------------|---------------|---------------|------------------|
| **Application** | laravel-ecommerce-app | 9000 | - | PHP 8.2-FPM + Laravel 11 |
| **Web Server** | laravel-ecommerce-webserver | 80 | 8282 | Nginx (Latest Stable) |
| **Database** | laravel-ecommerce-db | 3306 | 3344 | MySQL 8.0 |
| **Cache Layer** | laravel-ecommerce-redis | 6379 | 8386 | Redis 7.0+ |
| **Email Testing** | laravel-ecommerce-mailhog | 8025/1025 | 8765/1234 | MailHog Latest |

### Application Stack Details

**Laravel Framework (v11)**
- Latest PHP 8.2 runtime with Redis extension
- Optimized autoloading and dependency injection
- Advanced routing and middleware capabilities
- Comprehensive ORM with Eloquent models

**Database Layer**
- MySQL 8.0 with InnoDB storage engine
- Optimized connection pooling and query caching
- Full UTF-8 support with proper collation
- Automated backup and migration capabilities

**Caching Infrastructure**
- Redis for session storage and application cache
- Configurable cache drivers for different environments
- Queue processing for background jobs
- Real-time data synchronization

## 🚀 Quick Start Guide

### Phase 1: Repository Setup

Clone and prepare your development environment:

```bash
# Clone the repository
git clone <repository-url>
cd laravel-ecommerce

# Verify project structure
ls -la
```

### Phase 2: Environment Configuration

Configure your application environment:

```bash
# Create environment configuration from template
cp .env.example .env

# Make helper script executable
chmod +x docker-helper.sh
```

Update your `.env` file with Docker-optimized settings:

```ini
# =================================================================
# Laravel Application Configuration
# =================================================================
APP_NAME="Laravel E-commerce Platform"
APP_ENV=local
APP_KEY=
APP_DEBUG=true
APP_URL=http://localhost:8282

# =================================================================
# Database Configuration (Docker Services)
# =================================================================
DB_CONNECTION=mysql
DB_HOST=db
DB_PORT=3306
DB_DATABASE=laravel_ecommerce
DB_USERNAME=laravel_user
DB_PASSWORD=laravel_password

# =================================================================
# Cache Configuration (Redis)
# =================================================================
CACHE_DRIVER=redis
SESSION_DRIVER=redis
QUEUE_CONNECTION=redis
REDIS_HOST=redis
REDIS_PASSWORD=null
REDIS_PORT=6379

# =================================================================
# Mail Configuration (Development)
# =================================================================
MAIL_MAILER=smtp
MAIL_HOST=mailhog
MAIL_PORT=1025
MAIL_USERNAME=null
MAIL_PASSWORD=null
MAIL_ENCRYPTION=null
MAIL_FROM_ADDRESS="noreply@laravel-ecommerce.local"
MAIL_FROM_NAME="${APP_NAME}"

# =================================================================
# Broadcasting Configuration
# =================================================================
BROADCAST_DRIVER=log

# =================================================================
# File Storage Configuration
# =================================================================
FILESYSTEM_DISK=local
```

### Phase 3: Complete Platform Setup

Execute the automated setup process:

```bash
# Run complete environment setup
./docker-helper.sh setup
```

This command performs the following operations:
1. Builds all Docker containers with optimized configurations
2. Installs Composer dependencies with production optimizations
3. Generates application encryption keys
4. Executes database migrations and seeders
5. Configures file permissions and ownership
6. Initializes Redis cache connections

### Phase 4: Access Your Platform

Once setup completes, access your services:

| Service | URL | Purpose |
|---------|-----|---------|
| **Main Application** | [http://localhost:8282](http://localhost:8282) | Laravel e-commerce platform |
| **MailHog Interface** | [http://localhost:8765](http://localhost:8765) | Email testing and debugging |
| **Database Access** | `localhost:3344` | Direct MySQL connection |
| **Redis Access** | `localhost:8386` | Redis cache management |

## ⚙️ Environment Configuration

### Application Directory Structure

```
laravel-ecommerce/
├── app/                        # Core application logic
│   ├── Http/                   # Controllers, middleware, requests
│   ├── Models/                 # Eloquent models and relationships
│   ├── Services/               # Business logic services
│   └── Providers/              # Service providers
├── bootstrap/                  # Application bootstrap
├── config/                     # Configuration files
├── database/                   # Database migrations and seeders
│   ├── migrations/             # Database schema migrations
│   ├── seeders/                # Test data seeders
│   └── factories/              # Model factories
├── docker/                     # Docker configuration
│   ├── nginx/                  # Nginx server configuration
│   │   └── default.conf        # Virtual host configuration
│   └── php/                    # PHP-FPM configuration
│       └── php.ini             # Custom PHP settings
├── public/                     # Public web assets
├── resources/                  # Views, assets, language files
│   ├── views/                  # Blade templates
│   ├── css/                    # Stylesheets
│   └── js/                     # JavaScript files
├── routes/                     # Application routing
│   ├── web.php                 # Web routes
│   ├── api.php                 # API routes
│   └── console.php             # Artisan commands
├── storage/                    # File storage and logs
├── tests/                      # Application tests
├── docker-compose.yml          # Container orchestration
├── Dockerfile                  # PHP application container
├── docker-helper.sh            # Development helper script
└── .env                        # Environment configuration
```

### Custom Docker Configuration

The platform includes optimized Docker configurations for development and production readiness:

**PHP-FPM Configuration** (`docker/php/php.ini`):
```ini
# Performance optimizations
memory_limit = 512M
max_execution_time = 300
upload_max_filesize = 100M
post_max_size = 100M

# Error reporting for development
display_errors = On
log_errors = On
error_log = /var/log/php_errors.log

# Session configuration
session.save_handler = redis
session.save_path = "tcp://redis:6379"
```

**Nginx Configuration** (`docker/nginx/default.conf`):
```conf
server {
    listen 80;
    index index.php index.html;
    error_log /var/log/nginx/error.log;
    access_log /var/log/nginx/access.log;
    root /var/www/public;
    
    client_max_body_size 100M;
    
    location ~ \.php$ {
        try_files $uri =404;
        fastcgi_split_path_info ^(.+\.php)(/.+)$;
        fastcgi_pass app:9000;
        fastcgi_index index.php;
        include fastcgi_params;
        fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
        fastcgi_param PATH_INFO $fastcgi_path_info;
    }
    
    location / {
        try_files $uri $uri/ /index.php?$query_string;
        gzip_static on;
    }
}
```

## 🛠️ Container Management

### Fundamental Operations

```bash
# =================================================================
# Container Lifecycle Management
# =================================================================

# Start all services in background mode
./docker-helper.sh start

# Stop all running containers gracefully
./docker-helper.sh stop

# Restart specific service
./docker-helper.sh restart [service-name]

# View real-time logs for all services
./docker-helper.sh logs

# Monitor specific service logs
./docker-helper.sh logs nginx
./docker-helper.sh logs redis
./docker-helper.sh logs db
```

### Advanced Container Operations

```bash
# =================================================================
# Container Inspection and Debugging
# =================================================================

# Access application container shell
./docker-helper.sh shell

# Execute commands in specific containers
docker-compose exec app bash
docker-compose exec db mysql -u root -p

# Monitor container resource usage
docker stats

# Inspect container configurations
docker-compose config

# View container networking
docker network ls
docker network inspect laravel-ecommerce_default
```

### Service Health Monitoring

```bash
# =================================================================
# Service Health Checks
# =================================================================

# Check all container status
docker-compose ps

# View detailed container information
./docker-helper.sh status

# Test service connectivity
./docker-helper.sh test-connections

# Monitor service logs in real-time
./docker-helper.sh logs -f [service]
```

## 💻 Development Workflow

### Laravel Artisan Commands

```bash
# =================================================================
# Model and Migration Management
# =================================================================

# Create new Eloquent models with migrations
./docker-helper.sh artisan make:model Product -m
./docker-helper.sh artisan make:model Category -mfcs

# Generate database migrations
./docker-helper.sh artisan make:migration create_products_table
./docker-helper.sh artisan make:migration add_price_to_products_table

# Create model factories for testing
./docker-helper.sh artisan make:factory ProductFactory
```

```bash
# =================================================================
# Controller and Route Management
# =================================================================

# Generate resource controllers
./docker-helper.sh artisan make:controller ProductController --resource
./docker-helper.sh artisan make:controller API/ProductController --api

# Create form request validators
./docker-helper.sh artisan make:request StoreProductRequest
./docker-helper.sh artisan make:request UpdateProductRequest

# Generate middleware
./docker-helper.sh artisan make:middleware AdminMiddleware
```

```bash
# =================================================================
# Application Optimization
# =================================================================

# Clear application caches
./docker-helper.sh artisan cache:clear
./docker-helper.sh artisan config:clear
./docker-helper.sh artisan route:clear
./docker-helper.sh artisan view:clear

# Optimize for production
./docker-helper.sh artisan config:cache
./docker-helper.sh artisan route:cache
./docker-helper.sh artisan view:cache

# Queue and job management
./docker-helper.sh artisan make:job ProcessOrderJob
./docker-helper.sh artisan queue:work
```

### Composer Package Management

```bash
# =================================================================
# Dependency Management
# =================================================================

# Install new packages
./docker-helper.sh composer require laravel/sanctum
./docker-helper.sh composer require spatie/laravel-permission

# Development dependencies
./docker-helper.sh composer require --dev laravel/telescope
./docker-helper.sh composer require --dev barryvdh/laravel-debugbar

# Update dependencies
./docker-helper.sh composer update

# Install dependencies from composer.lock
./docker-helper.sh composer install --no-dev --optimize-autoloader
```

### Frontend Asset Management

```bash
# =================================================================
# Asset Compilation and Management
# =================================================================

# Access container for npm operations
./docker-helper.sh shell

# Within container:
npm install
npm run dev          # Development build
npm run build        # Production build
npm run watch        # Watch for changes
```

## 🗄️ Database Operations

### Migration Management

```bash
# =================================================================
# Database Schema Management
# =================================================================

# Execute pending migrations
./docker-helper.sh artisan migrate

# Rollback last migration batch
./docker-helper.sh artisan migrate:rollback

# Rollback specific number of batches
./docker-helper.sh artisan migrate:rollback --step=3

# Reset and re-run all migrations (⚠️ DESTRUCTIVE)
./docker-helper.sh artisan migrate:fresh

# Fresh migration with seeding
./docker-helper.sh artisan migrate:fresh --seed

# Check migration status
./docker-helper.sh artisan migrate:status
```

### Database Seeding and Factories

```bash
# =================================================================
# Test Data Generation
# =================================================================

# Run all database seeders
./docker-helper.sh artisan db:seed

# Run specific seeder
./docker-helper.sh artisan db:seed --class=ProductSeeder

# Create seeder files
./docker-helper.sh artisan make:seeder ProductSeeder
./docker-helper.sh artisan make:seeder CategorySeeder

# Use Tinker for manual data manipulation
./docker-helper.sh artisan tinker
```

### Direct Database Access

```bash
# =================================================================
# Database Connection and Management
# =================================================================

# Access MySQL directly
docker-compose exec db mysql -u laravel_user -p laravel_ecommerce

# Export database backup
docker-compose exec db mysqldump -u laravel_user -p laravel_ecommerce > backup.sql

# Import database from backup
docker-compose exec -T db mysql -u laravel_user -p laravel_ecommerce < backup.sql

# Monitor database performance
docker-compose exec db mysql -u root -p -e "SHOW PROCESSLIST;"
```

## 🧪 Testing & Validation

### Redis Cache Testing

Verify Redis functionality within your application:

```bash
# Access application container
./docker-helper.sh shell

# Start Laravel Tinker for interactive testing
php artisan tinker
```

Execute these commands within Tinker:

```php
// =================================================================
// Redis Connectivity Testing
// =================================================================

// Test basic Redis connection
use Illuminate\Support\Facades\Redis;
Redis::connection()->ping()  // Expected: "PONG"

// Test Redis data operations
Redis::set('test_key', 'test_value');
Redis::get('test_key')  // Expected: "test_value"

// Test Laravel Cache facade with Redis
use Illuminate\Support\Facades\Cache;
Cache::put('app_test', 'cache_value', 60);
Cache::get('app_test')  // Expected: "cache_value"

// Test session storage
session(['user_id' => 123]);
session('user_id')  // Expected: 123

// Test queue operations
use App\Jobs\TestJob;
TestJob::dispatch('test data');
```

### Application Health Checks

```bash
# =================================================================
# Comprehensive System Testing
# =================================================================

# Test all service connections
./docker-helper.sh test-services

# Validate environment configuration
./docker-helper.sh artisan config:show

# Check application key generation
./docker-helper.sh artisan key:generate

# Verify file permissions
./docker-helper.sh check-permissions

# Test email functionality
./docker-helper.sh test-email
```

### Performance Testing

```bash
# =================================================================
# Performance and Load Testing
# =================================================================

# Monitor container resource usage
docker stats --format "table {{.Container}}\t{{.CPUPerc}}\t{{.MemUsage}}"

# Test database connection pool
./docker-helper.sh artisan tinker
# Within Tinker: DB::connection()->getPdo();

# Verify Redis performance
./docker-helper.sh shell
redis-cli -h redis ping
redis-cli -h redis info stats
```

## 🔧 Troubleshooting Guide

### Common Development Issues

#### 1. Application 500 Server Error

**Symptoms**: Laravel displays generic 500 error page

**Diagnostic Steps**:
```bash
# Check application logs
./docker-helper.sh logs app

# Verify environment configuration
./docker-helper.sh artisan config:show

# Regenerate application key
./docker-helper.sh artisan key:generate

# Clear configuration cache
./docker-helper.sh artisan config:clear
```

**Resolution**:
```bash
# Complete application reset
./docker-helper.sh artisan cache:clear
./docker-helper.sh artisan config:clear
./docker-helper.sh artisan route:clear
./docker-helper.sh artisan view:clear
```

#### 2. File Permission Issues

**Symptoms**: Cannot write to storage directories, cache errors

**Diagnostic Steps**:
```bash
# Check current permissions
./docker-helper.sh shell
ls -la storage/
ls -la bootstrap/cache/
```

**Resolution**:
```bash
# Fix Laravel directory permissions
./docker-helper.sh shell
chown -R laravel:www-data storage bootstrap/cache
chmod -R 775 storage bootstrap/cache
```

#### 3. Database Connection Failures

**Symptoms**: "Database connection refused" or timeout errors

**Diagnostic Steps**:
```bash
# Check database container status
./docker-helper.sh logs db

# Test database connectivity
./docker-helper.sh artisan migrate:status

# Verify database credentials in .env
cat .env | grep DB_
```

**Resolution**:
```bash
# Restart database container
docker-compose restart db

# Wait for database initialization
./docker-helper.sh logs db | grep "ready for connections"

# Test connection manually
docker-compose exec db mysql -u laravel_user -p
```

#### 4. Redis Connection Issues

**Symptoms**: Session data not persisting, cache errors

**Diagnostic Steps**:
```bash
# Check Redis container logs
./docker-helper.sh logs redis

# Test Redis connectivity
./docker-helper.sh shell
php artisan tinker
Redis::ping()
```

**Resolution**:
```bash
# Restart Redis container
docker-compose restart redis

# Clear application cache
./docker-helper.sh artisan cache:clear

# Verify Redis configuration
./docker-helper.sh artisan config:show | grep -i redis
```

#### 5. Email Testing with MailHog

**Symptoms**: Emails not appearing in MailHog interface

**Diagnostic Steps**:
```bash
# Check MailHog container status
./docker-helper.sh logs mailhog

# Verify mail configuration
cat .env | grep MAIL_

# Test email sending
./docker-helper.sh artisan tinker
Mail::raw('Test message', function($m) { $m->to('test@example.com'); });
```

### Complete Environment Reset

When all else fails, perform a complete environment reset:

```bash
# =================================================================
# Nuclear Option: Complete Reset
# =================================================================

# Stop all containers
docker-compose down

# Remove all containers, networks, and volumes
docker-compose down -v --remove-orphans

# Remove generated files
rm -rf storage/logs/*
rm -rf bootstrap/cache/*

# Rebuild and restart everything
./docker-helper.sh setup

# Verify services are healthy
./docker-helper.sh test-services
```

### Advanced Debugging

```bash
# =================================================================
# Advanced Troubleshooting Commands
# =================================================================

# Inspect container networks
docker network ls
docker network inspect laravel-ecommerce_default

# View detailed container information
docker inspect laravel-ecommerce-app

# Monitor real-time container events
docker events --filter container=laravel-ecommerce-app

# Access container filesystem
docker-compose exec app find /var/www -name "*.log" -exec tail -f {} \;
```

## 🤝 Contributing Guidelines

### Development Workflow

1. **Fork the Repository**: Create your own fork for development
2. **Feature Branch Creation**: Use descriptive branch names
   ```bash
   git checkout -b feature/add-product-categories
   git checkout -b bugfix/fix-redis-connection
   ```
3. **Development Process**: Follow Laravel coding standards
4. **Testing Requirements**: Ensure all tests pass before submission
5. **Pull Request Submission**: Include detailed description and testing steps

### Code Quality Standards

```bash
# =================================================================
# Code Quality and Testing
# =================================================================

# Run PHP CS Fixer for code standards
./docker-helper.sh composer run-script fix-cs

# Execute PHPUnit tests
./docker-helper.sh artisan test

# Run static analysis with PHPStan
./docker-helper.sh composer run-script analyse

# Generate code coverage reports
./docker-helper.sh artisan test --coverage
```

### Documentation Requirements

- Update README.md for new features
- Document API endpoints in OpenAPI format
- Include inline code comments for complex logic
- Provide migration instructions for database changes

## 📚 Additional Resources

### Official Documentation

| Resource | URL | Description |
|----------|-----|-------------|
| **Laravel Framework** | [https://laravel.com/docs](https://laravel.com/docs) | Complete framework documentation |
| **Docker Documentation** | [https://docs.docker.com](https://docs.docker.com) | Container platform guides |
| **MySQL 8.0 Reference** | [https://dev.mysql.com/doc/refman/8.0/](https://dev.mysql.com/doc/refman/8.0/) | Database administration guide |
| **Redis Documentation** | [https://redis.io/documentation](https://redis.io/documentation) | Cache and session storage guide |
| **Nginx Configuration** | [https://nginx.org/en/docs/](https://nginx.org/en/docs/) | Web server configuration reference |

### Learning Resources

**Laravel Development**:
- Laravel Bootcamp for beginners
- Laracasts video tutorials
- Laravel News for community updates
- Laravel Daily tips and tricks

**Docker & DevOps**:
- Docker Compose best practices
- Container security guidelines
- Multi-stage build optimization
- Production deployment strategies

### Community Support

- **Laravel Community**: [https://laravel.io](https://laravel.io)
- **Stack Overflow**: Tagged questions for specific issues
- **GitHub Issues**: Bug reports and feature requests
- **Discord/Slack**: Real-time community support

## 📄 License

This Laravel e-commerce platform is open-source software licensed under the [MIT License](https://opensource.org/licenses/MIT).

### License Terms

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software.

---

*This comprehensive guide provides everything needed to develop, deploy, and maintain a Laravel e-commerce platform using Docker containers. Customize configurations and extend functionality based on your specific business requirements.*
