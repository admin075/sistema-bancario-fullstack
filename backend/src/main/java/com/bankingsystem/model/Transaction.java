package com.bankingsystem.model;

import javax.persistence.*;
import javax.validation.constraints.DecimalMin;
import javax.validation.constraints.NotNull;
import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
@Table(name = "transactions")
public class Transaction {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    
    @NotNull
    @DecimalMin(value = "0.01")
    private BigDecimal amount;
    
    @Enumerated(EnumType.STRING)
    private TransactionType transactionType;
    
    @Enumerated(EnumType.STRING)
    private TransactionStatus status;
    
    private String description;
    private String referenceNumber;
    private LocalDateTime createdAt;
    private LocalDateTime processedAt;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "source_account_id")
    private Account sourceAccount;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "target_account_id")
    private Account targetAccount;
    
    public enum TransactionType {
        DEPOSIT, WITHDRAWAL, TRANSFER, PAYMENT
    }
    
    public enum TransactionStatus {
        PENDING, COMPLETED, FAILED, CANCELLED
    }
    
    // Constructors
    public Transaction() {
        this.status = TransactionStatus.PENDING;
        this.createdAt = LocalDateTime.now();
    }
    
    // Getters and setters
    public Long getId() { return id; }
    public void setId(Long id) { this.id = id; }
    
    public BigDecimal getAmount() { return amount; }
    public void setAmount(BigDecimal amount) { this.amount = amount; }
    
    public TransactionType getTransactionType() { return transactionType; }
    public void setTransactionType(TransactionType transactionType) { this.transactionType = transactionType; }
    
    public TransactionStatus getStatus() { return status; }
    public void setStatus(TransactionStatus status) { this.status = status; }
    
    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
    
    public String getReferenceNumber() { return referenceNumber; }
    public void setReferenceNumber(String referenceNumber) { this.referenceNumber = referenceNumber; }
    
    public LocalDateTime getCreatedAt() { return createdAt; }
    public void setCreatedAt(LocalDateTime createdAt) { this.createdAt = createdAt; }
    
    public LocalDateTime getProcessedAt() { return processedAt; }
    public void setProcessedAt(LocalDateTime processedAt) { this.processedAt = processedAt; }
    
    public Account getSourceAccount() { return sourceAccount; }
    public void setSourceAccount(Account sourceAccount) { this.sourceAccount = sourceAccount; }
    
    public Account getTargetAccount() { return targetAccount; }
    public void setTargetAccount(Account targetAccount) { this.targetAccount = targetAccount; }
}