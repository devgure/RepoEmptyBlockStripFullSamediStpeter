tincel-dating-app/
│
├── 📁 client/                           # Cross-platform UIs
│   ├── 📁 mobile-native/                # React Native (iOS & Android)
│   │   ├── App.tsx
│   │   ├── assets/
│   │   │   ├── images/
│   │   │   ├── icons/
│   │   │   └── theme.ts                # Shared UI tokens
│   │   ├── components/
│   │   │   ├── ui/                     # Reusable components (Card, Button, Swipe)
│   │   │   └── SwipeCard.tsx
│   │   ├── screens/
│   │   │   ├── OnboardingScreen.tsx
│   │   │   ├── LoginScreen.tsx
│   │   │   ├── MatchScreen.tsx
│   │   │   ├── SwipeScreen.tsx
│   │   │   ├── ChatScreen.tsx
│   │   │   └── ProfileScreen.tsx
│   │   ├── navigation/
│   │   │   ├── AppNavigator.tsx
│   │   │   └── types.ts
│   │   ├── hooks/
│   │   │   ├── useAuth.ts
│   │   │   └── useMatches.ts
│   │   ├── services/
│   │   │   ├── apiClient.ts            # Axios instance with interceptors
│   │   │   ├── authService.ts
│   │   │   └── chatService.ts
│   │   ├── i18n/
│   │   │   ├── locales/
│   │   │   │   ├── en.json
│   │   │   │   ├── es.json
│   │   │   │   ├── fr.json
│   │   │   │   └── ar.json             # RTL support
│   │   │   └── i18n.ts                 # i18next config
│   │   ├── utils/
│   │   │   └── permissions.ts          # Location, camera, etc.
│   │   ├── app.config.ts               # Expo config
│   │   ├── babel.config.js
│   │   └── package.json
│   │
│   ├── 📁 mobile-web/                   # PWA (React + Vite)
│   │   ├── public/
│   │   │   ├── manifest.json           # PWA manifest
│   │   │   └── icons/
│   │   ├── src/
│   │   │   ├── pages/
│   │   │   │   ├── LoginPage.tsx
│   │   │   │   ├── DiscoverPage.tsx
│   │   │   │   ├── ChatPage.tsx
│   │   │   │   └── ProfilePage.tsx
│   │   │   ├── components/
│   │   │   ├── services/
│   │   │   │   ├── apiClient.ts
│   │   │   │   └── pushService.ts
│   │   │   ├── i18n/
│   │   │   │   └── i18n.ts
│   │   │   ├── App.tsx
│   │   │   └── main.tsx
│   │   ├── vite.config.ts
│   │   ├── index.html
│   │   └── tsconfig.json
│   │
│   └── 📁 desktop-web/                 # Next.js (SSR, PWA, Desktop)
│       ├── pages/
│       │   ├── index.tsx
│       │   ├── swipe.tsx
│       │   ├── chat.tsx
│       │   ├── profile/[id].tsx
│       │   └── api/
│       │       └── proxy/
│       │           └── [...proxy].ts   # BFF proxy (Next.js API Routes)
│       ├── public/
│       ├── styles/
│       │   └── globals.css
│       ├── components/
│       ├── lib/
│       │   ├── auth.ts
│       │   ├── i18n.ts
│       │   └── theme.ts
│       ├── next-i18next.config.js
│       ├── next.config.js
│       └── tsconfig.json
│
├── 📁 gateway/                          # API Gateway + BFF Layer
│   ├── 📁 kong/                         # Kong Gateway config
│   │   ├── kong.yml                     # Declarative config
│   │   └── plugins/
│   │       ├── rate-limiting.conf
│   │       ├── jwt-auth.conf
│   │       └── cors.conf
│   │
│   ├── 📁 bff-web/                      # Backend-for-Frontend (Web/Desktop)
│   │   ├── src/
│   │   │   ├── controllers/
│   │   │   │   ├── user.controller.ts
│   │   │   │   └── match.controller.ts
│   │   │   ├── services/
│   │   │   │   └── grpc-client.ts      # gRPC to microservices
│   │   │   ├── middleware/
│   │   │   │   └── auth.middleware.ts
│   │   │   └── main.ts                 # NestJS server
│   │   ├── nest-cli.json
│   │   ├── package.json
│   │   └── Dockerfile
│   │
│   └── 📁 graphql/                      # GraphQL Gateway (Apollo Federation)
│       ├── gateway.ts                  # Apollo Gateway
│       ├── package.json
│       └── Dockerfile
│
├── 📁 services/                         # Microservices (NestJS/Python)
│   ├── 📁 auth-service/
│   │   ├── src/
│   │   │   ├── auth/
│   │   │   │   ├── auth.controller.ts
│   │   │   │   ├── auth.service.ts
│   │   │   │   └── jwt.strategy.ts
│   │   │   ├── user/
│   │   │   │   ├── user.controller.ts
│   │   │   │   └── user.service.ts
│   │   │   ├── dto/
│   │   │   │   ├── login.dto.ts
│   │   │   │   └── register.dto.ts
│   │   │   └── main.ts
│   │   ├── package.json
│   │   ├── Dockerfile
│   │   └── nest-cli.json
│   │
│   ├── 📁 profile-service/
│   │   ├── src/
│   │   │   ├── profile.controller.ts
│   │   │   ├── profile.service.ts
│   │   │   └── preferences.module.ts
│   │   └── Dockerfile
│   │
│   ├── 📁 match-service/
│   │   ├── src/
│   │   │   ├── swipe.gateway.ts       # WebSocket events
│   │   │   ├── match.controller.ts
│   │   │   └── match.engine.ts        # Matching logic
│   │   └── Dockerfile
│   │
│   ├── 📁 chat-service/
│   │   ├── src/
│   │   │   ├── chat.gateway.ts        # Socket.IO / WebRTC
│   │   │   ├── message.schema.ts
│   │   │   └── chat.service.ts
│   │   └── Dockerfile
│   │
│   ├── 📁 discovery-service/
│   │   ├── src/
│   │   │   ├── location.service.ts    # Redis + PostGIS
│   │   │   └── search.controller.ts   # Elasticsearch integration
│   │   └── Dockerfile
│   │
│   ├── 📁 media-service/
│   │   ├── src/
│   │   │   ├── upload.controller.ts   # Cloudinary/S3
│   │   │   └── moderation.service.ts  # NSFW, blur, resize
│   │   └── Dockerfile
│   │
│   ├── 📁 notification-service/
│   │   ├── src/
│   │   │   ├── fcm.service.ts         # Firebase
│   │   │   ├── email.service.ts       # SendGrid
│   │   │   └── push.gateway.ts        # WebSocket → Push
│   │   └── Dockerfile
│   │
│   ├── 📁 analytics-service/
│   │   ├── src/
│   │   │   ├── event.tracker.ts       # Track DAU, swipes, matches
│   │   │   └── dashboard.controller.ts
│   │   └── Dockerfile
│   │
│   ├── 📁 payment-service/
│   │   ├── src/
│   │   │   ├── controller/
│   │   │   │   ├── subscription.controller.ts
│   │   │   │   └── webhooks.controller.ts  # Stripe
│   │   │   ├── service/
│   │   │   │   └── stripe.service.ts
│   │   │   └── dto/
│   │   │       └── create-subscription.dto.ts
│   │   ├── package.json
│   │   └── Dockerfile
│   │
│   └── 📁 ai-service/                  # Python-based AI Service
│       ├── app/
│       │   ├── recommend.py           # Smart matching
│       │   ├── nlp.py                 # Icebreaker suggestions
│       │   ├── face_verify.py         # Facial embedding (FaceNet)
│       │   └── moderation.py          # NSFW detection
│       ├── tests/
│       │   └── test_face_verify.py
│       ├── requirements.txt
│       ├── Dockerfile
│       └── main.py                    # FastAPI server
│
├── 📁 prisma/                           # ORM (PostgreSQL + MongoDB)
│   ├── schema.prisma                  # Unified schema
│   └── seed.ts                        # Seed script
│
├── 📁 data/
│   ├── 📁 schemas/
│   │   ├── user.schema.json
│   │   ├── match.schema.json
│   │   └── chat.schema.json
│   ├── 📁 migrations/                  # DB migrations
│   │   ├── 001_create_users.sql
│   │   └── 002_add_preferences.json
│   └── 📁 config/
│       ├── redis.config.ts
│       ├── mongo.config.ts
│       ├── postgres.config.ts
│       └── elasticsearch.config.ts
│
├── 📁 ai-engine/                        # AI Training & Models
│   ├── notebooks/
│   │   ├── recommendation_model.ipynb
│   │   ├── facial_embedding_train.py
│   │   └── toxicity_classifier.ipynb
│   ├── models/
│   │   └── face-recognition-v1.pkl    # Trained model
│   ├── scripts/
│   │   ├── retrain_matcher.py
│   │   └── detect_toxicity.py
│   ├── utils/
│   │   └── face_align.py
│   └── README.md
│
├── 📁 infra/                            # Infrastructure as Code
│   ├── 📁 k8s/                          # Kubernetes manifests
│   │   ├── deployments/
│   │   │   ├── auth-deployment.yaml
│   │   │   ├── chat-deployment.yaml
│   │   │   ├── ai-deployment.yaml
│   │   │   └── gateway-deployment.yaml
│   │   ├── services/
│   │   │   ├── auth-service.yaml
│   │   │   └── ai-service.yaml
│   │   └── ingress/
│   │       └── kong-ingress.yaml
│   │
│   ├── 📁 terraform/                   # Cloud provisioning (AWS/GCP)
│   │   ├── main.tf
│   │   ├── variables.tf
│   │   ├── outputs.tf
│   │   └── modules/
│   │       ├── network/
│   │       └── eks/                   # or GKE
│   │
│   └── 📁 docker/
│       └── docker-compose.yml          # Local dev setup
│
├── 📁 monitoring/
│   ├── 📁 prometheus/
│   │   └── prometheus.yml              # Scrape microservices
│   ├── 📁 grafana/
│   │   └── dashboards/
│   │       └── etincel-overview.json
│   ├── 📁 logging/
│   │   └── filebeat.yml
│   ├── 📁 sentry/
│   │   └── sentry.properties
│   └── alerts.yml                      # Alert rules
│
├── 📁 tests/
│   ├── 📁 unit/
│   │   ├── auth.service.spec.ts
│   │   └── match.engine.spec.ts
│   ├── 📁 integration/
│   │   └── chat.gateway.spec.ts
│   └── 📁 e2e/
│       ├── 📁 cypress/
│       │   ├── fixtures/
│       │   ├── integration/
│       │   │   ├── login.spec.ts
│       │   │   └── swipe-flow.spec.ts
│       │   └── cypress.json
│       └── 📁 playwright/              # Cross-browser
│           └── tests/
│               └── chat.spec.ts
│
├── 📁 admin-dashboard/                  # Internal Admin Panel
│   ├── src/
│   │   ├── pages/
│   │   │   ├── UsersPage.tsx
│   │   │   ├── ReportsPage.tsx
│   │   │   ├── PaymentsPage.tsx
│   │   │   └── AnalyticsPage.tsx
│   │   ├── components/
│   │   │   └── DataTable.tsx
│   │   ├── services/
│   │   │   └── adminApi.ts             # Calls internal APIs
│   │   └── App.tsx
│   ├── public/
│   ├── package.json
│   └── vite.config.ts
│
├── 📁 scripts/
│   ├── seed-db.ts                      # Populate dev DB
│   ├── backup-media.sh                 # Cron script
│   └── deploy-all.sh                   # CI helper
│
├── 📁 docs/
│   ├── ARCHITECTURE.md                 # System design
│   ├── API_SPECS.yaml                  # OpenAPI 3.0
│   ├── SECURITY.md                     # Auth, GDPR, BIPA
│   ├── ROADMAP.md
│   └── CONTRIBUTING.md
│
├── .gitignore
├── docker-compose.yml                  # Dev orchestration
├── Makefile                            # Handy commands
├── package.json                        # Root scripts
└── README.md                           # Project overview, setup guide