import { Voucher } from './../voucher/voucher.entity';
import { Orders } from './../order/order.entity';
import { Injectable } from '@nestjs/common';
import { Employee} from './employee.entity'
import { Repository, getConnectionManager, getManager } from 'typeorm';
import { InjectRepository} from '@nestjs/typeorm';
import { CreateEmployeeInput } from './employee.input';

@Injectable()
export class EmployeeService {


    constructor(
        @InjectRepository(Employee) private employeeRepository : Repository<Employee>
    ){


    }


  async  getAllEmp() : Promise<Employee[]> {

       
        return   this.employeeRepository.find()
    }

    async getEmpById(employee_id: number) : Promise<Employee> {

        this.getEmpByCompanyId('AT')

        return this.employeeRepository.findOne({ employee_id })
    }

   async  addEmp(createEmpInput : CreateEmployeeInput) : Promise <Employee> {
        const {  employee_Name, monthly_budget, company_id, company_title  } = createEmpInput

       const createdEmp = this.employeeRepository.create({
            employee_Name,
            monthly_budget,
            company_id,
            company_title
        })
        
        return await  this.employeeRepository.save(createdEmp)


    }

    async getEmpByCompanyId(companyName : string) : Promise <any>{
         
//Q3
         const query3 = await getManager().createQueryBuilder()
                                               .addSelect('partner_name')
                                               .addSelect('SUM("Voucher_Amount")', 'revenue')
                                               .from(Voucher,'voucher')
                                               .innerJoin(Orders,'orders','voucher.voucher_id = orders.voucher_id')
                                               .addGroupBy('partner_name')
                                               .addOrderBy('revenue','DESC')
                                               .execute()

                                              

  
   

        const subQuery = await getManager().createQueryBuilder()
                                                 .addSelect('SUM("Voucher_Amount")', 'spent')   
                                                 .addSelect('orders."employee_id"','employeeid')  
                                                 .addSelect(`date_part('month',"OrderDate"  )`, "month")
                                                 .from(Voucher,'voucher')
                                                 .innerJoin(Orders,'orders','voucher.voucher_id = orders.voucher_id')
                                                 .addGroupBy('orders.employee_id') 
                                                 .addGroupBy(`date_part('month',"OrderDate")`)
                                              

                                             
  


                                               
                                                 
                                                
       const query1 = await getManager().createQueryBuilder()
                                        .select(`"employee_Name",employee_id, company_title,monthly_budget,spent`)
                                        .addFrom(Employee,'employee')
                                        .innerJoin('('+subQuery.getQuery()+')','subreq','subreq.employeeid = employee_id')
                                        .where(`"monthly_budget"- spent > 10 `)
                                        .andWhere('month = 3')
                                        .execute()


                                       
                                    
                                       

                                        console.log("1", query1)

       
       //Q2

      

       const company_id : number = 3
       
                                       
                                      

       const query2 = await getManager().createQueryBuilder()
                                         .select(`employee."employee_id","employee_Name",monthly_budget `)
                                         .addSelect(`date_part('month',orders."OrderDate"  )`, "month")
                                         .addSelect(`sum("Voucher_Amount")`,'spend')
                                         .addSelect('CASE WHEN  sum("Voucher_Amount") > 44 then False else TRUE END', 'tax_free')
                                         .addFrom(Employee,'employee')
                                         .innerJoin(Orders,'orders',`employee."employee_id"=orders."employee_id"`)
                                         .innerJoin(Voucher,'voucher',`orders."voucher_id" = voucher."voucher_id"`)
                                         .where(`"company_id"= ${company_id}`)
                                         .addGroupBy(`employee.employee_id`)
                                         .addGroupBy(`"employee_Name" , monthly_budget,date_part('month',orders."OrderDate") `)
                                         .addOrderBy('employee."employee_id", month')
                                         .execute()
                                        





   

     

         
                    
         


    }


}
