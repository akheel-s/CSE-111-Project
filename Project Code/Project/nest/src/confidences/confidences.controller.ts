import {
  Controller,
  Get,
  Post,
  Body,
  Patch,
  Param,
  Delete,
} from '@nestjs/common';
import { ApiTags } from '@nestjs/swagger';
import { ConfidencesService } from './confidences.service';
import { CreateConfidenceDto } from './dto/create-confidence.dto';
import { UpdateConfidenceDto } from './dto/update-confidence.dto';

@Controller('confidences')
@ApiTags('confidences')
export class ConfidencesController {
  constructor(private readonly confidencesService: ConfidencesService) {}

  @Post()
  create(@Body() createConfidenceDto: CreateConfidenceDto) {
    return this.confidencesService.create(createConfidenceDto);
  }

  @Get()
  findAll() {
    return this.confidencesService.findAll();
  }

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.confidencesService.findOne(+id);
  }

  @Patch(':id')
  update(
    @Param('id') id: string,
    @Body() updateConfidenceDto: UpdateConfidenceDto,
  ) {
    return this.confidencesService.update(+id, updateConfidenceDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.confidencesService.remove(+id);
  }
}
