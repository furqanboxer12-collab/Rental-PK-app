

┌──────────────────────────────────────┐
                      │    Client Presentation Layer         │
                      │  (Jetpack Compose / Flutter / RN)    │
                      └──────────────────┬───────────────────┘
                                         │
                      ┌──────────────────▼───────────────────┐
                      │      Security & Anti-Scam Guard      │
                      │ • NADRA 13-digit CNIC Validation     │
                      │ • Unverified Action Gatekeeper       │
                      │ • Anti-fraud EasyPaisa/JazzCash warns│
                      └──────────────────┬───────────────────┘
                                         │
        ┌────────────────────────────────┼────────────────────────────────┐
        │                                │                                │
┌───────▼──────────────┐      ┌──────────▼──────────┐         ┌───────────▼───────────┐
│ Identity & Auth Svc  │      │ Marketplace Core    │         │ Real-time Chat & P2P  │
│ • Google Sign-In     │      │ • Listing Lifecycle │         │ • WebSocket / FCFS    │
│ • Phone OTP (+92)    │      │ • PKR Pricing Engine│         │ • System Dial Intent  │
│ • Document Storage   │      │ • Geo & City Query  │         │ • Abuse & Report Svc  │
└──────────────────────┘      └─────────────────────┘         └───────────────────────┘

