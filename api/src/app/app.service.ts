import { EmployeeInterface } from './models/employee.interface';
import { Revenue } from './models/revenu.interface';
import { Voucher } from './../voucher/voucher.entity';
import { getManager } from 'typeorm';
import { Injectable } from '@nestjs/common';
import { Orders } from './models/orders.entity';
import { Employee } from 'src/employee/employee.entity';




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



getTaxInformation ( company_id : number) {




}
}// 
