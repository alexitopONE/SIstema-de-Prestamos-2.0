from rest_framework import viewsets
from .models import EstadoEquipo, Marca, Modelo, TipoEquipo, Equipo
from .serializers import EstadoEquipoSerializer, MarcaSerializer, ModeloSerializer, TipoEquipoSerializer, EquipoSerializer

class EstadoEquipoViewSet(viewsets.ModelViewSet):
    queryset = EstadoEquipo.objects.all()
    serializer_class = EstadoEquipoSerializer

class MarcaViewSet(viewsets.ModelViewSet):
    queryset = Marca.objects.all()
    serializer_class = MarcaSerializer

class ModeloViewSet(viewsets.ModelViewSet):
    queryset = Modelo.objects.all()
    serializer_class = ModeloSerializer

class TipoEquipoViewSet(viewsets.ModelViewSet):
    queryset = TipoEquipo.objects.all()
    serializer_class = TipoEquipoSerializer

class EquipoViewSet(viewsets.ModelViewSet):
    queryset = Equipo.objects.all()
    serializer_class = EquipoSerializer