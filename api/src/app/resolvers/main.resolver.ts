import { NotFoundException } from '@nestjs/common';
import { Resolver, Mutation, Args, Query } from '@nestjs/graphql';




@Resolver(of => EmployeeType)
export class EmployeeResolver  {

    constructor(private _empService : EmployeeService){



    }


    @Query(returns => [EmployeeType])
   getEmployee (){
    
       
        return   this._empService.getAllEmp()
    }

    @Query( returns => EmployeeType)
    getEmployeeById (
        @Args('employee_id')  id : number
    ) {
        const employee =  this._empService.getEmpById(id)
            if (employee) {
                return employee
            } else {

                throw new  NotFoundException()
            }
    }

    @Mutation(returns  => EmployeeType)
    addEmp(
        @Args('createEmpInput') createNewEmp :  CreateEmployeeInput
    ){

        return this._empService.addEmp(createNewEmp)

    }



}//
