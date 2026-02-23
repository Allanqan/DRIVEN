# DRIVEN

A driver booking platform where users can search for and hire private drivers in their area.

## Features
- Browse drivers by location (full-text + geocoded search)
- Filter by license type, years of experience, transmission type (manual/automatic), and price
- Book a driver for a date range
- Driver profile photos via Cloudinary
- User authentication with Devise

## Tech Stack
- Ruby 2.7 / Rails 6.1
- PostgreSQL + pg_search (full-text search)
- Geocoder (location-based search)
- Cloudinary (photo uploads)
- Devise (authentication)
- Active Storage

## Demo Credentials
- **Email:** demo@driven.app
- **Password:** password123

## Le Wagon Berlin — Final Project
Built in 2 weeks as the final project at Le Wagon Berlin coding bootcamp (January 2022).

## Local Setup
```bash
git clone https://github.com/Allanqan/DRIVEN
cd DRIVEN
bundle install
rails db:create db:migrate db:seed
rails server
```

## Author
Allan Kisuule — [echoalgoridata.no](https://echoalgoridata.no) · [github.com/La-Cappuccino](https://github.com/La-Cappuccino)