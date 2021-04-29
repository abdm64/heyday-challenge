import { EmployeeRepository } from './employee.repository';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Module } from '@nestjs/common';
import { EmployeeService } from './employee.service';
import { EmployeeController } from './employee.controller';


@Module({
  imports : [
      TypeOrmModule.forFeature([EmployeeRepository])
  ]  ,
  controllers : [EmployeeController],
  providers : [EmployeeService]

})
export class EmployeeModule {}
