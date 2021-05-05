import { EmployeeResolver } from './resolvers/employee.resolver';

import { Module } from '@nestjs/common';
import { AppService } from './app.service';
import { RevenueResolver } from './resolvers/revenue.resolver'




@Module({
  providers: [AppService, RevenueResolver,EmployeeResolver ]
})
export class MainModule {

  
}
