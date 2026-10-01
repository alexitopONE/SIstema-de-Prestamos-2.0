from django.urls import path, include
from rest_framework.routers import DefaultRouter
from .views import EstatusViewSet, PrestamoViewSet, EquipoPrestamoViewSet, MensajesViewSet

router = DefaultRouter()
router.register(r'estatus', EstatusViewSet)
router.register(r'prestamos', PrestamoViewSet)
router.register(r'equipos-prestamo', EquipoPrestamoViewSet)
router.register(r'mensajes', MensajesViewSet)

urlpatterns = [
    path('', include(router.urls)),
]