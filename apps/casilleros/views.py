from rest_framework import viewsets
from .models import EstadoCasillero, Casillero, TipoMovimiento, TipoPeriodo, PeriodoEscolar, AsignacionCasillero
from .serializers import EstadoCasilleroSerializer, CasilleroSerializer, TipoMovimientoSerializer, TipoPeriodoSerializer, PeriodoEscolarSerializer, AsignacionCasilleroSerializer

class EstadoCasilleroViewSet(viewsets.ModelViewSet):
    queryset = EstadoCasillero.objects.all()
    serializer_class = EstadoCasilleroSerializer

class CasilleroViewSet(viewsets.ModelViewSet):
    queryset = Casillero.objects.all()
    serializer_class = CasilleroSerializer

class TipoMovimientoViewSet(viewsets.ModelViewSet):
    queryset = TipoMovimiento.objects.all()
    serializer_class = TipoMovimientoSerializer

class TipoPeriodoViewSet(viewsets.ModelViewSet):
    queryset = TipoPeriodo.objects.all()
    serializer_class = TipoPeriodoSerializer

class PeriodoEscolarViewSet(viewsets.ModelViewSet):
    queryset = PeriodoEscolar.objects.all()
    serializer_class = PeriodoEscolarSerializer

class AsignacionCasilleroViewSet(viewsets.ModelViewSet):
    queryset = AsignacionCasillero.objects.all()
    serializer_class = AsignacionCasilleroSerializer