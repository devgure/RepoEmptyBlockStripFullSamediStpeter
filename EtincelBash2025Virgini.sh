#!/usr/bin/env bash
# scaffold-etincel.sh – recreate the *exact* folder & file skeleton for etincel-dating-app/
set -euo pipefail

###############################################################################
# helper: create empty file (and all parent dirs)
###############################################################################
touch_file() {
  mkdir -p "$(dirname "$1")"
  touch "$1"
}

###############################################################################
# Complete list of files (files only – directories are implied)
###############################################################################
files=(
  client/mobile-native/App.tsx
  client/mobile-native/assets/images/.gitkeep
  client/mobile-native/assets/icons/.gitkeep
  client/mobile-native/assets/theme.ts
  client/mobile-native/components/ui/.gitkeep
  client/mobile-native/components/SwipeCard.tsx
  client/mobile-native/screens/OnboardingScreen.tsx
  client/mobile-native/screens/LoginScreen.tsx
  client/mobile-native/screens/MatchScreen.tsx
  client/mobile-native/screens/SwipeScreen.tsx
  client/mobile-native/screens/ChatScreen.tsx
  client/mobile-native/screens/ProfileScreen.tsx
  client/mobile-native/navigation/AppNavigator.tsx
  client/mobile-native/navigation/types.ts
  client/mobile-native/hooks/useAuth.ts
  client/mobile-native/hooks/useMatches.ts
  client/mobile-native/services/apiClient.ts
  client/mobile-native/services/authService.ts
  client/mobile-native/services/chatService.ts
  client/mobile-native/i18n/locales/en.json
  client/mobile-native/i18n/locales/es.json
  client/mobile-native/i18n/locales/fr.json
  client/mobile-native/i18n/locales/ar.json
  client/mobile-native/i18n/i18n.ts
  client/mobile-native/utils/permissions.ts
  client/mobile-native/app.config.ts
  client/mobile-native/babel.config.js
  client/mobile-native/package.json

  client/mobile-web/public/manifest.json
  client/mobile-web/public/icons/.gitkeep
  client/mobile-web/src/pages/LoginPage.tsx
  client/mobile-web/src/pages/DiscoverPage.tsx
  client/mobile-web/src/pages/ChatPage.tsx
  client/mobile-web/src/pages/ProfilePage.tsx
  client/mobile-web/src/components/.gitkeep
  client/mobile-web/src/services/apiClient.ts
  client/mobile-web/src/services/pushService.ts
  client/mobile-web/src/i18n/i18n.ts
  client/mobile-web/src/App.tsx
  client/mobile-web/src/main.tsx
  client/mobile-web/vite.config.ts
  client/mobile-web/tsconfig.json
  client/mobile-web/index.html

  client/desktop-web/pages/index.tsx
  client/desktop-web/pages/swipe.tsx
  client/desktop-web/pages/chat.tsx
  client/desktop-web/pages/profile/[id].tsx
  client/desktop-web/pages/api/proxy/[...proxy].ts
  client/desktop-web/public/.gitkeep
  client/desktop-web/styles/globals.css
  client/desktop-web/components/.gitkeep
  client/desktop-web/lib/auth.ts
  client/desktop-web/lib/i18n.ts
  client/desktop-web/lib/theme.ts
  client/desktop-web/next-i18next.config.js
  client/desktop-web/next.config.js
  client/desktop-web/tsconfig.json

  gateway/kong/kong.yml
  gateway/kong/plugins/rate-limiting.conf
  gateway/kong/plugins/jwt-auth.conf
  gateway/kong/plugins/cors.conf
  gateway/bff-web/src/controllers/user.controller.ts
  gateway/bff-web/src/controllers/match.controller.ts
  gateway/bff-web/src/services/grpc-client.ts
  gateway/bff-web/src/middleware/auth.middleware.ts
  gateway/bff-web/src/main.ts
  gateway/bff-web/nest-cli.json
  gateway/bff-web/package.json
  gateway/bff-web/Dockerfile
  gateway/graphql/gateway.ts
  gateway/graphql/package.json
  gateway/graphql/Dockerfile

  services/auth-service/src/auth/auth.controller.ts
  services/auth-service/src/auth/auth.service.ts
  services/auth-service/src/auth/jwt.strategy.ts
  services/auth-service/src/user/user.controller.ts
  services/auth-service/src/user/user.service.ts
  services/auth-service/src/dto/login.dto.ts
  services/auth-service/src/dto/register.dto.ts
  services/auth-service/src/main.ts
  services/auth-service/package.json
  services/auth-service/Dockerfile
  services/auth-service/nest-cli.json

  services/profile-service/src/profile.controller.ts
  services/profile-service/src/profile.service.ts
  services/profile-service/src/preferences.module.ts
  services/profile-service/Dockerfile

  services/match-service/src/swipe.gateway.ts
  services/match-service/src/match.controller.ts
  services/match-service/src/match.engine.ts
  services/match-service/Dockerfile

  services/chat-service/src/chat.gateway.ts
  services/chat-service/src/message.schema.ts
  services/chat-service/src/chat.service.ts
  services/chat-service/Dockerfile

  services/discovery-service/src/location.service.ts
  services/discovery-service/src/search.controller.ts
  services/discovery-service/Dockerfile

  services/media-service/src/upload.controller.ts
  services/media-service/src/moderation.service.ts
  services/media-service/Dockerfile

  services/notification-service/src/fcm.service.ts
  services/notification-service/src/email.service.ts
  services/notification-service/src/push.gateway.ts
  services/notification-service/Dockerfile

  services/analytics-service/src/event.tracker.ts
  services/analytics-service/src/dashboard.controller.ts
  services/analytics-service/Dockerfile

  services/payment-service/src/controller/subscription.controller.ts
  services/payment-service/src/controller/webhooks.controller.ts
  services/payment-service/src/service/stripe.service.ts
  services/payment-service/src/dto/create-subscription.dto.ts
  services/payment-service/package.json
  services/payment-service/Dockerfile

  services/ai-service/app/recommend.py
  services/ai-service/app/nlp.py
  services/ai-service/app/face_verify.py
  services/ai-service/app/moderation.py
  services/ai-service/tests/test_face_verify.py
  services/ai-service/requirements.txt
  services/ai-service/Dockerfile
  services/ai-service/main.py

  prisma/schema.prisma
  prisma/seed.ts

  data/schemas/user.schema.json
  data/schemas/match.schema.json
  data/schemas/chat.schema.json
  data/migrations/001_create_users.sql
  data/migrations/002_add_preferences.json
  data/config/redis.config.ts
  data/config/mongo.config.ts
  data/config/postgres.config.ts
  data/config/elasticsearch.config.ts

  ai-engine/notebooks/recommendation_model.ipynb
  ai-engine/notebooks/facial_embedding_train.py
  ai-engine/notebooks/toxicity_classifier.ipynb
  ai-engine/models/face-recognition-v1.pkl
  ai-engine/scripts/retrain_matcher.py
  ai-engine/scripts/detect_toxicity.py
  ai-engine/utils/face_align.py
  ai-engine/README.md

  infra/k8s/deployments/auth-deployment.yaml
  infra/k8s/deployments/chat-deployment.yaml
  infra/k8s/deployments/ai-deployment.yaml
  infra/k8s/deployments/gateway-deployment.yaml
  infra/k8s/services/auth-service.yaml
  infra/k8s/services/ai-service.yaml
  infra/k8s/ingress/kong-ingress.yaml

  infra/terraform/main.tf
  infra/terraform/variables.tf
  infra/terraform/outputs.tf
  infra/terraform/modules/network/.gitkeep
  infra/terraform/modules/eks/.gitkeep

  infra/docker/docker-compose.yml

  monitoring/prometheus/prometheus.yml
  monitoring/grafana/dashboards/etincel-overview.json
  monitoring/logging/filebeat.yml
  monitoring/sentry/sentry.properties
  monitoring/alerts.yml

  tests/unit/auth.service.spec.ts
  tests/unit/match.engine.spec.ts
  tests/integration/chat.gateway.spec.ts

  tests/e2e/cypress/fixtures/.gitkeep
  tests/e2e/cypress/integration/login.spec.ts
  tests/e2e/cypress/integration/swipe-flow.spec.ts
  tests/e2e/cypress/cypress.json

  tests/e2e/playwright/tests/chat.spec.ts

  admin-dashboard/src/pages/UsersPage.tsx
  admin-dashboard/src/pages/ReportsPage.tsx
  admin-dashboard/src/pages/PaymentsPage.tsx
  admin-dashboard/src/pages/AnalyticsPage.tsx
  admin-dashboard/src/components/DataTable.tsx
  admin-dashboard/src/services/adminApi.ts
  admin-dashboard/src/App.tsx
  admin-dashboard/public/.gitkeep
  admin-dashboard/package.json
  admin-dashboard/vite.config.ts

  scripts/seed-db.ts
  scripts/backup-media.sh
  scripts/deploy-all.sh

  docs/ARCHITECTURE.md
  docs/API_SPECS.yaml
  docs/SECURITY.md
  docs/ROADMAP.md
  docs/CONTRIBUTING.md

  .gitignore
  docker-compose.yml
  Makefile
  package.json
  README.md
)

###############################################################################
# Create everything
###############################################################################
for f in "${files[@]}"; do
  touch_file "$f"
done

echo "✅ Etincel skeleton created successfully."