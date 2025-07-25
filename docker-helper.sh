#!/bin/bash

case "$1" in
    "setup")
        echo "🚀 Setting up Laravel E-commerce project..."

        # Build and start containers
        docker-compose up -d --build

        # Wait for containers to be ready
        echo "⏳ Waiting for containers to be ready..."
        sleep 20

        # Install Laravel dependencies
        echo "📦 Installing Composer dependencies..."
        docker-compose exec app composer install

        # Generate application key
        echo "🔑 Generating application key..."
        docker-compose exec app php artisan key:generate --force

        # Run migrations
        echo "🗄️ Running database migrations..."
        docker-compose exec app php artisan migrate --force

        # Install npm dependencies and build assets
        echo "🎨 Installing and building frontend assets..."
        docker-compose exec app npm install
        docker-compose exec app npm run build

        # Create storage link
        echo "🔗 Creating storage symbolic link..."
        docker-compose exec app php artisan storage:link

        # Set proper permissions
        echo "🔐 Setting proper permissions..."
        docker-compose exec app chown -R laravel:www-data /var/www/html/storage /var/www/html/bootstrap/cache
        docker-compose exec app chmod -R 775 /var/www/html/storage /var/www/html/bootstrap/cache

        # Clear all caches
        echo "🧹 Clearing caches..."
        docker-compose exec app php artisan config:clear
        docker-compose exec app php artisan cache:clear

        echo "✅ Setup complete!"
        echo "🌐 Laravel App: http://localhost:8282"
        echo "🗄️ Adminer (Database UI): http://localhost:9192"
        echo "📧 MailHog UI: http://localhost:8765"
        echo "🔧 Database: localhost:3344"
        ;;

    "start")
        echo "▶️ Starting containers..."
        docker-compose up -d
        echo "🌐 Laravel App: http://localhost:8282"
        echo "🗄️ Adminer: http://localhost:9192"
        ;;

    "stop")
        echo "⏹️ Stopping containers..."
        docker-compose down
        ;;

    "shell")
        echo "🐚 Accessing app container shell..."
        docker-compose exec app bash
        ;;

    "artisan")
        shift
        docker-compose exec app php artisan "$@"
        ;;

    "logs")
        echo "📋 Showing logs for ${2:-app}..."
        docker-compose logs -f ${2:-app}
        ;;

    "db-info")
        echo "🗄️ Database Connection Information:"
        echo "   Adminer UI: http://localhost:9192"
        echo "   Server: db (or localhost:3344 from host)"
        echo "   Username: laravel_user"
        echo "   Password: laravel_password"
        echo "   Database: laravel_ecommerce"
        echo ""
        echo "   Root access:"
        echo "   Username: root"
        echo "   Password: root_password"
        ;;

    *)
        echo "🛒 Laravel E-commerce Docker Helper"
        echo "Usage: $0 {setup|start|stop|shell|artisan|logs|db-info}"
        echo ""
        echo "Available Services:"
        echo "  🌐 Laravel App: http://localhost:8282"
        echo "  🗄️ Adminer: http://localhost:9192"
        echo "  📧 MailHog: http://localhost:8765"
        ;;
esac
