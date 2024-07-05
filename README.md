# Home Brigadier App

<img src="https://github.com/muhammadusmantech/Home-Brigadier/blob/main/assets/launcher/ic_launcher.png" alt="Home Brigadier" width="300" />

## Overview

**Home Brigadier** is a household service provider app that allows users to book and customize various household services. It offers an efficient platform for service providers and clients to connect and manage their service needs.

## Features

- **Seller and Buyer Sites:** Separate interfaces for service providers and clients.
- **Create Booking:** Easily create bookings for various services.
- **Booking Customization:** Customize bookings to fit specific needs.
- **Adjust Price:** Modify service prices as needed.
- **Select Favorite Seller:** Choose and save favorite service providers.
- **Schedule Appointments:** Set up and manage service appointments.
- **Make Payment:** Pay using Apple Pay or Google Pay.
- **Create Service:** Anyone can create a service and start earning.

## Frameworks and Technologies

- **Framework:** Flutter
- **Tools:** Git, Stripe Payment, CI/CD, Firebase Messaging, and more.

## Screenshots

<img src="https://github.com/muhammadusmantech/Home-Brigadier/blob/main/assets/screenshot/WhatsApp%20Image%202024-07-05%20at%2009.20.31_3fad4276.jpg" alt="Screenshot 1" width="200"/>
<img src="https://github.com/muhammadusmantech/Home-Brigadier/blob/main/assets/screenshot/WhatsApp%20Image%202024-07-05%20at%2009.20.31_1af8b9aa.jpg" alt="Screenshot 2" width="200"/>
<img src="https://github.com/muhammadusmantech/Home-Brigadier/blob/main/assets/screenshot/WhatsApp%20Image%202024-07-05%20at%2009.20.30_cc75d58f.jpg" alt="Screenshot 3" width="200"/>
<img src="https://github.com/muhammadusmantech/Home-Brigadier/blob/main/assets/screenshot/WhatsApp%20Image%202024-07-05%20at%2009.20.30_6e153d49.jpg" alt="Screenshot 3" width="200"/>

## Installation

To run this project locally, follow these steps:

1. **Clone the repository:**

    ```bash
    git clone https://github.com/muhammadusmantech/HomeBrigadier.git
    cd HomeBrigadier
    ```

2. **Install dependencies:**

    ```bash
    flutter pub get
    ```

3. **Run the app:**

    ```bash
    flutter run
    ```

## Usage

Once the app is installed, you can:

- **Create and Customize Bookings:** Set up and customize service bookings.
- **Manage Appointments:** Schedule and manage service appointments.
- **Process Payments:** Make secure payments using Apple Pay or Google Pay.
- **Provide Services:** Create services and start earning as a service provider.

## Download

<a href="https://play.google.com/store/apps/details?id=com.homebrigadier.app">
  <img src="https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg" alt="Download on Google Play" width="200"/>
</a>

<a href="https://apps.apple.com/us/app/home-brigadier/id123456789">
  <img src="https://github.com/muhammadusmantech/Home-Brigadier/blob/main/assets/screenshot/download-on-the-app-store-apple-logo-svgrepo-com.svg" alt="Download on the App Store" width="200"/>
</a>

## Project Structure

- `lib/main.dart`: Entry point of the application.
- `lib/app/`: Contains the main application structure.
  - `lib/app/data/`: Contains data models.
  - `lib/app/modules/`: Contains feature modules.
    - `lib/app/modules/home/`: Contains the home module.
      - `controllers/`: Contains controllers for the home module.
      - `bindings/`: Contains bindings for the home module.
      - `views/`: Contains views for the home module.
    - `lib/app/modules/booking/`: Contains the booking module.
      - `controllers/`: Contains controllers for the booking module.
      - `bindings/`: Contains bindings for the booking module.
      - `views/`: Contains views for the booking module.
  - `lib/app/routes/`: Contains the route management.
  - `lib/app/widgets/`: Contains reusable widgets.

---

**Home Brigadier** © 2023. All rights reserved.
