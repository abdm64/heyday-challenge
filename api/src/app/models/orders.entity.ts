
import { BaseEntity, Column, Entity, JoinColumn, ManyToOne, OneToOne, PrimaryGeneratedColumn } from "typeorm";






@Entity()
export class Orders extends BaseEntity {

    @PrimaryGeneratedColumn() 
    orderId : number



    @Column()
    OrderDate: Date

    @Column()
 
    employee_id: number

    @Column()
    voucher_id : number

    


}