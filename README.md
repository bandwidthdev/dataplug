DataPlug: Peer-to-Peer Bandwidth Sharing Platform
Technical Overview

DataPlug enables direct internet sharing between distant peers without LAN/Bluetooth connectivity using WireGuard VPN tunnels. The solution addresses Uganda's internet affordability crisis by allowing users to share unused WiFi bandwidth with nearby data-constrained users.
Network Architecture

The system utilizes NAT traversal (Network Address Translation traversal) to establish connections between devices behind different routers/firewalls. This technique allows peers to discover their public-facing IP addresses and bypass network barriers that normally prevent direct device-to-device connections.

NAT Traversal Implementation:

    Uses STUN (Session Traversal Utilities for NAT) protocol

    Leverages public STUN servers (e.g., Google's stun.l.google.com)

    Enables direct P2P connections across separate networks

    Maintains end-to-end encryption via WireGuard

Core Components

    Device Identification

        Unique device ID generation

        No traditional signup required

        Minimal user profile storage

    Bandwidth Sharing

        Sharer-defined speed tiers (Good/Medium/Slow)

        Configurable user slots

        One-tap sharing activation

    Connection System

        WireGuard-based VPN tunnels

        Automatic NAT traversal

        Location-aware peer discovery

    Offline Operation

        Cached peer listings

        Pre-stored connection configurations

        Low-data bootstrap (<2KB initial requirement)

System Workflow

    Sharer Activation

        User enables sharing mode

        Sets speed tier and slot capacity

        Device publishes availability

    Receiver Connection

        Browse nearby sharers (cached or live)

        Select suitable peer

        Establish secure VPN tunnel

    Data Routing

        All traffic routes through sharer's connection

        End-to-end WireGuard encryption

        Automatic disconnection on poor quality

Technical Specifications

    Frontend: Flutter (iOS/Android)

    Backend: Firebase (Firestore, Cloud Functions)

    VPN Protocol: WireGuard

    Caching: Hive DB

    NAT Traversal: STUN protocol

    Security: Device-based identification + WireGuard encryption

Deployment Requirements

    Firebase project configuration

    Flutter 3.10+ environment

    Mobile devices supporting VPN connections

    Internet connectivity for initial bootstrap

Future Development

    Mesh networking capabilities

    Usage-based incentive systems

    Automated bandwidth verification

    Community moderation tools

    Network health monitoring

License

GNU Affero General Public License v3.0