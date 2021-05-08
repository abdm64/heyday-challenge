
import { EmployeeType } from './graphql/employee.type';
import { RevenueType  } from './graphql/revenu.type';
import { Voucher } from './models/voucher.entity';
import { getManager } from 'typeorm';
import { Injectable, NotFoundException } from '@nestjs/common';
import { Orders } from './models/orders.entity';
import { Employee } from './models/employee.entity';
import { TaxType } from './graphql/tax.type';




@Injectable()
export class AppService {




    
async getRevenueByPartner() : Promise <RevenueType[]>{
    
    const revenueByPartner : RevenueType[] = await getManager().createQueryBuilder()
    .addSelect('partner_name')
    .addSelect('SUM("Voucher_Amount")', 'revenue')
    .from(Voucher,'voucher')
    .innerJoin(Orders,'orders','voucher.voucher_id = orders.voucher_id')
    .addGroupBy('partner_name')
    .addOrderBy('revenue','DESC')
    .execute()



    return revenueByPartner





}


async getEmployeeByMonth( month : number) : Promise<EmployeeType[]> {

    const subQuery = await getManager().createQueryBuilder()
                                                 .addSelect('SUM("Voucher_Amount")', 'spent')   
                                                 .addSelect('orders."employee_id"','employeeid')  
                                                 .addSelect(`date_part('month',"OrderDate"  )`, "month")
                                                 .from(Voucher,'voucher')
                                                 .innerJoin(Orders,'orders','voucher.voucher_id = orders.voucher_id')
                                                 .addGroupBy('orders.employee_id') 
                                                 .addGroupBy(`date_part('month',"OrderDate")`)


    const employeeByComapny : EmployeeType[] = await getManager().createQueryBuilder()
                                                .select(`"employee_Name",employee_id, company_title,monthly_budget,spent`)
                                                .addFrom(Employee,'employee')
                                                .innerJoin('('+subQuery.getQuery()+')','subreq','subreq.employeeid = employee_id')
                                                .where(`"monthly_budget"- spent > 10 `)
                                                .andWhere( `month = ${month}`)
                                                .execute()

                                                
                                             
        if ( employeeByComapny.length === 0 ){

             throw new NotFoundException(`can't found employee in this month ${ month} that left more than 10 euro`);
         } 
                                            


 return employeeByComapny
}

// || 

 async getTaxInformation ( company_id : number) : Promise<TaxType []> {

    const taxInformation : TaxType[]  = await getManager().createQueryBuilder()
    .select(`employee."employee_id","employee_Name",monthly_budget , 44 as freeTaxLimit`)
    .addSelect(`date_part('month',orders."OrderDate"  )`, "month")
    .addSelect(`sum("Voucher_Amount")`,'spent')
    .addSelect(' CASE WHEN (sum("Voucher_Amount") - 44) > 0  then  (sum("Voucher_Amount") - 44) else 0 END', 'overTaxLimit')
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


    if ( taxInformation.length === 0 ){

        throw new NotFoundException(`can't found tax information for employees in the company with company_id = ${company_id} `);
    } 



    return taxInformation
}
}// 
