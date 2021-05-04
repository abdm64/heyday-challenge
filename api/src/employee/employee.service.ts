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
         const q3queryNative = await getManager().query(`select "partner_name", sum("Voucher_Amount") as revenue  from
         voucher v join orders o
         on o."voucher_id" = v."voucher_id"
         group by "partner_name"
         order by revenue desc `)

//Q3
         const query3 = await getManager().createQueryBuilder()
                                               .addSelect('partner_name')
                                               .addSelect('SUM("Voucher_Amount")', 'revenue')
                                               .from(Voucher,'voucher')
                                               .innerJoin(Orders,'orders','voucher.voucher_id = orders.voucher_id')
                                               .addGroupBy('partner_name')
                                               .addOrderBy('revenue','DESC')
                                               .execute()

                                              

    //  1   console.log(orderBulder)
   

        const subQuery = await getManager().createQueryBuilder()
                                                 .addSelect('SUM("Voucher_Amount")', 'spent')   
                                                 .addSelect('orders."employee_id"','employeeid')  
                                                 .addSelect(`date_part('month',"OrderDate"  )`, "month")
                                                 .from(Voucher,'voucher')
                                                 .innerJoin(Orders,'orders','voucher.voucher_id = orders.voucher_id')
                                                 .addGroupBy('orders.employee_id') 
                                                 .addGroupBy(`date_part('month',"OrderDate")`)
                                              

                                             
    const query1Native = await getManager().query( `select "employee_id" ,"employee_Name","company_id","company_title","monthly_budget",depenser from employee e join (
                                                    select sum("Voucher_Amount") as depenser ,o."employee_id" as employeeid, date_part('month',"OrderDate"  )as mois
                                                    from voucher v join orders o
                                                    on o."voucher_id" = v."voucher_id"
                                                    group by o."employee_id", date_part('month',"OrderDate"  )) as subreq
                                                    on subreq.employeeid = "employee_id"
                                                    where "monthly_budget"-depenser >10 and mois = 2`)


                                               
                                                 
                                                
       const query1 = await getManager().createQueryBuilder()
                                        .addSelect(`"employee_Name"`)
                                        .addSelect("employee_id")
                                        .addSelect("company_title")
                                        .addSelect("monthly_budget")
                                        .addSelect("spent")
                                        .addFrom(Employee,'employee')
                                        .innerJoin('('+subQuery.getQuery()+')','subreq','subreq.employeeid = employee_id')
                                        .where(`"monthly_budget"- spent > 10 `)
                                        .andWhere('month = 3')
                                        .execute()


                                       
                                    
                                       

                                      //  console.log(query1)

       
       //Q2

       const query2Native =  await getManager().query(`select e."employee_id","employee_Name", "monthly_budget",date_part ('month',cast (o."OrderDate" as date) ) as month,cast(sum("Voucher_Amount") as integer) as spend,
       case when sum("Voucher_Amount")> 44 then False else TRUE end as tax_free
       from  employee e join  orders o on e."employee_id"=o."employee_id" join voucher v
       on o."voucher_id" = v."voucher_id"
       where "company_id"='3'
       group by e."employee_id","employee_Name","monthly_budget",date_part ('month',cast (o."OrderDate" as date) ) 
       order by cast(e."employee_id"as integer) ,month`)

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
                                        





       console.log(query2)

     ''

         
                    
         


    }


}
