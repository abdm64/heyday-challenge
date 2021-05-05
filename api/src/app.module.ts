import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { typeOrmConfig  } from './config/typeorm.config';
import { EmployeeModule } from './employee/employee.module';
import { GraphQLModule } from '@nestjs/graphql'
import { MainModule } from './app/main.module'



@Module({
  imports: [
    TypeOrmModule.forRoot(typeOrmConfig ), 
    MainModule,
    GraphQLModule.forRoot({
      autoSchemaFile: true,
    }),
    EmployeeModule
    
  
  
  
  ],
 
})
export class AppModule {}
