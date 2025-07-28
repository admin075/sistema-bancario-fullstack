-- Sample data for banking system

-- Insert sample users
INSERT INTO users (first_name, last_name, email, password, phone_number) VALUES
('John', 'Doe', 'john.doe@email.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBaLdZfKGBzWDi', '+1234567890'),
('Jane', 'Smith', 'jane.smith@email.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBaLdZfKGBzWDi', '+1234567891'),
('Bob', 'Johnson', 'bob.johnson@email.com', '$2a$10$N.zmdr9k7uOCQb376NoUnuTJ8iAt6Z5EHsM8lE9lBaLdZfKGBzWDi', '+1234567892');

-- Insert sample accounts
INSERT INTO accounts (account_number, account_type, balance, user_id) VALUES
('ACC001234567890', 'CHECKING', 5000.00, 1),
('ACC001234567891', 'SAVINGS', 15000.00, 1),
('ACC001234567892', 'CHECKING', 3000.00, 2),
('ACC001234567893', 'BUSINESS', 25000.00, 3);

-- Insert sample transactions
INSERT INTO transactions (amount, transaction_type, status, description, reference_number, source_account_id, target_account_id, processed_at) VALUES
(1000.00, 'DEPOSIT', 'COMPLETED', 'Initial deposit', 'TXN001', NULL, 1, NOW()),
(500.00, 'WITHDRAWAL', 'COMPLETED', 'ATM withdrawal', 'TXN002', 1, NULL, NOW()),
(200.00, 'TRANSFER', 'COMPLETED', 'Transfer to savings', 'TXN003', 1, 2, NOW()),
(100.00, 'PAYMENT', 'COMPLETED', 'Utility bill payment', 'TXN004', 1, NULL, NOW());