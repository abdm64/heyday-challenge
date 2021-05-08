
import { BaseEntity, Column, Entity, OneToMany, PrimaryGeneratedColumn, getManager } from "typeorm";
import { Orders } from './orders.entity'
import {  Voucher  } from './voucher.entity'







@Entity()
export class Employee extends BaseEntity {

    @PrimaryGeneratedColumn() 
    
    employee_id : number



    @Column()
    employee_Name : string

    @Column()
    monthly_budget : number

    @Column()
    company_id : number

    @Column()
    company_title : string







}