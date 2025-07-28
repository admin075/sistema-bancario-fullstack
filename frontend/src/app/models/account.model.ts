export interface Account {
  id?: number;
  accountNumber: string;
  accountType: AccountType;
  balance: number;
  isActive: boolean;
  createdAt?: Date;
  updatedAt?: Date;
  userId: number;
}

export enum AccountType {
  CHECKING = 'CHECKING',
  SAVINGS = 'SAVINGS',
  BUSINESS = 'BUSINESS'
}

export interface AccountCreation {
  accountType: AccountType;
  userId: number;
}