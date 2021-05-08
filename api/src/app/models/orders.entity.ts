
import { BaseEntity, Column, Entity, JoinColumn, ManyToOne, OneToOne, PrimaryGeneratedColumn } from "typeorm";
import {  Voucher  } from './voucher.entity'






@Entity()
export class Orders extends BaseEntity {

    @PrimaryGeneratedColumn() 
    orderId : number



    @Column()
    OrderDate: Date

    @Column()
  //  @OneToOne(())
    employee_id: number

    @Column()
    voucher_id : number

    


}