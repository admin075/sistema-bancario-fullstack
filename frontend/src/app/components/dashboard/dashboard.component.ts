import { Component, OnInit } from '@angular/core';
import { Account } from '../../models/account.model';
import { Transaction } from '../../models/transaction.model';
import { AccountService } from '../../services/account.service';
import { TransactionService } from '../../services/transaction.service';

@Component({
  selector: 'app-dashboard',
  templateUrl: './dashboard.component.html',
  styleUrls: ['./dashboard.component.css']
})
export class DashboardComponent implements OnInit {
  accounts: Account[] = [];
  recentTransactions: Transaction[] = [];
  totalBalance = 0;
  loading = false;

  constructor(
    private accountService: AccountService,
    private transactionService: TransactionService
  ) { }

  ngOnInit(): void {
    this.loadDashboardData();
  }

  loadDashboardData(): void {
    this.loading = true;
    
    // Load user accounts
    this.accountService.getAccountsByUserId(1).subscribe({
      next: (accounts) => {
        this.accounts = accounts;
        this.calculateTotalBalance();
        this.loading = false;
      },
      error: (error) => {
        console.error('Error loading accounts:', error);
        this.loading = false;
      }
    });

    // Load recent transactions
    this.transactionService.getRecentTransactions(1, 5).subscribe({
      next: (transactions) => {
        this.recentTransactions = transactions;
      },
      error: (error) => {
        console.error('Error loading transactions:', error);
      }
    });
  }

  private calculateTotalBalance(): void {
    this.totalBalance = this.accounts.reduce((sum, account) => sum + account.balance, 0);
  }
}