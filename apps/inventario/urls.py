from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import EstadoEquipoViewSet, MarcaViewSet, ModeloViewSet, TipoEquipoViewSet, EquipoViewSet

router = DefaultRouter()
router.register(r'estados-equipo', EstadoEquipoViewSet)
router.register(r'marcas', MarcaViewSet)
router.register(r'modelos', ModeloViewSet)
router.register(r'tipos-equipo', TipoEquipoViewSet)
router.register(r'equipos', EquipoViewSet)

urlpatterns = [
    path('', include(router.urls)),
]