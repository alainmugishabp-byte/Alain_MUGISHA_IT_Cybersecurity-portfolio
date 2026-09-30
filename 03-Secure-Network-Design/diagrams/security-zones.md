# Security Zones

```mermaid
flowchart LR
  subgraph Untrusted
    I[Internet]; G[Guest]
  end
  subgraph Semi-trusted
    D[DMZ]
  end
  subgraph Trusted
    U[Users]; S[Servers]
  end
  subgraph Highest
    M[Management]
  end
  I --> D
  U --> D
  D --> S
  M --> U & S & D
```
