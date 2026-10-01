from django.db import models

class EstadoCasillero(models.Model):
    codigo = models.CharField(primary_key=True, max_length=20)
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'estado_casillero'

class Casillero(models.Model):
    codigo = models.AutoField(primary_key=True)
    numero = models.CharField(unique=True, max_length=20)
    descripcion = models.TextField(blank=True, null=True)
    estado_casillero = models.ForeignKey(EstadoCasillero, models.DO_NOTHING, db_column='estado_casillero')

    class Meta:
        managed = False
        db_table = 'casillero'

class TipoMovimiento(models.Model):
    codigo = models.CharField(primary_key=True, max_length=20)
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tipo_movimiento'

class TipoPeriodo(models.Model):
    codigo = models.CharField(primary_key=True, max_length=20)
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tipo_periodo'

class PeriodoEscolar(models.Model):
    num = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    fecha_inicio = models.DateField()
    fecha_final = models.DateField()
    descripcion = models.TextField(blank=True, null=True)
    tipo_periodo = models.ForeignKey(TipoPeriodo, models.DO_NOTHING, db_column='tipo_periodo')

    class Meta:
        managed = False
        db_table = 'periodo_escolar'

class AsignacionCasillero(models.Model):
    num = models.AutoField(primary_key=True)
    folio = models.CharField(unique=True, max_length=50)
    llave = models.IntegerField(blank=True, null=True)
    estatus = models.CharField(max_length=50)
    descripcion = models.TextField(blank=True, null=True)
    usuarios = models.ForeignKey('usuarios.Usuarios', models.DO_NOTHING, db_column='usuarios')
    casillero = models.ForeignKey(Casillero, models.DO_NOTHING, db_column='casillero')
    tipo_movimiento = models.ForeignKey(TipoMovimiento, models.DO_NOTHING, db_column='tipo_movimiento')
    periodo_escolar = models.ForeignKey(PeriodoEscolar, models.DO_NOTHING, db_column='periodo_escolar')

    class Meta:
        managed = False
        db_table = 'asignacion_casillero'