-- Banking System Database Schema

-- Create database
CREATE DATABASE IF NOT EXISTS banking_system;
USE banking_system;

-- Users table
CREATE TABLE users (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone_number VARCHAR(20) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    INDEX idx_email (email),
    INDEX idx_phone (phone_number)
);

-- Accounts table
CREATE TABLE accounts (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    account_number VARCHAR(20) UNIQUE NOT NULL,
    account_type ENUM('CHECKING', 'SAVINGS', 'BUSINESS') NOT NULL,
    balance DECIMAL(15, 2) DEFAULT 0.00,
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    user_id BIGINT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,
    INDEX idx_account_number (account_number),
    INDEX idx_user_id (user_id)
);

-- Transactions table
CREATE TABLE transactions (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    amount DECIMAL(15, 2) NOT NULL,
    transaction_type ENUM('DEPOSIT', 'WITHDRAWAL', 'TRANSFER', 'PAYMENT') NOT NULL,
    status ENUM('PENDING', 'COMPLETED', 'FAILED', 'CANCELLED') DEFAULT 'PENDING',
    description TEXT,
    reference_number VARCHAR(50) UNIQUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    processed_at TIMESTAMP NULL,
    source_account_id BIGINT,
    target_account_id BIGINT,
    FOREIGN KEY (source_account_id) REFERENCES accounts(id),
    FOREIGN KEY (target_account_id) REFERENCES accounts(id),
    INDEX idx_reference_number (reference_number),
    INDEX idx_source_account (source_account_id),
    INDEX idx_target_account (target_account_id),
    INDEX idx_created_at (created_at)
);

-- Add constraints for transaction validation
ALTER TABLE transactions 
ADD CONSTRAINT chk_amount_positive CHECK (amount > 0);

-- Create indexes for better performance
CREATE INDEX idx_transactions_date_status ON transactions(created_at, status);
CREATE INDEX idx_accounts_user_active ON accounts(user_id, is_active);