
import { EmployeeInterface } from './models/interfaces/employee.interface';
import { Revenue } from './models/interfaces/revenu.interface';
import { Voucher } from './models/entities/voucher.entity';
import { getManager } from 'typeorm';
import { Injectable } from '@nestjs/common';
import { Orders } from './models/entities/orders.entity';
import { Employee } from './models/entities/employee.entity';
import { TaxInformationType } from './models/interfaces/tax.interface';




@Injectable()
export class AppService {




    
async getRevenueByPartner() : Promise <Revenue[]>{
    
    const revenueByPartner : Revenue[] = await getManager().createQueryBuilder()
    .addSelect('partner_name')
    .addSelect('SUM("Voucher_Amount")', 'revenue')
    .from(Voucher,'voucher')
    .innerJoin(Orders,'orders','voucher.voucher_id = orders.voucher_id')
    .addGroupBy('partner_name')
    .addOrderBy('revenue','DESC')
    .execute()



    return revenueByPartner





}


async getEmployeeByMonth( month : number) : Promise<EmployeeInterface[]> {

    const subQuery = await getManager().createQueryBuilder()
                                                 .addSelect('SUM("Voucher_Amount")', 'spent')   
                                                 .addSelect('orders."employee_id"','employeeid')  
                                                 .addSelect(`date_part('month',"OrderDate"  )`, "month")
                                                 .from(Voucher,'voucher')
                                                 .innerJoin(Orders,'orders','voucher.voucher_id = orders.voucher_id')
                                                 .addGroupBy('orders.employee_id') 
                                                 .addGroupBy(`date_part('month',"OrderDate")`)


    const employeeByComapny : EmployeeInterface[] = await getManager().createQueryBuilder()
                                                .select(`"employee_Name",employee_id, company_title,monthly_budget,spent`)
                                                .addFrom(Employee,'employee')
                                                .innerJoin('('+subQuery.getQuery()+')','subreq','subreq.employeeid = employee_id')
                                                .where(`"monthly_budget"- spent > 10 `)
                                                .andWhere( `month = ${month}`)
                                                .execute()

                                                




 return employeeByComapny
}



 async getTaxInformation ( company_id : number) : Promise<TaxInformationType[]> {

    const taxInformation : TaxInformationType[]  = await getManager().createQueryBuilder()
    .select(`employee."employee_id","employee_Name",monthly_budget , 44 as freeTaxLimit`)
    .addSelect(`date_part('month',orders."OrderDate"  )`, "month")
    .addSelect(`sum("Voucher_Amount")`,'spent')
    .addSelect('sum("Voucher_Amount") - 44', 'overTaxLimit')
    .addSelect('CASE WHEN  sum("Voucher_Amount") > 44 then  ((sum("Voucher_Amount") - 44 ) * 33/100 )  else 0 END', 'tax')
    .addSelect(`CASE WHEN ((sum("Voucher_Amount") - 44 ) * 33/100 ) > 0  then (sum("Voucher_Amount") - 44 ) - ((sum("Voucher_Amount") - 44 ) * 33/100 ) else  0 END`, 'net')
    .addFrom(Employee,'employee')
    .innerJoin(Orders,'orders',`employee."employee_id"=orders."employee_id"`)
    .innerJoin(Voucher,'voucher',`orders."voucher_id" = voucher."voucher_id"`)
    .where(`"company_id"= ${company_id}`)
    .addGroupBy(`employee.employee_id`)
    .addGroupBy(`"employee_Name" , monthly_budget,date_part('month',orders."OrderDate") `)
    .addOrderBy('employee."employee_id", month')

    .execute()



   


    return taxInformation
}
}// 
