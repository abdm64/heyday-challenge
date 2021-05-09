
import { BaseEntity, Column, Entity, JoinColumn, ManyToOne, OneToOne, PrimaryGeneratedColumn } from "typeorm";








@Entity()
export class Voucher extends BaseEntity {

    @PrimaryGeneratedColumn() 
    voucher_id : number



    @Column()
    Voucher_Amount: number

   

    @Column()
    partner_id : number
    @Column()
    partner_name : string

   






}