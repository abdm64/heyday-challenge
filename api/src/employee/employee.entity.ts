
import { BaseEntity, Column, Entity, PrimaryGeneratedColumn } from "typeorm";







@Entity()
export class Employee extends BaseEntity {

    @PrimaryGeneratedColumn() 
    employee_id : number



    @Column()
    employee_Name : string

    @Column()
    monthly_budget : number

    @Column()
    company_id : string

    @Column()
    company_title : string






}