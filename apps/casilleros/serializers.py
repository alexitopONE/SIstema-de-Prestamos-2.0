from rest_framework import serializers
from .models import EstadoCasillero, Casillero, TipoMovimiento, TipoPeriodo, PeriodoEscolar, AsignacionCasillero

class EstadoCasilleroSerializer(serializers.ModelSerializer):
    class Meta:
        model = EstadoCasillero
        fields = '__all__'

class CasilleroSerializer(serializers.ModelSerializer):
    class Meta:
        model = Casillero
        fields = '__all__'

class TipoMovimientoSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoMovimiento
        fields = '__all__'

class TipoPeriodoSerializer(serializers.ModelSerializer):
    class Meta:
        model = TipoPeriodo
        fields = '__all__'

class PeriodoEscolarSerializer(serializers.ModelSerializer):
    class Meta:
        model = PeriodoEscolar
        fields = '__all__'

class AsignacionCasilleroSerializer(serializers.ModelSerializer):
    class Meta:
        model = AsignacionCasillero
        fields = '__all__'