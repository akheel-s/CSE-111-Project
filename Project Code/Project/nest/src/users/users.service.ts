import { Injectable } from '@nestjs/common';
import { PrismaService } from 'src/prisma/prisma.service';
import { CreateUserDto } from './dto/create-user.dto';
import { UpdateUserDto } from './dto/update-user.dto';

@Injectable()
export class UsersService {
  constructor(private prisma: PrismaService) {}

  create(createUserDto: CreateUserDto) {
    return 'This action adds a new user';
  }

  findAll() {
    return this.prisma.user.findMany();
  }

  findOne(id: number) {
    return this.prisma.user.findUnique({ where: { user_id: id } });
  }

  update(id: number, updateUserDto: UpdateUserDto) {
    return;
  }

  remove(id: number) {
    return `This action removes a #${id} user`;
  }
}
