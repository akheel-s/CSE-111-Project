import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { UserdecksService } from './userdecks.service';
import { CreateUserdeckDto } from './dto/create-userdeck.dto';
import { UpdateUserdeckDto } from './dto/update-userdeck.dto';
import { ApiTags } from '@nestjs/swagger';

@Controller('userdecks')
@Controller('userdecks')
@ApiTags('userdecks')
export class UserdecksController {
  constructor(private readonly userdecksService: UserdecksService) {}

  @Post()
  create(@Body() createUserdeckDto: CreateUserdeckDto) {
    return this.userdecksService.create(createUserdeckDto);
  }

  @Get()
  findAll() {
    return this.userdecksService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.userdecksService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateUserdeckDto: UpdateUserdeckDto,
  ) {
    return this.userdecksService.update(+id, updateUserdeckDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.userdecksService.remove(+id);
  }
}
