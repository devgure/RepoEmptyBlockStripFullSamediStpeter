AUrora-dating-app/
│
├── 📁 client/                           # Cross-platform clients
│   ├── 📁 mobile-native/               # React Native (iOS/Android)
│   │   ├── 📄 App.tsx
│   │   ├── 📁 assets/
│   │   │   └── images/, fonts/, lottie/
│   │   ├── 📁 components/
│   │   │   ├── UI/
│   │   │   │   ├── Button.tsx
│   │   │   │   └── Card.tsx
│   │   │   └── Business/
│   │   │       ├── SwipeCard.tsx
│   │   │       └── ChatBubble.tsx
│   │   ├── 📁 screens/
│   │   │   ├── 📄 OnboardingScreen.tsx
│   │   │   ├── 📄 LoginScreen.tsx
│   │   │   ├── 📄 MatchScreen.tsx
│   │   │   ├── 📄 SwipeScreen.tsx
│   │   │   ├── 📄 ChatScreen.tsx
│   │   │   └── 📄 ProfileScreen.tsx
│   │   ├── 📁 navigation/
│   │   │   └── RootNavigator.tsx
│   │   ├── 📁 hooks/
│   │   │   ├── useAuth.ts
│   │   │   └── useLocation.ts
│   │   ├── 📁 services/
│   │   │   ├── 📄 apiClient.ts          # Axios instance
│   │   │   └── 📄 authService.ts
│   │   ├── 📁 i18n/
│   │   │   ├── 📄 en.json
│   │   │   ├── 📄 es.json
│   │   │   └── 📄 i18n.ts               # i18next config
│   │   └── 📄 app.config.ts             # Expo config / RN metadata
│   │
│   ├── 📁 mobile-web/                   # PWA (React + Vite)
│   │   ├── 📁 public/
│   │   │   └── manifest.json, icons/
│   │   ├── 📁 src/
│   │   │   ├── 📁 pages/
│   │   │   │   ├── 📄 LoginPage.tsx
│   │   │   │   ├── 📄 DiscoverPage.tsx
│   │   │   │   └── 📄 ChatPage.tsx
│   │   │   ├── 📁 components/           # Reusable across web/native
│   │   │   ├── 📁 services/
│   │   │   │   └── api.ts
│   │   │   ├── 📁 i18n/
│   │   │   │   └── index.ts
│   │   │   └── 📄 App.tsx
│   │   ├── 📄 vite.config.ts
│   │   └── 📄 index.html
│   │
│   └── 📁 desktop-web/                 # Next.js (SSR + Admin-ready)
│       ├── 📁 pages/
│       │   ├── 📄 index.tsx             # Homepage
│       │   ├── 📄 swipe.tsx             # Fullscreen swipe UI
│       │   ├── 📄 chat.tsx
│       │   └── 📁 api/                  # BFF / Proxy endpoints
│       │       └── 📄 [...proxy].ts     # Optional: proxy to gateway
│       ├── 📁 public/
│       ├── 📁 styles/
│       │   └── globals.css
│       ├── 📁 components/
│       ├── 📁 lib/
│       │   ├── 📄 auth.ts               # JWT, session helpers
│       │   └── 📄 i18n.ts
│       └── 📄 next.config.js
│
├── 📁 gateway/                          # API Gateway + BFF + GraphQL Federation
│   ├── 📁 kong/
│   │   ├── 📄 kong.yml                  # Declarative config
│   │   └── 📁 plugins/
│   │       ├── 📄 rate-limiting.conf
│   │       └── 📄 jwt-auth.conf
│   ├── 📁 bff-web/                      # Backend-for-Frontend (NestJS)
│   │   ├── 📁 src/
│   │   │   ├── 📁 controllers/
│   │   │   │   └── user.controller.ts
│   │   │   ├── 📁 services/
│   │   │   │   └── profile.service.ts
│   │   │   └── 📄 main.ts
│   │   └── 📄 nest-cli.json
│   └── 📁 graphql/                      # Apollo Gateway (federated schema)
│       └── 📄 gateway.ts
│
├── 📁 services/                         # Microservices (NestJS/Express/Python)
│   ├── 📁 auth-service/
│   │   ├── 📁 src/
│   │   │   ├── 📁 auth/
│   │   │   │   └── strategies/
│   │   │   │       └── jwt.strategy.ts
│   │   │   ├── 📁 user/
│   │   │   │   ├── user.controller.ts
│   │   │   │   └── user.service.ts
│   │   │   ├── 📄 main.ts
│   │   │   └── 📁 dto/
│   │   │       └── create-user.dto.ts
│   │   ├── 📄 package.json
│   │   └── 📄 Dockerfile
│   │
│   ├── 📁 profile-service/
│   │   ├── 📁 src/
│   │   │   ├── 📄 profile.controller.ts
│   │   │   ├── 📄 profile.service.ts
│   │   │   └── 📄 preferences.module.ts
│   │   └── 📄 Dockerfile
│   │
│   ├── 📁 match-service/
│   │   ├── 📁 src/
│   │   │   ├── 📄 swipe.gateway.ts      # WebSocket events
│   │   │   ├── 📄 match.controller.ts
│   │   │   └── 📄 match.engine.ts       # Business logic
│   │   └── 📄 Dockerfile
│   │
│   ├── 📁 chat-service/
│   │   ├── 📁 src/
│   │   │   ├── 📄 chat.gateway.ts       # Socket.IO / WebSocket
│   │   │   ├── 📄 message.schema.ts     # Mongoose schema
│   │   │   └── 📄 chat.service.ts
│   │   └── 📄 Dockerfile
│   │
│   ├── 📁 discovery-service/
│   │   ├── 📁 src/
│   │   │   ├── 📄 location.service.ts   # PostGIS / Geohash
│   │   │   └── 📄 search.controller.ts  # Elasticsearch queries
│   │   └── 📄 Dockerfile
│   │
│   ├── 📁 media-service/
│   │   ├── 📁 src/
│   │   │   ├── 📄 upload.controller.ts  # S3/MinIO upload
│   │   │   └── 📄 moderation.service.ts # AWS Rekognition / NSFW
│   │   └── 📄 Dockerfile
│   │
│   ├── 📁 notification-service/
│   │   ├── 📁 src/
│   │   │   ├── 📄 fcm.service.ts        # Firebase Cloud Messaging
│   │   │   └── 📄 email.service.ts      # SendGrid / SMTP
│   │   └── 📄 Dockerfile
│   │
│   ├── 📁 analytics-service/
│   │   ├── 📁 src/
│   │   │   ├── 📄 event.tracker.ts      # Track swipes, matches, messages
│   │   │   └── 📄 dashboard.controller.ts # Admin analytics API
│   │   └── 📄 Dockerfile
│   │
│   ├── 📁 payment-service/
│   │   ├── 📁 src/
│   │   │   ├── 📁 controller/
│   │   │   │   └── stripe.controller.ts
│   │   │   └── 📄 dashboard.controller.ts # Revenue stats
│   │   └── 📄 Dockerfile
│   │
│   └── 📁 ai-service/                  # Python FastAPI for AI/ML
│       ├── 📁 app/
│       │   ├── 📄 recommend.py          # User matching engine
│       │   ├── 📄 nlp.py                # Toxicity / icebreaker gen
│       │   ├── 📄 face_verify.py        # Facial recognition (OpenCV/Dlib)
│       │   └── 📄 moderation.py         # Image classification
│       ├── 📄 requirements.txt
│       ├── 📄 Dockerfile
│       └── 📄 main.py                   # FastAPI app entry
│
├── 📁 prisma/                           # ORM for PostgreSQL (User, Match, etc)
│   └── 📄 schema.prisma
│
├── 📁 data/
│   ├── 📁 schemas/                      # JSON Schemas (validation)
│   │   ├── 📄 user.schema.json
│   │   ├── 📄 match.schema.json
│   │   └── 📄 chat.schema.json
│   ├── 📁 migrations/                  # SQL migrations (PostgreSQL)
│   │   └── 📄 001_create_users.sql
│   └── 📁 config/
│       ├── 📄 redis.config.ts
│       ├── 📄 mongo.config.ts
│       └── 📄 elasticsearch.config.ts
│
├── 📁 ai-engine/                        # Jupyter, Models, Training Scripts
│   ├── 📁 notebooks/
│   │   ├── 📄 recommendation_model.ipynb
│   │   └── 📄 facial_embedding_train.py
│   ├── 📁 models/
│   │   └── 📄 face-recognition-v1.pkl
│   ├── 📁 scripts/
│   │   ├── 📄 retrain_matcher.py
│   │   └── 📄 detect_toxicity.py
│   └── 📄 README.md
│
├── 📁 infra/                            # IaC: Kubernetes, Terraform, Docker
│   ├── 📁 k8s/
│   │   ├── 📁 deployments/
│   │   │   ├── 📄 auth-deployment.yaml
│   │   │   ├── 📄 chat-deployment.yaml
│   │   │   └── 📄 ai-deployment.yaml
│   │   ├── 📁 services/
│   │   │   └── 📄 *.yaml
│   │   └── 📁 ingress/
│   │       └── 📄 kong-ingress.yaml
│   ├── 📁 terraform/
│   │   ├── 📄 main.tf
│   │   ├── 📄 variables.tf
│   │   └── 📄 outputs.tf
│   └── 📁 docker/
│       └── 📄 docker-compose.yml        # Local dev stack
│
├── 📁 monitoring/
│   ├── 📁 prometheus/
│   │   └── 📄 prometheus.yml
│   ├── 📁 grafana/
│   │   └── 📁 dashboards/
│   ├── 📁 logging/
│   │   └── 📄 filebeat.yml
│   └── 📁 sentry/
│       └── 📄 sentry.properties
│
├── 📁 tests/
│   ├── 📁 unit/
│   │   ├── 📄 auth.service.spec.ts
│   │   └── 📄 match.engine.spec.ts
│   ├── 📁 integration/
│   │   └── 📄 chat.gateway.spec.ts
│   └── 📁 e2e/
│       ├── 📁 cypress/
│       │   ├── 📁 fixtures/
│       │   ├── 📁 integration/
│       │   │   ├── 📄 login.spec.ts
│       │   │   └── 📄 swipe-flow.spec.ts
│       │   └── 📄 cypress.json
│       └── 📁 playwright/              # Optional cross-browser testing
│
├── 📁 admin-dashboard/                  # React Admin / Retool-like UI
│   ├── 📁 src/
│   │   ├── 📁 pages/
│   │   │   ├── 📄 UsersPage.tsx
│   │   │   ├── 📄 ReportsPage.tsx
│   │   │   └── 📄 AnalyticsPage.tsx
│   │   ├── 📁 components/
│   │   └── 📁 services/
│   │       └── 📄 adminApi.ts
│   └── 📄 package.json
│
├── 📁 scripts/
│   ├── 📄 seed-db.ts                   # Populate test users/matches
│   └── 📄 backup-media.sh              # Backup S3/MinIO assets
│
├── 📁 docs/
│   ├── 📄 ARCHITECTURE.md
│   ├── 📄 API_SPECS.yaml               # OpenAPI / Swagger
│   └── 📄 ROADMAP.md
│
├── 📁 blockchain/                      # 🆕 ADDED: Blockchain Identity & NFTs
│   ├── 📁 contracts/
│   │   ├── 📄 IdentityVerifier.sol     # Solidity: verify KYC/face hash
│   │   └── 📄 ProfileBadgeNFT.sol      # ERC-721 NFT Badges
│   ├── 📁 sdk/
│   │   └── 📄 web3.ts                  # Web3.js / Ethers.js helpers
│   ├── 📁 scripts/
│   │   └── 📄 deploy-contracts.js
│   └── 📄 README.md                    # Setup, testnets, wallets
│
├── 📄 .gitignore
├── 📄 docker-compose.yml               # Local dev: all services + DBs
├── 📄 Makefile                         # Shortcuts: make dev, make test, make deploy
└── 📄 README.md                        # Project overview, setup, runbook