
import { BaseEntity, Column, Entity, JoinColumn, ManyToOne, OneToOne, PrimaryGeneratedColumn } from "typeorm";
import { Employee  } from '../employee/employee.entity'







@Entity()
export class Order extends BaseEntity {

    @PrimaryGeneratedColumn() 
    orderId : number



    @Column()
    OrderDate: string

    @Column()
 
    employee_id: number

    @Column()
    voucher_id : number

    






}