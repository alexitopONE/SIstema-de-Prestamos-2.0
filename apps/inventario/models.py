from django.db import models

class EstadoEquipo(models.Model):
    codigo = models.CharField(primary_key=True, max_length=20)
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'estado_equipo'

class Marca(models.Model):
    clave = models.CharField(primary_key=True, max_length=20)
    nombre = models.CharField(max_length=100)

    class Meta:
        managed = False
        db_table = 'marca'

class Modelo(models.Model):
    clave = models.AutoField(primary_key=True)
    nombre = models.CharField(max_length=100)
    marca = models.ForeignKey(Marca, models.DO_NOTHING, db_column='marca')

    class Meta:
        managed = False
        db_table = 'modelo'

class TipoEquipo(models.Model):
    codigo = models.CharField(primary_key=True, max_length=20)
    nombre = models.CharField(max_length=100)
    descripcion = models.TextField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tipo_equipo'

class Equipo(models.Model):
    codigo = models.AutoField(primary_key=True)
    codigo_barras = models.CharField(unique=True, max_length=100, blank=True, null=True)
    numero_serie = models.CharField(max_length=100, blank=True, null=True)
    nombre = models.CharField(max_length=150)
    num_inter = models.CharField(max_length=50, blank=True, null=True)
    ubicacion = models.CharField(max_length=150, blank=True, null=True)
    costo = models.DecimalField(max_digits=10, decimal_places=2, blank=True, null=True)
    num_utt = models.CharField(max_length=50, blank=True, null=True)
    rf_resguardo = models.CharField(max_length=50, blank=True, null=True)
    resguardante = models.CharField(max_length=50, blank=True, null=True)
    resguardo = models.CharField(max_length=100, blank=True, null=True)
    tipo_equipo = models.ForeignKey(TipoEquipo, models.DO_NOTHING, db_column='tipo_equipo')
    estado_equipo = models.ForeignKey(EstadoEquipo, models.DO_NOTHING, db_column='estado_equipo')
    marca = models.ForeignKey(Marca, models.DO_NOTHING, db_column='marca')

    class Meta:
        managed = False
        db_table = 'equipo'