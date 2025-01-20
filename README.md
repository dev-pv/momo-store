# Momo Store aka Пельменная №2 (Учебный проект 2022)
#### **[https://momo-store.prokoshev.dev](https://momo-store.prokoshev.dev)**

Установка приложения:

```helm install momo-store infrastructure/kubernetes/momo-store-chart```

## Структура репозитория:

- Директории ```frontend``` и ```backend``` содержат исходный код приложения и докерфайлы для сборки приложения в Docker.
- Директория ```infrastructure``` содержит terraform файлы для создания ресурсов, необходимых для работы приложения в yandex облаке, а также kubernetes манифесты и helm-чарты для деплоя приложения и сопутствующих сервисов в кластере kubernetes.
- Корневая директория содержит .gitlab-ci.yaml файл конфигурации пайплайна автоматической сборки, доставки и деплоя приложения.

## CICD и инфраструктура:

- CICD пайплайн состоит из 4-х стадий:

  ``-test`` включает SAST тесты кода из стандартного набора SAST-gitlab.  
  ``-build`` включает сборку приложения в докере и пуш в registry.   
  ``-release`` включает присвоение latest тега образу и пуш в registry.   
  ``-deploy``включает пулл helm-чарта из registry и развертывание в кластере k8s.   
В пайплайне настроено версионирование сборки.

- Облачная инфраструктура развернута с помощью terraform в Яндекс облаке. Инфраструктура основана на следующих ресурсах:
1) Managed Service for Kubernetes 
2) Object Storage (Хранение состояния terraform и бакеты для файлов приложения)
3) Compute Cloud (ВМ для нод k8s и ВМ для раннера gitlab)
4) Registry (Для Docker образов и для Helm чартов) 
5) Certificate Manager (Приложение использует Let's Encrypt сертификаты)
6) Cloud DNS
7) Сетевые ресурсы и балансировщики   
[INFRA.JPG](https://storage.yandexcloud.net/momo-store-bucket/INFRA.JPG)

## Мониторинг:
Для мониторинга используется стек Prometheus/Trickster/Grafana. Все приложения стека мониторинга установлены в кластере k8s. Бэкенд приложения содержит необходимые экспортеры для prometheus. На основе метрик сделано 2 дашборда в grafana - [DASHBOARD.JPG](https://storage.yandexcloud.net/momo-store-bucket/DASHBOARD.JPG)




 



