from rest_framework import viewsets
from .models import Estatus, Prestamo, EquipoPrestamo, Mensajes
from .serializers import EstatusSerializer, PrestamoSerializer, EquipoPrestamoSerializer, MensajesSerializer

class EstatusViewSet(viewsets.ModelViewSet):
    queryset = Estatus.objects.all()
    serializer_class = EstatusSerializer

class PrestamoViewSet(viewsets.ModelViewSet):
    queryset = Prestamo.objects.all()
    serializer_class = PrestamoSerializer

class EquipoPrestamoViewSet(viewsets.ModelViewSet):
    queryset = EquipoPrestamo.objects.all()
    serializer_class = EquipoPrestamoSerializer

class MensajesViewSet(viewsets.ModelViewSet):
    queryset = Mensajes.objects.all()
    serializer_class = MensajesSerializer