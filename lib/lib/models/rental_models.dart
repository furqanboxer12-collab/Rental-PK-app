emini

Act as a Senior Full-Stack Mobile App Developer and System Architect. I want to build and launch a secure Pakistani Rental Marketplace Mobile Application for Android (Google Play Store).

1. App Overview

App Name: Rental House, Car & Bike

Target Market: Pakistan (Localized for PK users)

Primary Purpose: A peer-to-peer (P2P) marketplace where users can list and rent out Houses/Apartments, Cars, and Motorcycles safely without scams.

2. User Authentication & Verification (Mandatory Sign-Up)

Users can only log in and post listings if they complete full verification:

Authentication: Gmail (Google Sign-In) OR Mobile Phone Number (OTP via SMS).

CNIC Verification:

Mandatory field for 13-digit Pakistani CNIC number.

Front & Back CNIC image upload for identity verification.

Anti-scam lock: Unverified profiles cannot post ads or initiate contact.

3. Core Features & Architecture

A. Listings & Categories

Categories: House / Flat, Car, Bike.

Add Listing Form:

Title, detailed description, daily/weekly/monthly rental price (in PKR).

High-resolution photo upload gallery (Up to 10 images).

Condition details, terms & conditions set by owner.

Location selection via integrated Pakistani Google Maps.

B. Location & Maps Integration

Full Pakistan Map integration (Google Maps SDK / Mapbox).

GPS location picker for sellers when posting an ad.

Distance-based search and filter for tenants/renters nearby.

C. Communication & Engagement

In-App Messaging: Secure real-time chat between renter and owner.

In-App Direct Calling: Voice calling or clickable verified phone number action.

Social Interaction:

Like button, star rating system (1 to 5 stars), and written reviews on each listing.

User review profile score to prevent fraudulent behavior.

D. Security, Privacy & Settings

Privacy Settings: Option to hide phone number, restrict direct calls, or enable chat-only mode.

Account Security: Block & Report user options, scam-alert safety banner on chat screens.

Data Protection: Compliance with Play Store User Data & Privacy Policy.

4. Technical Stack Recommendation

Frontend Framework: Flutter (Dart) or React Native (Cross-platform Android & iOS ready).

Backend Service: Firebase (Authentication, Firestore Database, Cloud Storage) or Node.js with PostgreSQL.

Maps API: Google Maps API & Places API.

5. Deliverables Required

Step-by-step App Architecture & System Design overview.

Complete Database Schema (Users, Listings, Verification, Reviews, Chats).

Production-ready code snippets for Flutter/React Native frontend UI screens.

Backend/Firebase integration setup guide ready for Play Store policy compliance.

Build an Android app

Gemini 3.8 FlashRan for 20m 15s

summarize_autoAction historychevron_right

Here are key actions taken for the app:

editEdited 21 files

app/src/main/res/drawable/ic_launcher_background.xml

check_circle

app/src/main/res/drawable/ic_launcher_foreground.xml

check_circle

metadata.json

check_circle

app/src/main/res/values/strings.xml

check_circle

settings.gradle.kts

check_circle

app/build.gradle.kts

check_circle

app/src/main/AndroidManifest.xml

check_circle

app/src/main/java/com/example/ui/theme/Color.kt

check_circle

app/src/main/java/com/example/ui/theme/Theme.kt

check_circle

app/src/main/java/com/example/model/RentalModels.kt

check_circle

app/src/main/java/com/example/data/RentalRepository.kt

check_circle

app/src/main/java/com/example/ui/components/CommonComponents.kt

check_circle

app/src/main/java/com/example/ui/screens/HomeScreen.kt

check_circle

app/src/main/java/com/example/ui/screens/ListingDetailScreen.kt

check_circle

app/src/main/java/com/example/ui/screens/CnicVerificationScreen.kt

check_circle

app/src/main/java/com/example/ui/screens/CreateListingScreen.kt

check_circle

app/src/main/java/com/example/ui/screens/ChatScreens.kt

check_circle

app/src/main/java/com/example/ui/screens/ProfileScreen.kt

check_circle

app/src/main/java/com/example/MainActivity.kt

check_circle

app/src/test/java/com/example/ExampleUnitTest.kt

check_circle

app/src/test/java/com/example/ExampleRobolectricTest.kt

check_circle

buildBuilt

System Architecture & Technical Specification: Pakistani Rental Marketplace

The Rental House, Car & Bike Android application has been built and compiled in your project. It includes end-to-end support for Pakistani peer-to-peer (P2P) rentals across Karachi, Lahore, Islamabad, Rawalpindi, Peshawar, and other major cities.

1. App Architecture & System Design Overview

codeCode

┌──────────────────────────────────────┐ │ Client Presentation Layer │ │ (Jetpack Compose / Flutter / RN) │ └──────────────────┬───────────────────┘ │ ┌──────────────────▼───────────────────┐ │ Security & Anti-Scam Guard │ │ • NADRA 13-digit CNIC Validation │ │ • Unverified Action Gatekeeper │ │ • Anti-fraud EasyPaisa/JazzCash warns│ └──────────────────┬───────────────────┘ │ ┌────────────────────────────────┼────────────────────────────────┐ │ │ │ ┌───────▼──────────────┐ ┌──────────▼──────────┐ ┌───────────▼───────────┐ │ Identity & Auth Svc │ │ Marketplace Core │ │ Real-time Chat & P2P │ │ • Google Sign-In │ │ • Listing Lifecycle │ │ • WebSocket / FCFS │ │ • Phone OTP (+92) │ │ • PKR Pricing Engine│ │ • System Dial Intent │ │ • Document Storage │ │ • Geo & City Query │ │ • Abuse & Report Svc │ └──────────────────────┘ └─────────────────────┘ └───────────────────────┘

Key Architectural Pillars

Anti-Scam Gatekeeper (Zero-Trust Model):

Unverified accounts are strictly restricted to read-only mode.

Any attempt to publish an ad, message an owner, or view masked phone numbers triggers an AntiScamLock modal directing the user to complete verification first.

Pakistani Localization:

Currency: Pakistani Rupee (PKR) formatted with daily, weekly, and monthly rates.

ID Validation: Strict 13-digit Pakistani CNIC pattern matching (XXXXX-XXXXXXX-X) with province code parsing.

Privacy Controls: Toggle for "Hide Phone Number" and "Chat-Only Mode" to prevent unsolicited cold calling.

Play Store Data Safety & Zero-Permission Media:

Avoids legacy READ_EXTERNAL_STORAGE or READ_MEDIA_IMAGES permissions by implementing the modern Android Photo Picker (ActivityResultContracts.PickVisualMedia).

CNIC documents are kept in restricted cloud storage buckets accessible only by automated verification workers.

2. Complete Database Schema

Option A: PostgreSQL / Relational Schema

codeSQL

-- 1. Users Table CREATE TABLE users ( id UUID PRIMARY KEY DEFAULT gen_random_uuid(), full_name VARCHAR(100) NOT NULL, email VARCHAR(150) UNIQUE, phone VARCHAR(20) UNIQUE NOT NULL, -- e.g., +923001234567 cnic_number VARCHAR(15) UNIQUE, -- e.g., 42101-1234567-1 verification_status VARCHAR(20) DEFAULT 'UNVERIFIED' CHECK (verification_status IN ('UNVERIFIED', 'PENDING', 'VERIFIED', 'REJECTED')), trust_score NUMERIC(3,2) DEFAULT 5.00, reviews_count INT DEFAULT 0, hide_phone BOOLEAN DEFAULT FALSE, chat_only_mode BOOLEAN DEFAULT FALSE, created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() ); -- 2. CNIC Verifications Table CREATE TABLE cnic_verifications ( id UUID PRIMARY KEY DEFAULT gen_random_uuid(), user_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE, cnic_front_url TEXT NOT NULL, cnic_back_url TEXT NOT NULL, extracted_cnic VARCHAR(15), nadra_match_score NUMERIC(3,2), submitted_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(), reviewed_at TIMESTAMP WITH TIME ZONE, status VARCHAR(20) DEFAULT 'PENDING' ); -- 3. Listings Table (Houses, Cars, Bikes) CREATE TABLE listings ( id UUID PRIMARY KEY DEFAULT gen_random_uuid(), owner_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE, category VARCHAR(20) NOT NULL CHECK (category IN ('HOUSE', 'CAR', 'BIKE')), title VARCHAR(150) NOT NULL, description TEXT NOT NULL, price_daily BIGINT NOT NULL, -- In PKR price_weekly BIGINT, -- In PKR price_monthly BIGINT, -- In PKR city VARCHAR(50) NOT NULL, -- e.g., Islamabad, Lahore, Karachi area VARCHAR(100) NOT NULL, -- e.g., DHA Phase 6, Gulberg III latitude NUMERIC(10, 7), longitude NUMERIC(10, 7), condition_status VARCHAR(50) NOT NULL, amenities JSONB DEFAULT '[]'::jsonb, terms_and_conditions TEXT NOT NULL, photos JSONB NOT NULL DEFAULT '[]'::jsonb, -- Array of URLs (up to 10) is_active BOOLEAN DEFAULT TRUE, created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() ); -- 4. Reviews & Ratings Table CREATE TABLE reviews ( id UUID PRIMARY KEY DEFAULT gen_random_uuid(), listing_id UUID NOT NULL REFERENCES listings(id) ON DELETE CASCADE, reviewer_id UUID NOT NULL REFERENCES users(id) ON DELETE CASCADE, rating INT NOT NULL CHECK (rating BETWEEN 1 AND 5), comment TEXT NOT NULL, is_verified_rental BOOLEAN DEFAULT TRUE, created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() ); -- 5. Chats & Messages CREATE TABLE chat_threads ( id UUID PRIMARY KEY DEFAULT gen_random_uuid(), listing_id UUID NOT NULL REFERENCES listings(id) ON DELETE CASCADE, renter_id UUID NOT NULL REFERENCES users(id), owner_id UUID NOT NULL REFERENCES users(id), last_message TEXT, last_message_at TIMESTAMP WITH TIME ZONE DEFAULT NOW(), UNIQUE(listing_id, renter_id, owner_id) ); CREATE TABLE messages ( id UUID PRIMARY KEY DEFAULT gen_random_uuid(), thread_id UUID NOT NULL REFERENCES chat_threads(id) ON DELETE CASCADE, sender_id UUID NOT NULL REFERENCES users(id), message_text TEXT NOT NULL, created_at TIMESTAMP WITH TIME ZONE DEFAULT NOW() );

Option B: Firebase Firestore NoSQL Structure

users/{userId}: { fullName, phone, email, cnicNumber, verificationStatus: "VERIFIED", hidePhone: false, chatOnlyMode: false }

cnic_documents/{userId}: (Restricted Bucket/Collection) { frontStorageUri, backStorageUri, uploadedAt, verifiedAt }

listings/{listingId}: { ownerId, category: "HOUSE"|"CAR"|"BIKE", title, priceDailyPKR, priceMonthlyPKR, city, area, photos: [], amenities: [], isOwnerVerified: true }

reviews/{listingId}/userReviews/{reviewId}: { reviewerName, rating: 5, comment, date }

chats/{chatId}: { listingId, renterId, ownerId, lastMessage, updatedAt }

chats/{chatId}/messages/{msgId}: { senderId, text, timestamp }

3. Cross-Platform UI Code Snippets

Flutter (Dart): Pakistani CNIC Input Formatter & Anti-Scam Lock Guard

codeDart

import 'package:flutter/material.dart'; import 'package:flutter/services.dart'; // 1. Pakistani CNIC Masking Formatter: XXXXX-XXXXXXX-X class PakistaniCnicFormatter extends TextInputFormatter { @override TextEditingValue formatEditUpdate( TextEditingValue oldValue, TextEditingValue newValue, ) { var text = newValue.text.replaceAll(RegExp(r'\D'), ''); if (text.length > 13) text = text.substring(0, 13); var buffer = StringBuffer(); for (int i = 0; i < text.length; i++) { buffer.write(text[i]); if ((i == 4 || i == 11) && i != text.length - 1) { buffer.write('-'); } } return TextEditingValue( text: buffer.toString(), selection: TextSelection.collapsed(offset: buffer.length), ); } } // 2. Anti-Scam Action Gatekeeper void executeVerifiedOnlyAction(BuildContext context, bool isVerified, VoidCallback action) { if (isVerified) { action(); } else { showDialog( context: context, builder: (ctx) => AlertDialog( icon: const Icon(Icons.shield_outlined, color: Color(0xFF0F7645), size: 48), title: const Text("CNIC Verification Required"), content: const Text( "To protect Pakistani tenants and owners from token payment scams, you must verify your 13-digit Pakistani CNIC before posting ads or contacting owners." ), actions: [ TextButton(onPressed: () => Navigator.pop(ctx), child: const Text("Later")), ElevatedButton( style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF0A5C36)), onPressed: () { Navigator.pop(ctx); Navigator.pushNamed(context, '/cnic-verification'); }, child: const Text("Verify CNIC Now", style: TextStyle(color: Colors.white)), ), ], ), ); } }



