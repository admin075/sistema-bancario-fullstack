export interface User {
  id?: number;
  firstName: string;
  lastName: string;
  email: string;
  password?: string;
  phoneNumber: string;
  createdAt?: Date;
  updatedAt?: Date;
}

export interface UserRegistration {
  firstName: string;
  lastName: string;
  email: string;
  password: string;
  phoneNumber: string;
}