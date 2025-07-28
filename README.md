# Banking System

A comprehensive banking system built with Spring Boot backend and Angular frontend.

## Features

- **User Management**: User registration, authentication, and profile management
- **Account Management**: Multiple account types (Checking, Savings, Business)
- **Transaction Processing**: Deposits, withdrawals, transfers, and payments
- **Real-time Balance Updates**: Instant balance updates after transactions
- **Transaction History**: Complete transaction history with filtering
- **Security**: JWT-based authentication and authorization
- **Responsive Design**: Mobile-friendly Angular frontend

## Technology Stack

### Backend
- **Spring Boot 2.7+**: Main framework
- **Spring Security**: Authentication and authorization
- **Spring Data JPA**: Database operations
- **MySQL**: Primary database
- **Maven**: Dependency management

### Frontend
- **Angular 14+**: Frontend framework
- **Bootstrap 5**: UI framework
- **TypeScript**: Programming language
- **RxJS**: Reactive programming

### DevOps
- **Docker**: Containerization
- **Docker Compose**: Multi-container deployment
- **Nginx**: Frontend web server

## Quick Start

### Prerequisites
- Java 11+
- Node.js 16+
- MySQL 8.0+
- Docker (optional)

### Using Docker (Recommended)

1. Clone the repository:
   ```bash
   git clone <repository-url>
   cd banking-system
   ```

2. Start all services:
   ```bash
   docker-compose up -d
   ```

3. Access the application:
   - Frontend: http://localhost:4200
   - Backend API: http://localhost:8080
   - Database: localhost:3306

### Manual Setup

#### Backend Setup

1. Navigate to backend directory:
   ```bash
   cd backend
   ```

2. Configure database in `application.yml`

3. Run the application:
   ```bash
   ./mvnw spring-boot:run
   ```

#### Frontend Setup

1. Navigate to frontend directory:
   ```bash
   cd frontend
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Start development server:
   ```bash
   ng serve
   ```

## API Documentation

### Authentication Endpoints
- `POST /api/auth/login` - User login
- `POST /api/auth/register` - User registration

### User Endpoints
- `GET /api/users` - Get all users
- `GET /api/users/{id}` - Get user by ID
- `PUT /api/users/{id}` - Update user
- `DELETE /api/users/{id}` - Delete user

### Account Endpoints
- `POST /api/accounts` - Create account
- `GET /api/accounts/{id}` - Get account by ID
- `GET /api/accounts/user/{userId}` - Get accounts by user ID
- `PUT /api/accounts/{id}` - Update account

### Transaction Endpoints
- `POST /api/transactions` - Create transaction
- `GET /api/transactions/{id}` - Get transaction by ID
- `GET /api/transactions/account/{accountId}` - Get transactions by account

## Database Schema

The system uses MySQL with the following main entities:
- **Users**: Store user information
- **Accounts**: Store account details and balances
- **Transactions**: Store all transaction records

## Security

- JWT tokens for authentication
- Password encryption using BCrypt
- CORS configuration for frontend integration
- Input validation and sanitization

## Development

### Code Structure

#### Backend (`/backend`)
- `src/main/java/com/bankingsystem/`
  - `controller/` - REST controllers
  - `service/` - Business logic
  - `model/` - JPA entities
  - `repository/` - Data access layer
  - `dto/` - Data transfer objects
  - `config/` - Configuration classes

#### Frontend (`/frontend`)
- `src/app/`
  - `components/` - Angular components
  - `services/` - HTTP services
  - `models/` - TypeScript interfaces
  - `guards/` - Route guards

### Testing

#### Backend Tests
```bash
cd backend
./mvnw test
```

#### Frontend Tests
```bash
cd frontend
npm test
```

### Building for Production

#### Backend
```bash
cd backend
./mvnw clean package
```

#### Frontend
```bash
cd frontend
npm run build --prod
```

## Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/new-feature`)
3. Commit your changes (`git commit -am 'Add new feature'`)
4. Push to the branch (`git push origin feature/new-feature`)
5. Create a Pull Request

## License

This project is licensed under the MIT License - see the LICENSE file for details.

## Support

For support, email support@bankingsystem.com or create an issue in the repository.